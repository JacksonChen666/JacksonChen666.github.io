---
title: Old Ideas
description: Old suggested ideas
layout: default
---
[More current ideas](ideas)

<div id="GIVE-IDEA">
    <form action="https://JacksonChen666.000webhostapp.com/submit.php" method="post">
        <textarea name="i" maxlength="100000" cols="40" rows="10" placeholder="Idea or Suggestions"></textarea><br>
        <input type="submit" value="GIVE IDEA" name="formSubmit">
    </form>
</div>
All time stamps are in UTC (+0) timezone

{% if site.data.idea.count >= 100 %}
{% include questions_ideas_csv.md csv_file=site.data.idea amount=900 offset=100 %}
{% else %}
Hey, there's less than a hundred ideas. Leave me alone.
{% endif %}