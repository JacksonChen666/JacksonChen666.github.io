---
title: Ideas
description: Giving ideas to JacksonChen666 on this page since i don't know
---
{% include post_text.md textarea_name="i" textarea_max_length=100000 textarea_columns=80 textarea_rows=20 textarea_placeholder="Ideas or Suggestions" submit_value="GIVE IDEA" %}
All time stamps are in UTC (+0000) timezone<br>
Date format: RFC822 standard<br>

{% if site.data.idea.count != 0 %}
{% include questions_ideas_csv.md csv_file=site.data.idea amount=100 offset=0 %}
{% else %}
Ummmm, something might be wrong. Please contact the website owner for more about no ideas at all.
{% endif %}

{% if site.data.idea.count >= 100 %}
[More ideas](more-ideas)
{% endif %}
