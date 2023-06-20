with 
    product as (
        select 
           productid as product_id
           , productsubcategoryid as product_subcategory_id
           , name
           , safetystocklevel as safety_stock_level
        from {{ source('sap_adw', 'product') }}
    )
select *
from product