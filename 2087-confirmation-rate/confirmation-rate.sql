# Write your MySQL query statement below
with totals as (
    select
        user_id
        , count(*) as total
    from
        confirmations
    group by
        user_id
),
confirmed as (
    select
        user_id
        , count(*) as confirm
    from 
        confirmations
    where
        action = 'confirmed'
    group by
        user_id
)

select
    s.user_id
    , round(ifnull(c.confirm / t.total,0),2) as confirmation_rate
from
    signups as s
left join
    totals as t
on 
    s.user_id = t.user_id
left join
    confirmed as c
on
    s.user_id = c.user_id
