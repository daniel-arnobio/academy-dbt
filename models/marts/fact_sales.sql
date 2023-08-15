with 
    dim_address as (
        select *
        from {{ ref('dim_address') }}
    )

    , dim_credit_card as (
        select *
        from {{ ref('dim_credit_card') }}
    )

    , dim_customer as (
        select *
        from {{ ref('dim_customer') }}
    )

    , dim_dates as (
        select *
        from {{ ref('dim_dates') }}
    )

    , dim_order_status as (
        select *
        from {{ ref('dim_order_status') }}
    )

    , dim_products as (
        select *
        from {{ ref('dim_products') }}
    )

    , fact_table as (
        select *  
        from {{ ref('int_sales__order_itens') }}
    )

    , fact_metrics as (
        select 
            {{ dbt_utils.generate_surrogate_key(['fact_table.sales_order_detail_id', 'fact_table.sales_order_id']) }}
            , fact_table.sales_order_detail_id
            , dim_address.address_sk
            , dim_credit_card.credit_card_sk
            , dim_customer.customer_sk
            , dim_dates.metric_date
            , dim_order_status.sales_reason_sk
            , dim_products.product_sk
        from fact_table
        left join dim_address 
            on fact_table.territory_id = dim_address.territory_id
        left join dim_credit_card
            on fact_table.credit_card_id = dim_credit_card.credit_card_id
        left join dim_customer
            on fact_table.customer_id = dim_customer.customer_id
        left join dim_dates
            on fact_table.metric_date = dim_dates.metric_date
        left join dim_order_status
            on fact_table.sales_order_id = dim_order_status.sales_order_id
        left join dim_products
            on fact_table.product_id = dim_products.product_id
    )

select *
from fact_metrics