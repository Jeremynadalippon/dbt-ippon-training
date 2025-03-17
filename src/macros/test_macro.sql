{% macro print_table() %}
    {% set results = run_query("Select distinct payment_method, restaurant_identifier from DB_DBT_ADAMAKANE_DEV.SOURCE.ORDERS limit 3 ") %}

    {% do results.print_table() %}

    {% if execute %}
        {{ log("column 0 : "~results.columns[0].values(), info=true) }}
        {{ log("column 1 : "~results.columns[1].values(), info=true) }}
        {{  log("column 2 : "~results.columns, info=true) }}
    {% endif %}
{% endmacro %}