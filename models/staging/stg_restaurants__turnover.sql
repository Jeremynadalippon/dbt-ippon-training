{% set payment_methods = dbt_utils.get_column_values(table=source('source', 'orders'), column='payment_method') %}

with orders as (
    select 
        restaurant_identifier,
        {% for payment_method in payment_methods %}
        sum(case when payment_method = '{{ payment_method }}' then amount end) as {{payment_method}}_amount,
        {% endfor %}
        sum(amount) as turnover
    from    
        {{ ref('base_orders') }}
    group by restaurant_identifier
)

select
    o.restaurant_identifier as restaurant_identifier, 
    r.name as name, 
    r.address as address, 
    {% for payment_method in payment_methods %}
    o.{{payment_method}}_amount as {{payment_method}}_amount,
    {% endfor %}
    o.turnover
from
    {{ ref('base_restaurants') }} as r
join orders as o on  r.identifier = o.restaurant_identifier