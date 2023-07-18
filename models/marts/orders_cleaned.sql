{{
    config(
        materialized='table'
    )
}}

with cleaned_flat as (
    select * from {{ ref('stf_flatten_cleaned_names') }}
)

, dishes as (
    select * from {{ source('sources', 'dishes') }}
)

, dish_ids as (
    select
        c.fake_id
        , d.dish_id
        , c.payment_method
        , c.amount
        , c.created_at
    from
        cleaned_flat as c
    inner join
        dishes as d
        on c.dish_user_input = d.name
)

, final as (
    select
        fake_id as identifier
        , array_agg(dish_id) as dishes_ids
        , any_value(payment_method) as payment_method
        , any_value(amount) as amount
        , any_value(created_at) as created_at
    from
        dish_id
    group by
        fake_id
)