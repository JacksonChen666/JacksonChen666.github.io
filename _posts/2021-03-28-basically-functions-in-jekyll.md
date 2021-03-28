---
title: Basically functions in Jekyll
layout: post
date: '2021-03-28 15:26:45 +0200'
category: Website
author: JacksonChen666
---
So, while I was researching reading from csv files, I stumbled upon the include feature in jekyll.

Here's how it works:

You have a page in `_includes`, which contains liquid code instead of normal html, which can be used in other pages too.
If you think about it, it's just basically functions for jekyll.

Now you may ask: "How do you include the page in other pages then?"
You include the pages with this following code in other pages: {{ "{% include page.md variables='letters and words' " }}%}

That's the simplest example. But, here's how I reused it: {{ "{% include post_list.md amount=10 " }}%}

If you look into the source code, well the variable is different for other pages. That's because I don't want the user having slow load times (if they experience that anyways.)
