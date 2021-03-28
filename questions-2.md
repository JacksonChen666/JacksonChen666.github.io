---
title: Old Questions
description: Old questions asked by the people of idk
layout: default
---
[Back to recent questions](questions)<br>

<div id="AS">
    <form action="https://JacksonChen666.000webhostapp.com/submit.php" method="post">
        <textarea name="q" maxlength="10000" cols="20" rows="5" placeholder="Question"></textarea><br>
        <input type="submit" value="ASK" name="formSubmit">
    </form>
</div>

{% if site.data.question.count >= 100 %}
{% include questions_ideas_csv.md csv_file=site.data.question amount=900 offset=100 %}
{% else %}
Hey, there's less than a hundred questions. Leave me alone.
{% endif %}
