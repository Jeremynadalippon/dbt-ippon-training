with flatten_orders as (
    select
        o.*
        , d.value as dishes_id
    from {{ref('base_orders')}} as o
        ,table(flatten(input => parse_json(o.dishes_ids),outer => true)) as d
)

select 
    d.identifier
    , d.name
    , count(*)                        as nb_ordered
    , sum(d.selling_price)            as global_turnover
    , sum(d.production_cost)          as global_profit
from 
    flatten_orders         as o
left join 
    {{ref('base_dishes')}} as d
        on o.dishes_id = d.identifier
group by 1,2