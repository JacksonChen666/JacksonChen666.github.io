// Source: https://stackoverflow.com/a/45342740/13104233
var channelID = "UCut1u2mQy5LMZw5UKgOQKjA";
var reqURL = "https://www.youtube.com/feeds/videos.xml?channel_id=";
// $.getJSON("https://api.rss2json.com/v1/api.json?rss_url=" + encodeURIComponent(reqURL)+channelID, function(data) {
//    var link = data.items[0].link;
//    var id = link.substr(link.indexOf("=")+1);
// $("#youtube_video").attr("src","https://www.youtube-nocookie.com/embed/"+id + "?showinfo=0&rel=0");
// });

// Fetching: https://www.codegrepper.com/code-examples/javascript/get+json+data+from+url+javascript
function getLatestVideo(after) {
    fetch("https://api.rss2json.com/v1/api.json?rss_url=" + encodeURIComponent(reqURL) + channelID)
    .then(res => res.json())
    .then((data) => {
        var link = data.items[0].link;
        var id = link.substr(link.indexOf("=")+1);
        after(id);
    })
    .catch(err => { throw err });
}