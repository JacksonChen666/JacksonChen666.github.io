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

{% for idea in site.data.idea %}
  {% if idea.output != "" %}
{{ idea.input_unix_time | date: "%F @ %H:%M:%S"}}: {{ idea.input }}<br>
A{% if idea.output_unix_time != "" %} ({{ idea.output_unix_time | date: "%F @ %H:%M:%S"}}){% endif %}: {{ idea.output }}
  {% endif %}
{% endfor %}

[Old ideas](old-ideas)
