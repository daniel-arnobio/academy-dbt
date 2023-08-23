with
    source_sales_person as (
        select *
        from {{ source('sap_adw', 'salesperson') }}
    )

    , sales_person as (
        select 
            businessentityid as sales_person_id
            , territoryid as territory_id
            , salesquota as sales_quota
            , bonus as bonus
            , commissionpct as commission_pct
            , salesytd as sales_ytd
            , saleslastyear as sales_last_year
        from source_sales_person
    )
       
select *
from sales_person