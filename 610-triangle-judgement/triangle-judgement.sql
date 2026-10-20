# Write your MySQL query statement below
select
    *
    , if(
        x + y > z
        &&
        y + z > x
        &&
        x + z > y
        , 'Yes', 'No'
    ) as triangle
from 
    triangle