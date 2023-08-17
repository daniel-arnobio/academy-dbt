with 
    source_sales_reason as (
        select *
        from {{ source('sap_adw', 'salesreason') }}
    )

    , sales_reason as (
        select 
            salesreasonid as sales_reason_id
            , name as sales_reason_name
            , reasontype as reason_type
        from source_sales_reason
    )
    
select *
from sales_reason