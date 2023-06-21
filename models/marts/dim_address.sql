with 
    address as (
        select 
            address_id
            , state_province_id
            , adress_line
            , city
        from {{ ref ('stg_adw_address') }}
    )
    , state_province as (
        select 
            state_province_id
            , territory_id
            , province_name
            , state_province_code
            , country_region_code
        from {{ ref ('stg_adw_state_province') }}
    )
    , country_region as (
        select
            country_region_code
            , country_name
        from {{ ref('stg_adw_country_region') }}  
    )
    , dim_address as (
        select
            state_province.territory_id as address_id
            , address.adress_line
            , address.city
            , state_province.province_name
            , country_region.country_name
        from address
        left join state_province on address.state_province_id = state_province.state_province_id
        left join country_region on state_province.country_region_code = country_region.country_region_code
    )
    , dim_address_sk as (
        select
            {{ dbt_utils.generate_surrogate_key(['address_id', 'adress_line', 'city', 'province_name', 'country_name']) }} as address_sk
            , *
        from dim_address

    )

select *
from dim_address_sk