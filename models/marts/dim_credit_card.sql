with
    dim_credit_card as (
        select
            credit_card_id
            , card_type
            , card_number
            , exp_month
            , exp_year
        from {{ ref('stg_adw_credit_card') }}
    )
    , dim_credit_card_sk as (
        select
            {{ dbt_utils.generate_surrogate_key(['credit_card_id']) }} as credit_card_sk
            , *
        from dim_credit_card
    )

select *
from dim_credit_card_sk