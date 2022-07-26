select 
    identifier
    , restaurant_identifier
    , total_price
from 
    {{source('restaurants', 'orders')}}