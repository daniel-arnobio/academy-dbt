with 
    dim_address as (
        select 
            address_sk
            , address_id
        from {{ ref('dim_address') }}
    )
    , dim_credit_card as (
        select
            credit_card_sk
            , credit_card_id
        from {{ ref('dim_credit_card') }}
    )
    , dim_customer as (
        select
            customer_sk
            , customer_id
        from {{ ref('dim_customer') }}
    )
    , dim_dates as (
        select metric_date
        from {{ ref('dim_dates') }}
    )
    , dim_order_status as (
        select
            sales_reason_id
            , sales_reason_sk
        from {{ ref('dim_order_status') }}
    )
    , dim_products as (
        select 
            product_id
            , product_sk
        from {{ ref('dim_products') }}
    )
    , sales_order_detail as (
        select
            sales_order_detail_id
            , sales_order_id
            , product_id
            , order_qty
            , unit_price
            , unit_price_discount
        from {{ ref('stg_adw_sales_order_detail') }}
    )
    , sales_order_header as (
        select
            sales_order_id
            , customer_id
            , territory_id
            , credit_card_id
            , order_date as metric_date
            , ship_date
            , due_date
            , order_status
            , online_order_flag
            , sub_total
            , tax_amt
            , freight
            , total_due
        from {{ ref('stg_adw_sales_order_header') }}
    )
    , fact_table as (
        select 
            sales_order_detail.sales_order_detail_id
            , sales_order_detail.sales_order_id
            , sales_order_detail.product_id
            , sales_order_header.customer_id
            , sales_order_header.territory_id
            , sales_order_header.credit_card_id
            , sales_order_detail.order_qty
            , sales_order_detail.unit_price
            , sales_order_detail.unit_price_discount
            , sales_order_header.metric_date
            , sales_order_header.ship_date
            , sales_order_header.due_date
            , sales_order_header.order_status
            , sales_order_header.online_order_flag
            , sales_order_header.sub_total
            , sales_order_header.tax_amt
            , sales_order_header.freight
            , sales_order_header.total_due
        from sales_order_detail
        left join sales_order_header
            on sales_order_detail.sales_order_id = sales_order_header.sales_order_id
    )
    , fact_metrics as (
        select 
            {{ dbt_utils.generate_surrogate_key(['']) }} as sales_reason_sk
            , dim_address.address_sk
            , dim_credit_card.credit_card_sk
            , dim_customer.customer_sk
            , dim_dates.metric_sk
            , dim_order_status.order_status_sk
            , dim_products.product_sk
        from fact_table
        left join dim_address 
            on fact_table.address_id = dim_address.address_id
        left join dim_credit_card
            on fact_table.credit_card_id = dim_credit_card.credit_card_id
        left join dim_customer
            on fact_table.customer_id = dim_customer.customer_id
            

    )
select *
from fact_tablewith 
    dim_address as (
        select 
            address_sk
            , address_id
        from {{ ref('dim_address') }}
    )
    , dim_credit_card as (
        select
            credit_card_sk
            , credit_card_id
        from {{ ref('dim_credit_card') }}
    )
    , dim_customer as (
        select
            customer_sk
            , customer_id
        from {{ ref('dim_customer') }}
    )
    , dim_dates as (
        select metric_date
        from {{ ref('dim_dates') }}
    )
    , dim_order_status as (
        select
            sales_reason_id
            , sales_reason_sk
        from {{ ref('dim_order_status') }}
    )
    , dim_products as (
        select 
            product_id
            , product_sk
        from {{ ref('dim_products') }}
    )
    , sales_order_detail as (
        select
            sales_order_detail_id
            , sales_order_id
            , product_id
            , order_qty
            , unit_price
            , unit_price_discount
        from {{ ref('stg_adw_sales_order_detail') }}
    )
    , sales_order_header as (
        select
            sales_order_id
            , customer_id
            , territory_id
            , credit_card_id
            , order_date as metric_date
            , ship_date
            , due_date
            , order_status
            , online_order_flag
            , sub_total
            , tax_amt
            , freight
            , total_due
        from {{ ref('stg_adw_sales_order_header') }}
    )
    , fact_table as (
        select 
            sales_order_detail.sales_order_detail_id
            , sales_order_detail.sales_order_id
            , sales_order_detail.product_id
            , sales_order_header.customer_id
            , sales_order_header.territory_id
            , sales_order_header.credit_card_id
            , sales_order_detail.order_qty
            , sales_order_detail.unit_price
            , sales_order_detail.unit_price_discount
            , sales_order_header.metric_date
            , sales_order_header.ship_date
            , sales_order_header.due_date
            , sales_order_header.order_status
            , sales_order_header.online_order_flag
            , sales_order_header.sub_total
            , sales_order_header.tax_amt
            , sales_order_header.freight
            , sales_order_header.total_due
        from sales_order_detail
        left join sales_order_header
            on sales_order_detail.sales_order_id = sales_order_header.sales_order_id
    )
    , fact_metrics as (
        select 
            {{ dbt_utils.generate_surrogate_key(['']) }} as sales_reason_sk
            , dim_address.address_sk
            , dim_credit_card.credit_card_sk
            , dim_customer.customer_sk
            , dim_dates.metric_sk
            , dim_order_status.order_status_sk
            , dim_products.product_sk
        from fact_table
        left join dim_address 
            on fact_table.address_id = dim_address.address_id
        left join dim_credit_card
            on fact_table.credit_card_id = dim_credit_card.credit_card_id
        left join dim_customer
            on fact_table.customer_id = dim_customer.customer_id
            

    )
select *
from fact_table