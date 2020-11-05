import datetime
import hashlib
import random
import threading
import urllib.error
import urllib.parse
import urllib.request

import oauth2 as oauth
import tweepy
from flask import Flask, make_response, render_template, request, url_for, redirect

app = Flask(__name__)

request_token_url = 'https://api.twitter.com/oauth/request_token'
access_token_url = 'https://api.twitter.com/oauth/access_token'
authorize_url = 'https://api.twitter.com/oauth/authorize'
show_user_url = 'https://api.twitter.com/1.1/users/show.json'

# Support keys from environment vars (Heroku).
# app.config['APP_CONSUMER_KEY'] = os.getenv('TWAUTH_APP_CONSUMER_KEY', 'API_Key_from_Twitter')
# app.config['APP_CONSUMER_SECRET'] = os.getenv('TWAUTH_APP_CONSUMER_SECRET', 'API_Secret_from_Twitter')

# alternatively, add your key and secret to config.cfg
# config.cfg should look like:
# APP_CONSUMER_KEY = 'API_Key_from_Twitter'
# APP_CONSUMER_SECRET = 'API_Secret_from_Twitter'
app.config.from_pyfile('config.cfg', silent=True)

oauth_store = {}

temp_data = {}  # cookie identifier: data
in_progress = {}  # cookie identifier: thread, step, processing n of thing, amount to process


def strf_runningtime(tdelta, round_period='second'):
    """
    https://stackoverflow.com/a/64257852/13104233
    timedelta to string,  use for measure running time
    attend period from days downto smaller period, round to minimum period
    omit zero value period
    """
    period_names = ('day', 'hour', 'minute', 'second', 'millisecond')
    if round_period not in period_names:
        raise Exception(f'round_period "{round_period}" invalid, should be one of {",".join(period_names)}')
    period_seconds = (86400, 3600, 60, 1, 1 / pow(10, 3))
    period_desc = ('days', 'hours', 'mins', 'secs', 'msecs')
    round_i = period_names.index(round_period)

    s = ''
    remainder = tdelta.total_seconds()
    for i in range(len(period_names)):
        q, remainder = divmod(remainder, period_seconds[i])
        if int(q) > 0:
            if not len(s) == 0:
                s += ' '
            s += f'{q:.0f} {period_desc[i]}'
        if i == round_i:
            break
        if i == round_i + 1:
            s += f'{remainder} {period_desc[round_i]}'
            break
    return s


@app.route('/')
def hello():
    return render_template('index.html')


@app.route('/authorize')
def authorize():
    # note that the external callback URL must be added to the whitelist on
    # the developer.twitter.com portal, inside the app settings
    app_callback_url = url_for('last_interactions', _external=True)

    # Generate the OAuth request tokens, then display them
    consumer = oauth.Consumer(
        app.config['APP_CONSUMER_KEY'], app.config['APP_CONSUMER_SECRET'])
    client = oauth.Client(consumer)
    resp, content = client.request(request_token_url, "POST", body=urllib.parse.urlencode({
        "oauth_callback": app_callback_url}))

    if resp['status'] != '200':
        error_message = f'Invalid response, status {resp["status"]}, {content.decode("utf-8")}'
        return render_template('error.html', error_message=error_message)

    request_token = dict(urllib.parse.parse_qsl(content))
    oauth_token = request_token[b'oauth_token'].decode('utf-8')
    oauth_token_secret = request_token[b'oauth_token_secret'].decode('utf-8')

    oauth_store[oauth_token] = oauth_token_secret
    return redirect(f"{authorize_url}?oauth_token={oauth_token}")


@app.route("/last-interactions")
def show_last_interactions():
    try:
        return render_template("last-interactions.html", last_interactions=temp_data.pop(request.cookies.get('id')))
    except KeyError:
        return redirect("/")


@app.route("/please-wait")
def please_wait():
    cookie = request.cookies.get("id")
    if cookie in temp_data.keys():
        return redirect("last-interactions")
    elif cookie in in_progress.keys():
        step, item_n, item_max = in_progress[cookie][1:]
        return render_template("please-wait.html", step=step, item_n=item_n, item_max=item_max)
    else:
        return redirect("/")


@app.route('/process-last-interactions')
def last_interactions():
    def process_last_interactions(cookie_data):
        def filterTweets(tweetsList):
            def addToList(interactedTweet, _user):
                if not interactedTweet.author.following:
                    return
                if _user.screen_name in _interacted_users.keys():
                    _now = datetime.datetime.utcnow()
                    if ((_now - _interacted_users[_user.screen_name][0].created_at) - (
                            _now - interactedTweet.created_at)).total_seconds() < 0:
                        return
                _interacted_users[_user.screen_name] = (
                    interactedTweet, _user, datetime.datetime.utcnow() - interactedTweet.created_at)

            _interacted_users = {}
            in_progress[cookie_data][3] = len(tweetsList)
            for _tweet in tweetsList:
                in_progress[cookie_data][2] += 1
                if _tweet.author == username and _tweet.in_reply_to_screen_name and _tweet.entities:
                    for entity in _tweet.entities:
                        if _tweet.in_reply_to_screen_name == entity.screen_name:
                            addToList(_tweet, entity)
                elif _tweet.retweeted or _tweet.favorited:
                    addToList(_tweet, _tweet.author)
            in_progress[cookie_data][2] = 0
            return _interacted_users

        auth = tweepy.OAuthHandler(app.config["APP_CONSUMER_KEY"], app.config["APP_CONSUMER_SECRET"])
        auth.set_access_token(real_oauth_token, real_oauth_token_secret)
        api = tweepy.API(auth, wait_on_rate_limit=True, wait_on_rate_limit_notify=True)

        utcfromtimestamp = datetime.datetime.utcfromtimestamp

        in_progress[cookie_data][1] += 1
        username = auth.get_username()
        user = api.get_user(screen_name=username)

        in_progress[cookie_data][1] += 1
        followings = [u for u in tweepy.Cursor(api.friends, count=200).items()]

        in_progress[cookie_data][1] += 1
        dms = [dm for dm in tweepy.Cursor(api.list_direct_messages, count=50).items()]
        tweets = [t for t in tweepy.Cursor(api.user_timeline, id=username, count=200, include_rts=True).items()]
        tweets.extend([t for t in tweepy.Cursor(api.favorites, id=username, count=200, include_rts=True).items()])

        in_progress[cookie_data][1] += 1
        interactions = filterTweets(tweets)

        in_progress[cookie_data][1] += 1
        cached_users = {}  # continuously fetching the users will increase the time and api usage
        in_progress[cookie_data][3] = len(dms)
        for dm in dms:
            in_progress[cookie_data][2] += 1
            user_id = dm.message_create["target"]["recipient_id"] if dm.message_create["sender_id"] == user.id else \
                dm.message_create["sender_id"]
            dm_user = cached_users[user_id] if user_id in cached_users.keys() else api.get_user(id=user_id)
            cached_users[user_id] = dm_user
            if not dm_user.following:
                continue
            creation_time = utcfromtimestamp(int(dm.created_timestamp[:-3]))
            if dm_user.screen_name in interactions.keys():
                now = datetime.datetime.utcnow()
                old_creation_time = interactions[dm_user.screen_name][0].created_at if isinstance(
                    interactions[dm_user.screen_name][0], tweepy.Status) else utcfromtimestamp(
                    int(interactions[dm_user.screen_name][0].created_timestamp[:-3]))
                if ((now - old_creation_time) - (now - creation_time)).total_seconds() < 0:
                    continue
            interactions[dm_user.screen_name] = (dm, dm_user, datetime.datetime.utcnow() - creation_time)
        del cached_users

        in_progress[cookie_data][1] += 1
        users = [user for tweet, user, time in interactions.values()]
        noInteractFollowings = [u for u in followings if u.following and u not in users]

        in_progress[cookie_data][1] += 1
        lastInteractions = []

        if noInteractFollowings:
            for user in noInteractFollowings:
                lastInteractions.append(f"<a href=\"https://twitter.com/{user.screen_name}\" target=\"_blank\">{user.name} (@"
                                        f"{user.screen_name}, Last interaction: Undetermined)</a>")
        if interactions:
            _temp = {datetime_time: user for tweet, user, datetime_time in interactions.values()}
            _temp = {k: _temp[k] for k in reversed(sorted(_temp))}
            for time, user in _temp.items():
                lastInteractions.append(
                    f"<a href=\"https://twitter.com/{user.screen_name}\" target=\"_blank\">{user.name} (@{user.screen_name}, "
                    f"Last interaction: {strf_runningtime(time, 'minute')})</a>")
        temp_data[cookie_data] = "<br>".join(lastInteractions)
        del in_progress[cookie_data]

    # Accept the callback params, get the token and call the API to
    # display the logged-in user's name and handle
    oauth_token = request.args.get('oauth_token')
    oauth_verifier = request.args.get('oauth_verifier')
    oauth_denied = request.args.get('denied')

    # if the OAuth request was denied, delete our local token
    # and show an error message
    if oauth_denied:
        if oauth_denied in oauth_store:
            del oauth_store[oauth_denied]
        return render_template('error.html', error_message="the OAuth request was denied by this user")

    if not oauth_token or not oauth_verifier:
        return render_template('error.html', error_message="callback param(s) missing")

    # unless oauth_token is still stored locally, return error
    if oauth_token not in oauth_store:
        return hello()

    oauth_token_secret = oauth_store[oauth_token]

    # if we got this far, we have both callback params and we have
    # found this token locally

    consumer = oauth.Consumer(app.config['APP_CONSUMER_KEY'], app.config['APP_CONSUMER_SECRET'])
    token = oauth.Token(oauth_token, oauth_token_secret)
    token.set_verifier(oauth_verifier)
    client = oauth.Client(consumer, token)

    resp, content = client.request(access_token_url, "POST")
    access_token = dict(urllib.parse.parse_qsl(content))

    # These are the tokens you would store long term, someplace safe
    real_oauth_token = access_token[b'oauth_token'].decode('utf-8')
    real_oauth_token_secret = access_token[b'oauth_token_secret'].decode('utf-8')

    temp_hash = hashlib.sha512(
        bytes(real_oauth_token + real_oauth_token_secret + str(random.uniform(-10000000, 10000000)), "utf8")).hexdigest()

    # don't keep this token and secret in memory any longer
    del oauth_store[oauth_token]

    response = make_response(redirect("please-wait"))
    response.set_cookie('id', temp_hash)

    temp = threading.Thread(target=process_last_interactions, args=[temp_hash])
    in_progress[temp_hash] = [temp, 0, 0, 0]
    temp.start()
    return response


@app.errorhandler(500)
def internal_server_error(e):
    return render_template('error.html', error_message=f'uncaught exception {str(e)}'), 500


if __name__ == '__main__':
    app.run(host="0.0.0.0")
