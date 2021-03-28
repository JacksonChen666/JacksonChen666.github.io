{% for thing in site.data.idea %}
  {% if thing.output  %}
{{ thing.input_unix_time | date: "%F @ %H:%M:%S"}}: {{ thing.input }}<br>
A{% if thing.output_unix_time %} ({{ thing.output_unix_time | date: "%F @ %H:%M:%S"}}){% endif %}: {{ thing.output }}
  {% endif %}
{% endfor %}