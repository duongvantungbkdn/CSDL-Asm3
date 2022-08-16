/*
Query the two cities in STATION with the shortest and longest CITY names, 
as well as their respective lengths (i.e.: number of characters in the name).
 If there is more than one smallest or largest city, choose the one that comes first 
when ordered alphabetically.
*/
select top 1 CITY, len(CITY) from STATION
order by len(CITY), CITY;
select top 1 CITY, len(CITY) from STATION
order by len(CITY) desc, CITY;