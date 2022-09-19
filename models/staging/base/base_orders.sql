select distinct
    identifier
    , restaurant_identifier
    , dishes_ids
    , payment_method
    , amount
    , created_at
from 
    {{ from_stream("sources", "stream_orders", "orders", "sample_orders") }}