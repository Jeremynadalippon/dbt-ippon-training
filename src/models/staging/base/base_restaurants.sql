with source as (
    select
        *
    from
        {{ source("restaurant_sources", "restaurants") }}
)

select * from source