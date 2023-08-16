with 
    source_sales_reason as (
        select *
        from {{ source('sap_adw', 'salesorderheadersalesreason') }}
    )

    , sales_reason as (
        select 
            salesorderid as sales_order_id
            , salesreasonid as sales_reason_id
        from {{ source('sap_adw', 'salesorderheadersalesreason') }}
    )
    
select *
from sales_reason