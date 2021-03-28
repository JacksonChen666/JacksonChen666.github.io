{% for post in site.posts limit: include.amount %}
- ## [{{ post.title }} - {{ post.date | date_to_string }}]({{ post.url }}) {% if post.draft %}(Draft){% endif %}
    {{ post.excerpt }}
{% endfor %}