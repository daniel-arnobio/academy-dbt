with 
    source_costumer as (
        select * 
        from {{ source('sap_adw', 'customer') }}

    )

    , customer as (
        select 
            customerid as customer_id
            , territoryid as territory_id
        from source_costumer  
    )
    
select *
from customer