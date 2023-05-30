with sales_reason as (
    select *
    from {{ source('sap_adw', 'salesorderheadersalesreason') }}
)
select *
from sales_reason