---
title: Site Idex
description: The site's pages
---
## Site Index

{% for i in site.pages %}{% if i.name contains ".md" %}
- [{{i.name | replace: "-", " " | replace: ".md", "" | capitalize}}]({{i.url | replace: ".html", ""}}){% endif %}{% endfor %}
