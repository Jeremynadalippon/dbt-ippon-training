{% macro from_stream(source_name, stream_name, sync_name, sample_sync_name) %}
    {{ create_stream_if_not_exists(
            source_table=sync_name, 
            source_name=source_name,
            stream_name=stream_name) 
    }}
    {% if var('is_backload') %}
        {{ source(source_name, sync_name) }}
    {% else %}
        {{ mockable_stream(source_name, stream_name, sample_sync_name) }}
    {% endif %}
{% endmacro %}


{%- macro stream_exists(source_name, stream_name) -%}
    {%- set stream_ref = source(source_name, stream_name) -%}
    {%- set stream_schema = stream_ref.schema -%}
    {%- set stream_database = stream_ref.database -%}

    {% call statement('show_stream', fetch_result=True) -%}
        show streams like '{{ stream_name }}' in {{stream_database}}.{{stream_schema}};
    {%- endcall %}
    {%- set show_result = load_result('show_stream') -%}
    {{ return(show_result['data']) }}
{%- endmacro -%}

{%- macro create_stream_if_not_exists(
                                source_table, 
                                source_name,
                                stream_name) -%}
    {%- set stream_exists = stream_exists(source_name, stream_name) -%}
    {% if not stream_exists %}
        {% set query %}
            create stream {{ source(source_name, stream_name )}} on table {{ source(source_name, source_table) }}
            append_only=true;
        {% endset %}
        {% do run_query(query) %}
        {{ log("Created stream " ~ stream_name ~ " on table " ~ source_table ~ ".") }}
    {%- else -%}
        {{ log("Stream " ~ stream_name ~ " on table " ~ source_table ~ "already exists.") }}
    {% endif %}
{%- endmacro -%}
