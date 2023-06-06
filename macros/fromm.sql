{% macro mockable_source(name, table) %}
    {%- if target.name == 'dev' %}
        {{ref("sample")}}
    {%- elif target.name == 'prod' %}
        {{source(name, table)}}
    {%- endif %}
{% endmacro %}