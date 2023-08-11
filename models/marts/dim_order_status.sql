with 
    stg_order_header_sales_reason as (
        select 
            sales_order_id
            , sales_reason_id
        from {{ ref('stg_adw_sales_order_header_sales_reason') }}
    )
    , stg_adw_sales_reason as (
        select distinct
            sales_reason_id 
            , name
            , reason_type
        from {{ ref('stg_adw_sales_reason') }}
    )
    , dim_order_status as (
        select
            stg_order_header_sales_reason.sales_order_id
            , stg_adw_sales_reason.name
            , stg_adw_sales_reason.reason_type
        from stg_order_header_sales_reason
        left join stg_adw_sales_reason
            on stg_order_header_sales_reason.sales_reason_id =stg_adw_sales_reason.sales_reason_id
    )
   , dim_order_status_sk as (
        select
            {{ dbt_utils.generate_surrogate_key(['sales_order_id', 'name', 'reason_type']) }} as sales_reason_sk
            , *
        from dim_order_status
    )
select *
from dim_order_status_sk