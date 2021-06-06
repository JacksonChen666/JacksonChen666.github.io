{% assign loopOffset = -1 | minus: include.offset %}
{% assign loopLimit = include.amount | plus: include.offset | times: -1 %}
{% for i in (loopLimit..loopOffset) reversed %}
{% assign thing = include.csv_file[i] %}
  {% if thing.output %}
{{ thing.input_unix_time | date_to_rfc822}}: {{ thing.input | strip_html }}<br>
A{% if thing.output_unix_time %} ({{ thing.output_unix_time | date_to_rfc822}}){% endif %}: {{ thing.output }}
  {% endif %}
{% endfor %}