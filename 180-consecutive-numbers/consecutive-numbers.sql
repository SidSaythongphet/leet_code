# Write your MySQL query statement below
select
    distinct ConsecutiveNums
from
    (select
        id
        , if(
            lag(num) over ( order by id asc ) = num
            &&
            lead(num) over (order by id asc ) = num
            , num
            , null
        
        ) as ConsecutiveNums
    from
        logs) as cn
left join
    logs as l
on
    l.id = cn.id
and
    l.num = cn.ConsecutiveNums
where
    ConsecutiveNums is not null

