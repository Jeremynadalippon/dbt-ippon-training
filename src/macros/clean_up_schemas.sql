{% macro delete_schemas_with_prefix(prefix) %}
    {% set schemas_query %}
        SHOW SCHEMAS IN {{ target.database }}
    {% endset %}

    {% set results = run_query(schemas_query) %}

    {% if execute %}
        {% set schemas = results.rows %}
    {% else %}
        {% set schemas = [] %}
    {% endif %}

    {% for row in schemas %}
        {% set schema_name = row['databaseName'] %}
        {% if schema_name.startswith(prefix) %}
            {#DROP SCHEMA IF EXISTS {{ target.database }}.{{ schema_name }} CASCADE;#}
            {{ log('SCHEMA NAME: '~schema_name, info=true) }}
        {% endif %}
    {% endfor %}
{% endmacro %}
