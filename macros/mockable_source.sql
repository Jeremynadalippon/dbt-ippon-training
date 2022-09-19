{% macro mockable_source(source_name, table_name, mocked_table_file_name) %}
  {% if target.name == 'ci' or target.name == 'default' or target.name == 'dev' %}
    (select * from {{ref(mocked_table_file_name)}})
  {% else %}
    {{ source(source_name, table_name) }}
  {% endif %}
{% endmacro %}