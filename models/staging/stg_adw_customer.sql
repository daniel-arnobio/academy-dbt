with customer as (
    select 
       customerid as customer_id
       , territoryid as territory_id
    from {{ source('sap_adw', 'customer') }}
)
select *
from customer