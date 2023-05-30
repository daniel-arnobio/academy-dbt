with country_region as (
    select 
        countryregioncode
        , name
    from {{ source('sap_adw', 'countryregion') }}
)
select *
from country_region