with 
    source_sales_order_header as (
        select *
        from {{ source('sap_adw', 'salesorderheader') }}   
    )

    , sales_order_header as (
        select 
            salesorderid as sales_order_id
            , customerid as customer_id
            , salespersonid as sales_person_id
            , territoryid as territory_id
            , creditcardid as credit_card_id
            , date(timestamp(orderdate)) as order_date
            , date(timestamp(shipdate)) as ship_date
            , date(timestamp(duedate)) as due_date
            , case status
                when 1 then 'in progress'
                when 2 then 'approved'
                when 3 then 'backordered'
                when 4 then 'rejected'
                when 5 then 'shipped'
                when 6 then 'canceled'
                else 'unknowm'
            end as order_status
            , onlineorderflag as online_order_flag
            , subtotal as sub_total
            , taxamt as tax_amt
            , freight
            , totaldue as total_due
        from source_sales_order_header
    )

select *
from sales_order_header