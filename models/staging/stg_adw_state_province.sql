with state_pronvice as (
    select 
        stateprovinceid as state_province_id
        , territoryid as territory_id
        , name as province_name
        , stateprovincecode as state_province_code
        , countryregioncode as country_region_code
    from {{ source('sap_adw', 'stateprovince') }}
)
select *
from state_pronvice