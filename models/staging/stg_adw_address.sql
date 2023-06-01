with address as (
    select 
       addressid as address_id
       , stateprovinceid as state_province_id
       , addressline1 as adress_line
       , city 
    from {{ source('sap_adw', 'address') }}
)
select *
from address