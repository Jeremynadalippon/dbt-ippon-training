select
    *
from
    {{ ref('restaurants') }}
where
    open_on_sunday