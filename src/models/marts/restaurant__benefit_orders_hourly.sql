
{{
    config(
        materialized='incremental',
        unique_key=['identifier','hour'],
        incremental_strategy='merge',
        merge_exclude_columns=['job_insert_at_utc','job_insert_id']
    )
}}
select 
    d.identifier                                           as identifier
    , d.name as name
    , date_trunc('hour',to_timestamp(odf.created_at))      as hour
    , count(*)                                             as nb_ordered
    , sum(d.selling_price)                                 as global_turnover
    , sum(d.selling_price - d.production_cost )             as global_profit
    , {{ add_technical_columns() }}
from 
    {{ ref('stg_orders__dishes_flattened') }} as odf
left join 
    {{ ref('base_dishes') }} as d
        on odf.dishes_id = d.identifier

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  -- (uses >= to include records whose timestamp occurred since the last run of this model)
  -- (If event_time is NULL or the table is truncated, the condition will always be true and load all records)
where odf.created_at >= (select coalesce(max(hour),'1900-01-01T00:00:00') from {{ this }} )

{% endif %}
group by 1,2,3

