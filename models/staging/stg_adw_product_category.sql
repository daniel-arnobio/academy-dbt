with
    source_product_category as (
        select *
        from {{ source('sap_adw', 'productcategory') }}
    )

    , product_category as (
        select 
           productcategoryid as product_category_id
           , name
        from source_product_category
    )
    
select *
from product_category