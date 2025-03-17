{% macro mockable_source(source_name,table_name) %}
  {% if target.name == "prod" %}
    {{ source(source_name,table_name) }}
  {% else %}
     {{ ref("sample_"~table_name) }}    
  {% endif %}
{% endmacro %}