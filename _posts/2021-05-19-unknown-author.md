---
title: Unknown Author
permalink: /unknown-author
author: <a href='/unknown-author'>Unknown Author</a> (actually JacksonChen666)
date: '2021-05-19 17:44:29 +0200'
category: Website
---
## But who is unknown author??
*Unknown Author*s are posts written by someone who didn't declare theirselves as who they are (but not who they *really* are).
Unknown Authors often are often mistakes made again (reeeeeeeee). You should [make an issue]({{ site.github.issues_url }}) about the missing author, and link the post that contains missing authors.

## But I am the author!
Please include evidence and proof that you are when submitting an issue.

Evidence and proof are required to be:
- Online and present, primarily **NOT** via the [time machine](https://web.archive.org) (unless the page is no longer available).
- Not from yourself (not being very strict here, exceptions are git commits on this [site]({{ site.github.repository_url }}))

## What happens when submitting and issue
When you submit an issue for a missing author, whoever gets assigned to the issue will try their best to trace back who commited the post to the repository, via git history, online sources, etc.
If they find the author and confirm that it really is that person, they will add the author to the post, and close the issue.

Please do not open multiple issues about the same post. **Otherwise you're just annoying.**

## Transparency (and so I don't forget how to)
When a user submits an issue that states that a post has a missing author, you must check if the linked post is actually linking to jacksonchen666.com before continuing.

You should do the URL check or else you might fall for a phising link for your IP address, fingerprints, etc, which isn't good.
If a user submits an missing author issue and links outside jacksonchen666.com anyways, then alert/ping JacksonChen666 to delete the issue if you cannot, due to potentially intential misuse of the issues tracker. The issue must also lose all of it's labels and marked as `invalid` and `wontfix`, if you do not have the permission to delete issues but change labels.

Assuming the issue has passed the URL check, then check for any URLs the author of the issue has provided if they claim that they wrote the post.
The sources must be at least a week old, from a reputable site (image sharing sites are not counted as reputable because sources then come from the issue author), and research about the site itself, making sure that it is not coming from the author of the issue. If the sources are coming from the issue author, discard the sources as `cannot be verified`.
Sources older than a month may need more research but generally more trusted (unless it's an image sharing site, again).

Finally after checking sources from issue author (if any), you aren't done (sorry not sorry), and you will need to check who commited the article by viewing the history of the post file.
You can go on the file contents, and go into the history there, and github should show you. For CLI users, `git log <filename>` does the job too.
Then find the earliest commit that populates most of the post out of all others (can be done with `git blame` if changes after are minimal), and check for the author. You should also check the author's profile to see if they have any past history too.

After confirming that yes, that commit is the one, then put the author's github username/normal name (whatever they prefered) as the author, and comment close the issue with the author linked.