
select
    name
    , sum(nb_ordered) / count( distinct date_trunc('day', hour))        as nb_ordered_daily_avg
    , sum(global_turnover) / count( distinct date_trunc('day', hour))   as global_turnover_daily_avg
    , sum(global_profit) / count( distinct date_trunc('day', hour))     as global_profit_daily_avg
from
    {{ ref('restaurants__benefit_orders_hourly') }}
group by
    name
order by
    global_profit_daily_avg desc