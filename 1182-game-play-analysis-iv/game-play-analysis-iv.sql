# Write your MySQL query statement below
with mn as (
    select
        player_id
        , min(event_date) as min_date
    from
        activity
    group by
        player_id
), rpt as (
    select
        a.player_id
        , datediff(a.event_date, m.min_date) = 1 as re
    from
        activity as a
    join
        mn as m
    on 
        a.player_id = m.player_id
), rpt2 as (
    select
        sum(re) as rep
    from
        rpt
), players as (
    select 
        count(distinct player_id) as mx 
    from 
        activity
)

select 
    round(r.rep / p.mx, 2) as fraction 
from 
    rpt2 r, players p