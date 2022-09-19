select distinct
    identifier
    , restaurant_identifier
    , dishes_ids
    , payment_method
    , amount
    , created_at
from 
    {{ source('restaurants', 'orders') }}