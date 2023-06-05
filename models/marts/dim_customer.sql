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
        from {{ ref('stg_adw_person') }}
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
        from customer
        left join person on customer.customer_id = person.person_id
        left join store on person.person_id = store.sales_person_id
    )
select *
from dim_customer