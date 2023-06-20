with 
    dim_order_status as (
        select
            sales_reason_id 
            , name
            , reason_type
        from {{ ref('stg_adw_sales_reason') }}
    )
    , dim_order_status_sk as (
        select
            {{ dbt_utils.generate_surrogate_key(['sales_reason_id']) }} as sales_reason_sk
            , *
        from dim_order_status
    )
select *
from dim_order_status_sk