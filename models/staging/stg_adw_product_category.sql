with product_category as (
    select 
       productcategoryid as product_category_id
       , name
    from {{ source('sap_adw', 'productcategory') }}
)
select *
from product_category