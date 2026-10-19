# Write your MySQL query statement below
select
    activity_date as day
    , count( distinct user_id ) as active_users
from
    activity
where
    activity_date 
        between date_add(STR_TO_DATE('2019-07-28', '%Y-%m-%d'), interval -30 day) 
        and STR_TO_DATE('2019-07-27', '%Y-%m-%d')
group by
    day