
{% set payment_methods_query %}
select distinct payment_method from reapp_data.payments
order by 1
{% endset %}

{% set results = run_query(payment_methods_query) %}

{% if execute %}
    {# Return the first column #}
    {% set results_list = results.columns[0].values() %}
{% else %}
    {% set results_list = [] %}
{% endif %}

select
    order_id,
    {% for payment_method in results_list %}
        sum(case when payment_method = '{{ payment_method }}' then amount end) as {{ payment_method }}_amount,
    {% endfor %}
    sum(amount) as total_amount
from
    {{ ref('base_orders') }}
group by 1
