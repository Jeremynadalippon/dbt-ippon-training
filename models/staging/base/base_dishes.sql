select
    identifier
    , name
    , selling_price
    , production_price
    , type
from 
    {{ source('restaurants', 'dishes') }}