create database Uber_requests;

CREATE TABLE uber_requests (
    request_id INT primary key,
    pickup_point VARCHAR(50),
    driver_id INT,
    status VARCHAR(50),
    request_timestamp DATETIME,
    drop_timestamp DATETIME
);
-- COUNT OF REQUEST BY PICKUP POINT  
select 'pickup_point', count(*)from uber_requests group by 'pickup_point';

-- STATUS DISTRIBUTION
select status, count(*) from uber_requests group by status;

-- REQUESTS BY HOUR
select hour(request_timestamp) as hour, count(*) as total
from uber_requests
group by hour(request_timestamp)
order by hour;

-- CANCELLED OR NO CARS AVALAIBLE BY TIME
select hour(request_timestamp) as hour, status, count(*) as total
from uber_requests
where status in ('Cancelled', 'No cars avalaible')
group by hour(request_timestamp), status;