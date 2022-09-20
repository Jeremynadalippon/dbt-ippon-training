select
    *
from
    {{ source('restaurants','restaurants') }}
where
    open_on_sunday
