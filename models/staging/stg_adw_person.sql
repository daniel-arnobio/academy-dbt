with 
    person as (
        select distinct
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
   , person_last_update as (
        select
            *
            , row_number() over(partition by person_name) as last_update
        from person
        where person_name is not null
    )
    , deduplicated as (
        select *
        from person_last_update
        where last_update = 1
    )

select *
from deduplicated
