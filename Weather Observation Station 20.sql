/*
A median is defined as a number separating the higher half of a data set from the lower half. 
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.
*/
-- create temporary table has: row's number over by LAT_N order by decrease, LAT_N
with tempTB as (select row_number() over (order by LAT_N desc) as r_num, LAT_N
from STATION)

select format(round(LAT_N,4),'F4')
from tempTB
-- choose value of LAT_N in the middle of temporary table
where r_num = 
    (select case when max(r_num)%2=0 then max(r_num)/2
                else max(r_num)/2+1
                end
        from tempTB)