---
title: Posts
description: Blog posts by JacksonChen666 basically
layout: default
---
{% for post in site.posts %}
- ## [{{ post.title }} - {{ post.date | date_to_string }}]({{ post.url }}) {% if post.draft %}(Draft){% endif %}
    {{ post.excerpt }}
{% endfor %}