{% macro default__generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema.lower() -%}
    {%- if custom_schema_name is none -%}

        {{ default_schema }}
        
    {%- else -%}
        {% if default_schema == 'prod' %}

            {{ custom_schema_name }}

        {% else %}

            {{ default_schema }}_{{ custom_schema_name | trim }}

        {% endif %}
    {%- endif -%}

{%- endmacro %}
