// Source: https://stackoverflow.com/a/45342740/13104233
var channelID = "UCut1u2mQy5LMZw5UKgOQKjA";
var reqURL = "https://www.youtube.com/feeds/videos.xml?channel_id=";

// Fetching: https://www.codegrepper.com/code-examples/javascript/get+json+data+from+url+javascript
function getLatestVideoID(after) {
    getChannelInformation(function (jsonData) {
        var link = jsonData.items[0].link;
        var id = link.substr(link.indexOf("=") + 1);
        after(id);
    });
}

function getChannelInformation(after) {
    fetch("https://api.rss2json.com/v1/api.json?rss_url=" + encodeURIComponent(reqURL) + channelID)
        .then(res => res.json())
        .then((jsonData) => {
            after(jsonData);
        })
        .catch(err => { throw err });
}