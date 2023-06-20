with 
    sales_reason as (
        select 
            salesreasonid
            , name
            , reasontype
        from {{ source('sap_adw', 'salesreason') }}
    )
select *
from sales_reason