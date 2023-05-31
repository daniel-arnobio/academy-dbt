with store as (
    select 
        businessentityid as store_id
        , salespersonid as sales_person_id
        , name
    from {{ source('sap_adw', 'store') }}
)
select *
from store