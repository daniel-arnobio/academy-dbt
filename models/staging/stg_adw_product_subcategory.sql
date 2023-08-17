with
    source_product_sub_category as (
        select *
        from {{ source('sap_adw', 'productsubcategory') }}    
    )

    , product_sub_category as (
        select 
          productsubcategoryid as product_subcategory_id
          , productcategoryid as product_category_id
          , name as product_subcategory_name
        from source_product_sub_category
    )

select *
from product_sub_category