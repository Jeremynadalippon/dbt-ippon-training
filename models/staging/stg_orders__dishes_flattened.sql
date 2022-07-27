with flatten_orders as (
    select
        *
        , d.value as dishes_id
    from {{ref('base_orders')}} as o
        table(flatten(o.dishes_ids)) as d
)

select 
    d.identifer
    , d.name
    , count(*)                        as nb_ordered
    , sum(d.selling_price)            as global_turnover
    , sum(d.production_price)         as global_profit
from 
    flatten_orders         as o
left join 
    {{ref('base_dishes')}} as d
        on o.dishes_id = d.identifier
group by 1,2