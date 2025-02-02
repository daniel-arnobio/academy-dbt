with 
    address as (
        select *
        from {{ ref ('stg_adw_address') }}
    )

    , state_province as (
        select *
        from {{ ref ('stg_adw_state_province') }}
    )

    , country_region as (
        select *
        from {{ ref('stg_adw_country_region') }}  
    )

    , dim_address as (
        select
            address.address_id
            , state_province.territory_id
            , address.adress_line
            , address.city
            , state_province.province_name
            , country_region.country_name
        from address
        left join state_province 
            on address.state_province_id = state_province.state_province_id
        left join country_region 
            on state_province.country_region_code = country_region.country_region_code
    )

    , dim_address_sk as (
        select
            {{ dbt_utils.generate_surrogate_key(['address_id']) }} as address_sk
            , *
        from dim_address
    )

select *
from dim_address_sk