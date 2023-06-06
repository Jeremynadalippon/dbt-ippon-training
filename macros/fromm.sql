{% macro mockable_source(name, table) %}
    {%- if target.name == 'dev' %}
        {{ref("restaurants")}}
    {%- elif target.name == 'prod' %}
        {{source(name, table)}}
    {%- endif %}
{% endmacro %}