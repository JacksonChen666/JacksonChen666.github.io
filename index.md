---
title: Home
layout: default
---
<script src="randomQuotes.js"></script>
<script src="youtube-latest.js"></script>

## Hello, My name is Jackson
<small id="random_quotes"><noscript>"Please enable JavaScript to view these quotes" -JacksonChen666</noscript></small>

Website made by Jackson. Big love and support to Jackson.

Just another person on the planet you say that likes weird stuff right? No I am more than that. I like lots of stuff some might not like, and expect.<br>
I was born in Hungary, and I come from a Chinese culture which is a bit different, but I like food that is not Chinese for some reason.<br>
On this website, you can find stuff like [my life](life) where you could learn more about me.

<div id="latest_video">
	<a id="latestVideoLink">Oh hey, you should check out my maybe new video here</a>
</div>
<!-- <noscript><style>#latest_video{displat:none}</style>[Oh hey, you could check out my youtube channel](https://youtube.com/JacksonChen666)</noscript> -->

That's all for here, you can continue exploring as I continue creating and expanding this website lol.<br>
While you are here, you might as well help me give some ideas so I can continue creating. You can also use [GitHub](https://github.com) for it.

[Website suggestions and ideas](ideas)

[Website issues](https://github.com/JacksonChen666/JacksonChen666.github.io/issues)

<script type="text/javascript">
    var quotesLists = [
        "How hard is it to use a computer?",
        "I like bill wurtz",
        "please stop looking at my twitter banner",
        "hi youtube",
        "Wait, am I a developer?",
        "Wait, am I a programmer?",
        "I have reached the state of unmotivated boredom",
        "Coding is fun",
        "Why are still alive",
        "the third worst thing to ever happen to those orphans", // the orphans were killed
        "<a href='https://twitter.com/jacksonchen666/status/1303089255007350787'>Mark Rober</a>",
        "What a nice day",
        "I am not interesting...",
        "distraction is inevitable",
        "Hello?",
        "haha very funny",
        "Do you like my website?",
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
        "why won't this WORK",
        "new video coming soon. maybe. maybe not. maybe i'm gone. idk",
        "no, I would rather destroy humanity other than signing up for an email list",
        "Please enable JavaScript to view these quotes",
        "RSS in 2021",
        "Posts? Yeah blogs but like it's something"
    ]
    var endQuotes = "JacksonChen666";
    addQuotesListener("click", "random_quotes", quotesLists, endQuotes);
    constantRandomQuotes(quotesLists, endQuotes);
    randomQuotes(["Welcome to my new domain!"], "JacksonChen666");
    getLatestVideoID(function(id) {
        document.querySelector("#latestVideoLink").setAttribute("href", "https://youtu.be/" + id);
    });
</script>
<hr>

{% include post_list.md amount=10 %}