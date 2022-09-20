select
    row_number() over (order by turnover desc)  as rank
    , name::string                              as name
    , address::string                           as address
    , turnover::number                          as turnover
from
    {{ ref('stg_restaurants__turnover_ordered') }}
