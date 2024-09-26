select
    *
from {{ source('source', 'fuzzy_orders') }}