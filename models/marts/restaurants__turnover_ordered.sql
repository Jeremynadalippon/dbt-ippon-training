select
    restaurant_identifier,
    name,
    address,
    turnover
from
    {{ ref('stg_restaurants__turnover') }}
order by turnover DESC
limit {{ var('nb_restaurants_to_show')}}