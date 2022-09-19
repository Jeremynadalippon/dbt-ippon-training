select
    identifier
    , name
    , selling_price
    , production_cost
    , type
from 
    {{ source('restaurants', 'dishes') }}