with sales_reason as (
    select *
    from {{ source('sap_adw', 'salesreason') }}
)
select *
from sales_reason