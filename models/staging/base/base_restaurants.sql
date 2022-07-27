select distinct
    identifier
    , name
    , address
from 
    {{source('restaurants', 'restaurants')}}