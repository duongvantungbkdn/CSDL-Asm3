/*
Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N)
 in STATION is greater than 38.7780. Round your answer to 4 decimal places.
*/
select top 1 format(round(LONG_W,4), '#.0000')
from STATION 
where LAT_N > 38.7780
order by LAT_N asc;