{% macro mockable_source(source_name, table_name, sample_name) %}
    {% if target.name.lower() in ('ci', 'default', 'dev') %}
        {{ ref(sample_name) }}
    {% else %}
        {{ source(source_name, table_name) }}
    {% endif %}
{% endmacro %}