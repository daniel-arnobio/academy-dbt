with 
    source_address as (
        select *
        from {{ source('sap_adw', 'address') }}    
    )
    
    , address as (
        select 
           addressid as address_id
           , stateprovinceid as state_province_id
           , addressline1 as adress_line
           , city 
        from source_address  
    )

select *
from address