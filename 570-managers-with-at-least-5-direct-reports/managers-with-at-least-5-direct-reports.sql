# Write your MySQL query statement below
select
    e1.name
from
    employee as e1
join
    employee as e2
on
    e1.id = e2.managerID
group by 
    e1.name, e1.id
having
    count(*) >= 5