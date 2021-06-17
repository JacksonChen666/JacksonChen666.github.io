---
title: Old Questions
description: Old questions asked by the people of idk
---
[Back to recent questions](questions)

{% include post_text.md textarea_name=q textarea_max_length=10000 textarea_columns=20 textarea_rows=5 textarea_placeholder="Questions" submit_value="ASK" %}
{% if site.data.question.size >= 100 %}
{% include questions_ideas_csv.md csv_file=site.data.question amount=1000 offset=100 %}
{% else %}
Hey, there's less than a hundred questions. Leave me alone.
{% endif %}
