with 
    person as (
        select
            businessentityid as person_id
            , concat(firstname, ' ', middlename, ' ', lastname) as person_name
            , persontype as person_type
        from {{ source('sap_adw', 'person') }}
    )
select *
from person