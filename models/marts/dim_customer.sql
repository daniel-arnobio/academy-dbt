with 
    customer as (
        select
           customer_id
        from {{ ref('stg_adw_customer') }}   
    )
    , person as (
        select
            person_id
            , person_name
            , person_type
            , person_type_description
        from {{ ref('stg_adw_person') }}
        where person_type_description = 'Individual (retail) customer'
    ) 
    , store as (
        select
            store_id
            , sales_person_id
            , store_name
        from {{ ref('stg_adw_store') }}    
    )
    , dim_customer as (
        select
            customer_id
            , person.person_name
            , person.person_type
            , person.person_type_description
            , store.sales_person_id
            , store.store_name
        from customer
        left join person on customer.customer_id = person.person_id
        left join store on person.person_id = store.sales_person_id
    )
    , dim_customer_sk as (
        select
            {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as product_sk
            , *
        from dim_customer
    )
select *
from dim_customer_sk