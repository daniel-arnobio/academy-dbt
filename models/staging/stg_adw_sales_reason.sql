with 
    sales_reason as (
        select 
            salesreasonid as sales_reason_id
            , name
            , reason_type
        from {{ source('sap_adw', 'salesreason') }}
    )
select *
from sales_reason