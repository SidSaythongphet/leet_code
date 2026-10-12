# Write your MySQL query statement below
with a_start as (
    select
        *
    from
        activity
    where
        activity_type = 'start'
),
a_end as (
    select
        *
    from
        activity
    where
        activity_type = 'end'
)

select
    s.machine_id
    , round(avg(e.timestamp - s.timestamp),3) as processing_time
from
    a_start as s
join
    a_end as e
on 
    s.machine_id = e.machine_id
and
    s.process_id = e.process_id
group by
    s.machine_id