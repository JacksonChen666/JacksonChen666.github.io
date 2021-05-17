{% assign loopOffset = -1 | minus: include.offset %}
{% assign loopLimit = include.amount | plus: include.offset | times: -1 %}
{% for i in (loopLimit..loopOffset) reversed %}
{% assign thing = include.csv_file[i] %}
  {% if thing.output %}
{{ thing.input_unix_time | date: "%F @ %H:%M:%S"}}: {{ thing.input | strip_html | newline_to_br }}<br>
A{% if thing.output_unix_time %} ({{ thing.output_unix_time | date: "%F @ %H:%M:%S"}}){% endif %}: {{ thing.output | newline_to_br }}
  {% endif %}
{% endfor %}