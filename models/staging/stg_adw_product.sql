with product as (
    select 
       productid as product_id
       , name
       , safetystocklevel
    from {{ source('sap_adw', 'product') }}
)
select *
from product