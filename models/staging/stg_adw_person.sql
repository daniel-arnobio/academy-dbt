with 
    person as (
        select
            businessentityid as person_id
            , concat(firstname, ' ', middlename, ' ', lastname) as person_name
            , persontype as person_type
            , case persontype
                when 'SC' then 'Store Contact'
                when 'IN' then 'Individual (retail) customer'
                when 'SP' then 'Sales person'
                when 'EM' then 'Employee (non-sales)'
                when 'VC' then 'Vendor contact'
                when 'GC' then 'General contact'
                else persontype
              end as person_type_description
        from {{ source('sap_adw', 'person') }}
    )
select *
from person
