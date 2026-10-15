# Write your MySQL query statement below
select
    tb1.*
    , count(ex.subject_name) as attended_exams
from
    examinations as ex
right join
    (select
        st.*
        , sb.*
    from
        students as st, subjects as sb
    ) as tb1
on
    tb1.student_id = ex.student_id
and
    tb1.subject_name = ex.subject_name
group by
    tb1.student_id, tb1.student_name, tb1.subject_name
order by
    tb1.student_id, tb1.subject_name