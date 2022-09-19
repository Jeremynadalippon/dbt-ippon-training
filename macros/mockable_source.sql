{% macro mockable_source(source_name, table_name, sample_table_name) %}
    {%- set target_name = target.name.lower() -%}
    {% if target_name in ['ci','default', 'dev'] %}
        {{ ref(sample_table_name) }}
    {% else %}
        {{ source(source_name, table_name) }}
    {% endif %}
{% endmacro %}


{% macro mockable_stream(source_name, stream_name, sample_sync_name) %}
    {%- set target_name = target.name.lower() -%}
    {% if target_name in ['ci'] %}
        {{ ref(sample_sync_name) }}
    {% else %}
        {{ source(source_name, stream_name) }}
    {% endif %}
{% endmacro %}