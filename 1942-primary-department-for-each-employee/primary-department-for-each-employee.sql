# Write your MySQL query statement below
select
    employee_id
    , department_id
from
    (select
        employee_id
        , department_id
        , row_number() over ( partition by employee_id order by primary_flag asc ) as idx
    from
        employee) as sq
where 
    idx = 1
