---
title: Old Ideas
description: Old suggested ideas
---
[More current ideas](ideas)

{% include post_text.md textarea_name=i textarea_max_length=100000 textarea_columns=40 textarea_rows=10 textarea_placeholder="Ideas or Suggestions" submit_value="GIVE IDEA" %}
{% if site.data.idea.count >= 100 %}
{% include questions_ideas_csv.md csv_file=site.data.idea amount=900 offset=100 %}
{% else %}
Hey, there's less than a hundred ideas. Leave me alone.
{% endif %}