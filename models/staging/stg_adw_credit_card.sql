with 
    source_credit_card as (
        select *
        from {{ source('sap_adw', 'creditcard') }}
    )

    , credit_card as (
        select 
            creditcardid as credit_card_id
            , cardtype as card_type
            , cardnumber as card_number
            , expmonth as exp_month
            , expyear as exp_year
        from source_credit_card
    )
    
select *
from credit_card