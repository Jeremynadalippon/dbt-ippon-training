select
    name
from
    {{ ref('restaurants') }}
where
    OPEN_ON_SUNDAYS = True