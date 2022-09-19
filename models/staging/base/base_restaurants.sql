select
    identifier
    , name
    , address
from 
    {{ mockable_source('source', 'restaurants','sample_restaurants') }}