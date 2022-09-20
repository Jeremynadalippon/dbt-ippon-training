select
    identifier
    , restaurant_identifier
    , total_price
from
    {{ source('sources', 'orders') }}
