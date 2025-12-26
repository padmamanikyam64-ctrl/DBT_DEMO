with cte as (

    select t.*,
    w.*
    from {{ ref('tripfact') }} as t
    left join {{ ref('weather') }} as w 
    on t.TRIP_DATE=w.daily_weather
    limit 10
)

select * from cte