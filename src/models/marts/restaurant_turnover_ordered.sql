with final as (
    select * from {{ ref('stg_restaurants__turnover') }}
order by turnover limit {{ var('nb_restaurants_to_show') }}
)

select * from final