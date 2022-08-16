/*
Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N)
 in STATION that is less than 137.2345. Round your answer to 4 decimal places.
*/
select top 1 format(round(LONG_W,4),'F4') 
from STATION
where LAT_N < 137.2345
order by LAT_N desc;