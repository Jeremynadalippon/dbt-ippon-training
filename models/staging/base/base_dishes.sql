select
    identifier
    , name
    , selling_price
    , production_cost
    , type
from 
    {{ mockable_source('source', 'dishes','sample_dishes') }}