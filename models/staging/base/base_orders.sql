select distinct
    identifier
    , restaurant_identifier
    , amount
from
    {{ source('restaurants', 'orders') }}
