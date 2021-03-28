---
title: Ideas
description: Giving ideas to JacksonChen666 on this page since i don't know
layout: default
---
<div id="GIVE IDEA">
    <form action="https://JacksonChen666.000webhostapp.com/submit.php" method="post">
        <textarea name="i" maxlength="100000" cols="80" rows="20" placeholder="Idea or Suggestions"></textarea><br>
        <input type="submit" value="GIVE IDEA" name="formSubmit">
    </form>
</div>

All time stamps are in UTC (+0000) timezone<br>
Date format: [YYYY/MM/DD @ hh:mm:ss]<br>

{% if site.data.idea.count != 0 %}
{% include questions_ideas_csv.md csv_file=site.data.idea amount=100 offset=0 %}
{% else %}
Ummmm, something might be wrong. Please contact the website owner for more about no ideas at all.
{% endif %}

{% if site.data.idea.count >= 100 %}
[More ideas](ideas-2)
{% endif %}
