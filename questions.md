---
title: Questions
descriptions: Questions for JacksonChen666
---
{% include post_text.md textarea_name="q" textarea_max_length=10000 textarea_columns=40 textarea_rows=10 textarea_placeholder="Questions" submit_value="ASK" %}

{% if site.data.question.size %}
{% include questions_ideas_csv.md csv_file=site.data.question amount=100 offset=0 %}
{% else %}
Ummmm, something might be wrong. Please contact the website owner for more about no questions at all.
{% endif %}

{% if site.data.question.size >= 100 %}
[More questions](more-questions)
{% endif %}
