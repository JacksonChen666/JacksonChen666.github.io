---
title: Site Idex
description: The site's pages
layout: default
---
<style type="text/css">
    @keyframes hue-colorful {
        100% {
            filter: hue-rotate(360deg);
        }
    }
    #colorful{animation: hue-colorful 300s linear normal}
</style>

## Site Index

{% for i in site.pages %}{% if i.name contains ".md" %}
- [{{i.name | replace: "-", " " | replace: ".md", "" | capitalize}}]({{i.url | replace: ".html", ""}}){% endif %}{% endfor %}
