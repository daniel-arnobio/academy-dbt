with state_pronvice as (
    select 
        stateprovinceid
        , territoryid
        , name
        , stateprovincecode
        , countryregioncode
    from {{ source('sap_adw', 'stateprovince') }}
)
select *
from state_pronvice