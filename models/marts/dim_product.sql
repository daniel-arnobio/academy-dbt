with 
    product as (
        select
            product_id
            , product_subcategory_id
            , name
            , safety_stock_level
        from {{ ref ('stg_adw_product') }}
    )
    , product_category as (
        select
            product_category_id
            , name as product_category
        from {{ ref ('stg_adw_product_category') }}
    )

    , product_subcategory as (
        select
            product_subcategory_id
            , product_category_id
            , name as product_subcategory
        from {{ ref ('stg_adw_product_subcategory') }}

    )
    , dim_product as (
        select
            product.product_id
            , product.name 
            , product_category.product_category
            , product_subcategory.product_subcategory
            , product.safety_stock_level
        from product
        left join product_subcategory on product.product_subcategory_id = product_subcategory.product_category_id
        left join product_category on product_subcategory.product_category_id = product_category.product_category_id
    )
select *
from dim_product
 