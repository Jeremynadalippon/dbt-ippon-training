select
    restaurant_identifier, name, address, sum(amount) as turnover

from {{ ref("base_restaurants") }} as res
join {{ ref("base_orders") }} as ord
    on ord.restaurant_identifier  = res.identifier
group by restaurant_identifier, name, address