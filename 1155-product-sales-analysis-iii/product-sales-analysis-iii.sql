# Write your MySQL query statement below
with pdt_first as (
    select
        product_id
        , min(year) first_year
    from
        sales
    group by
        product_id
)

select
    s.product_id
    , pf.first_year
    , s.quantity
    , s.price
from
    pdt_first as pf
join
    sales as s
on
    pf.product_id = s.product_id
and
    pf.first_year = s.year