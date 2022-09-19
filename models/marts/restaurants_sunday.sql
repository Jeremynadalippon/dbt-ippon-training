select
    *
from
   {{source('sources','restaurants')}}
where
    open_on_sunday