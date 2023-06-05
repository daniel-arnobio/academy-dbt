with 
    sales_order_detail as (
        select 
            salesorderdetailid as sales_order_detail_id
            , salesorderid as sales_order_id
            , productid as product_id
            , orderqty as order_qty
            , specialofferid as special_offer_id
            , unitprice as unit_price
            , unitpricediscount as unit_price_discount
        from {{ source('sap_adw', 'salesorderdetail') }}
    )
select *
from sales_order_detail