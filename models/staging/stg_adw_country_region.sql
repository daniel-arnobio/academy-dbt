with 
    source_country_region as (
        select *
        from {{ source('sap_adw', 'countryregion') }}
    )

    , country_region as (
        select 
            countryregioncode as country_region_code
            , name as country_name
        from source_country_region
    )

select *
from country_region