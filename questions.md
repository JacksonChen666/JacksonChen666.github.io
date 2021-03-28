---
title: Questions
descriptions: Questions for JacksonChen666
layout: default
---
<form action="https://jacksonchen666.000webhostapp.com/Submit.php" method="post">
    <textarea name="q" maxlength="10000" cols="40" rows="10" for='questions' placeholder="Questions"></textarea><br>
    <input type="submit" value="ASK" name="formSubmit" for='questions'>
</form>

All time stamps are in UTC (+0000) timezone<br>
Date format: [YYYY/MM/DD @ hh:mm:ss]<br>

{% if site.data.question.count != 0 %}
{% include questions_ideas_csv.md csv_file=site.data.question amount=100 offset=0 %}
{% else %}
Ummmm, something might be wrong. Please contact the website owner for more about no questions at all.
{% endif %}

{% if site.data.quesiton.count >= 100 %}
[More questions](questions-2)
{% endif %}
