select
    identifier
    , restaurant_identifier
    , amount
from
    {{ source('sources', 'orders') }}
