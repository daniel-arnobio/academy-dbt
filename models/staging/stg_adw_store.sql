with 
    souce_store as (
        select *
        from {{ source('sap_adw', 'store') }}
    )

    , store as (
        select 
            businessentityid as store_id
            , salespersonid as sales_person_id
            , name as store_name
        from souce_store
    )

select *
from store