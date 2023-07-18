{{
    config(
        materialized='table'
    )
}}

with base as (
    select * from {{ ref('base_fuzzy_orders') }}
)

, add_fake_id as (
    select
        row_number() as fake_id
        , *
    from
        base
)

select
    b.fake_id
    , n.value as dish_name
    , payment_method
    , amount
    , created_at
from
    add_fake_id as b
, lateral flatten(input => b.dishes_names) as n