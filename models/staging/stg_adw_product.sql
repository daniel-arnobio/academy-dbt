with 
    source_product as (
        select *
        from {{ source('sap_adw', 'product') }}
    )

    , product as (
        select 
           productid as product_id
           , productsubcategoryid as product_subcategory_id
           , name
           , safetystocklevel as safety_stock_level
        from source_product
    )

select *
from product