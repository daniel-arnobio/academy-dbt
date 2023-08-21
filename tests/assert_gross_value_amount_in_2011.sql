/*This test validates the accuracy and consistency of gross sales value in the year 2011.*/
with gross_value_2011 as (
    select
        round(sum(unit_price*order_qty), 2) as gross_value
    from {{ ref('fact_sales') }}
    where extract(year from metric_date) = 2011
)

select *
from gross_value_2011
where gross_value != 12646112.16