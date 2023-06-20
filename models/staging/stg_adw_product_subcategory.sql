with 
    product_sub_category as (
        select 
          productsubcategoryid as product_subcategory_id
          , productcategoryid as product_category_id
          , name
        from {{ source('sap_adw', 'productsubcategory') }}
    )
select *
from product_sub_category