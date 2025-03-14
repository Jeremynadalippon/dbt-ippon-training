{% set payment_methods = ['card','cash','meal_ticket', 'cheque'] %}
select restaurant_identifier,  
{% for payment_method in payment_methods %}
sum(case when payment_method = '{{ payment_method }}' then amount end) as {{ payment_method }}_amount,
{% endfor %}
sum(amount) as total_amount
from {{ ref('base_orders') }}
group by restaurant_identifier