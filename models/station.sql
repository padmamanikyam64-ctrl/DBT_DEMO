with bike as (
    select 
    start_statio_id as station_id,
    end_station_id as end_station,
    start_lng as start_longitude,
    start_lat as start_latitude 
    from 
    {{ source('demo', 'bike') }}
    where RIDE_ID!='ride_id'
    
)

select * from bike

