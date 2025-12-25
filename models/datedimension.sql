with cte as(
    select
    TO_TIMESTAMP(STARTED_AT) AS started_at,
    DATE(TO_TIMESTAMP(STARTED_AT))  AS DATE,
    HOUR(TO_TIMESTAMP(STARTED_AT))  AS HOUR,
    DAYOFWEEK(TO_TIMESTAMP(STARTED_AT)) AS DAYOFWEEK,
    DAYNAME(TO_TIMESTAMP(STARTED_AT)) AS DAYNAME,

    CASE WHEN DAYNAME(TO_TIMESTAMP(STARTED_AT)) in ('sat','sun')
    THEN 'weekend'
    ELSE 'businessday'
    end as day_type,

    CASE WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) in (3,4,5)
         THEN 'SUMMMER'
         WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) in (6,7,8)
         THEN 'RAINY'
         WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) in (9,10,11)
         THEN 'WINTER'
    END AS SEASON         

    from

    {{ source('demo', 'bike') }}
   where STARTED_AT!='started_at'   
)

select * from cte