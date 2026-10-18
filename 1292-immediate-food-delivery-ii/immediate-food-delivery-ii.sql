# Write your MySQL query statement below
with first as (
    select
        customer_id
        , min(order_date) as min_order
    from
        delivery
    group by
        customer_id
), immediates as (
    select
        sum( if(d.order_date = d.customer_pref_delivery_date, 1,0) ) as immediate
    from
        delivery as d
    join
        first as f
    on 
        d.customer_id = f.customer_id
    and
        d.order_date = f.min_order
), max_customer as (
    select
        count(distinct customer_id) as m
    from
        delivery
)

select
    round( i.immediate / m.m , 4) * 100 as immediate_percentage
from immediates i, max_customer m


