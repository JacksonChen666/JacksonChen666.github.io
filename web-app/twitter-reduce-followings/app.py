import datetime
import os
import urllib.error
import urllib.parse
import urllib.request

import oauth2 as oauth
import tweepy
from flask import Flask, render_template, request, url_for

app = Flask(__name__)

app.debug = True

request_token_url = 'https://api.twitter.com/oauth/request_token'
access_token_url = 'https://api.twitter.com/oauth/access_token'
authorize_url = 'https://api.twitter.com/oauth/authorize'
show_user_url = 'https://api.twitter.com/1.1/users/show.json'

# Support keys from environment vars (Heroku).
app.config['APP_CONSUMER_KEY'] = os.getenv('TWAUTH_APP_CONSUMER_KEY', 'API_Key_from_Twitter')
app.config['APP_CONSUMER_SECRET'] = os.getenv('TWAUTH_APP_CONSUMER_SECRET', 'API_Secret_from_Twitter')

# alternatively, add your key and secret to config.cfg
# config.cfg should look like:
# APP_CONSUMER_KEY = 'API_Key_from_Twitter'
# APP_CONSUMER_SECRET = 'API_Secret_from_Twitter'
app.config.from_pyfile('config.cfg', silent=True)

oauth_store = {}

username = None


def filterTweets(tweetsList):
    def addToList(interactedTweet, _user):
        if not interactedTweet.author.following:
            return
        if _user.screen_name in _interacted_users.keys():
            now = datetime.datetime.utcnow()
            if ((now - _interacted_users[_user.screen_name][0].created_at) - (  # time between last saved to current
                    now - interactedTweet.created_at)).total_seconds() < 0:
                return
        _interacted_users[_user.screen_name] = (
            interactedTweet, _user, datetime.datetime.utcnow() - interactedTweet.created_at)

    _interacted_users = {}
    for _tweet in tweetsList:
        if _tweet.author == username and _tweet.in_reply_to_screen_name and _tweet.entities:
            for entity in _tweet.entities:
                if _tweet.in_reply_to_screen_name == entity.screen_name:
                    addToList(_tweet, entity)
        elif _tweet.retweeted or _tweet.favorited:
            addToList(_tweet, _tweet.author)
    return _interacted_users


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


@app.route('/start')
def start():
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
        error_message = 'Invalid response, status {status}, {message}'.format(
            status=resp['status'], message=content.decode('utf-8'))
        return render_template('error.html', error_message=error_message)

    request_token = dict(urllib.parse.parse_qsl(content))
    oauth_token = request_token[b'oauth_token'].decode('utf-8')
    oauth_token_secret = request_token[b'oauth_token_secret'].decode('utf-8')

    oauth_store[oauth_token] = oauth_token_secret
    return render_template('start.html', authorize_url=authorize_url, oauth_token=oauth_token,
                           request_token_url=request_token_url)


@app.route('/last-interactions')
def last_interactions():
    global username
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
        return render_template('error.html', error_message="oauth_token not found locally")

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

    auth = tweepy.OAuthHandler(app.config["APP_CONSUMER_KEY"], app.config["APP_CONSUMER_SECRET"])
    auth.set_access_token(real_oauth_token, real_oauth_token_secret)
    api = tweepy.API(auth, wait_on_rate_limit=True, wait_on_rate_limit_notify=True)

    utcfromtimestamp = datetime.datetime.utcfromtimestamp

    lastInteracted = []
    username = auth.get_username()
    user = api.get_user(screen_name=username)

    followings = [u for u in tweepy.Cursor(api.friends, count=200).items()]

    dms = [dm for dm in tweepy.Cursor(api.list_direct_messages, count=50).items()]
    tweets = [t for t in tweepy.Cursor(api.user_timeline, id=username, count=200, include_rts=True).items()]
    tweets.extend([t for t in tweepy.Cursor(api.favorites, id=username, count=200, include_rts=True).items()])

    interactions = filterTweets(tweets)

    cached_users = {}  # continuously fetching the users will increase the time and api usage
    for dm in dms:
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

    users = [user for tweet, user, time in interactions.values()]
    noInteractFollowings = [u for u in followings if u.following and u not in users]

    if noInteractFollowings:
        for user in noInteractFollowings:
            lastInteracted.append(
                f"<a href=\"https://twitter.com/{user.screen_name}\">\"{user.name}\" (@{user.screen_name}, "
                f"Last interaction: Undetermined)</a>")
    if interactions:
        temp = {datetime_time: user for tweet, user, datetime_time in interactions.values()}
        temp = {k: temp[k] for k in reversed(sorted(temp))}
        for time, user in temp.items():
            lastInteracted.append(
                f"<a href=\"https://twitter.com/{user.screen_name}\">\"{user.name}\" (@{user.screen_name}, "
                f"Last interaction: {strf_runningtime(time, 'minute')})</a>")

    # don't keep this token and secret in memory any longer
    del oauth_store[oauth_token], auth, api
    username = None

    return render_template('last-interactions.html', list_of_users="<br>".join(lastInteracted))


@app.errorhandler(500)
def internal_server_error(e):
    return render_template('error.html', error_message='uncaught exception'), 500


if __name__ == '__main__':
    app.run(debug=True)
