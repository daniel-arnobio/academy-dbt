with country_region as (
    select 
        countryregioncode as country_region_code
        , name as country_name
    from {{ source('sap_adw', 'countryregion') }}
)
select *
from country_region