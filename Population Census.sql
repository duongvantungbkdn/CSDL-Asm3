﻿/*
Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/

select sum(CITY.POPULATION)
from CITY 
    join COUNTRY on CITY.CountryCode = COUNTRY.Code
where COUNTRY.CONTINENT = 'Asia'