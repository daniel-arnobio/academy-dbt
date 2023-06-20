with 
    credit_card as (
        select 
            creditcardid as credit_card_id
            , cardtype as card_type
            , cardnumber as card_number
            , expmonth as exp_month
            , expyear as exp_year
        from {{ source('sap_adw', 'creditcard') }}
    )
select *
from credit_card