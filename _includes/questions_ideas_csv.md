{% assign loopOffset = -1 | minus: include.offset %}
{% assign loopLimit = include.amount | plus: include.offset | times: -1 %}
{% for i in (loopLimit..loopOffset) reversed %}
{% assign thing = include.csv_file[i] %}
  {% if thing.output %}
<div>
{% capture stuff %}
{{ thing.input_unix_time | date_to_rfc822}}: {{ thing.input | strip_html }}
A{% if thing.output_unix_time %} ({{ thing.output_unix_time | date_to_rfc822}}){% endif %}: {{ thing.output }}{% endcapture %}
{{ stuff | newline_to_br }}
</div>
  {% endif %}
{% endfor %}