{% test test_value_is_positive(model, column_name) %}

    {{ config(severity = 'warn') }}

    select *
    from {{ model }}
    where {{ column_name }} < 0

{% endtest %}