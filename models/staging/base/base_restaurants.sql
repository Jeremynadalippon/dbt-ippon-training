select
    identifier
    , name
    , address
from
    {{ source('restaurants', 'restaurants') }}
