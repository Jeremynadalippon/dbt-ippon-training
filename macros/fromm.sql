{% macro mockable_source(name, table) %}
    {%- if target.name == 'dev' %}
        {{ref("sample.csv")}}
    {%- elif target.name == 'prod' %}
        {{source(name, table)}}
    {%- endif %}
{% endmacro %}