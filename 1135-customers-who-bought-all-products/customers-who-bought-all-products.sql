# Write your MySQL query statement below
with dedupe as (
    select distinct
        *
    from
        customer
)

select
    c.customer_id
from
    dedupe as c
left join
    product as p
on
    c.product_key = p.product_key
group by
    c.customer_id
having
    sum( if(c.product_key = p.product_key, 1, 0 ) ) = ( select count( distinct product_key ) from product )