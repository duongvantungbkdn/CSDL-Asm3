/*
You are given a table, Projects, containing three columns: 
	Task_ID, 
	Start_Date 
	and End_Date.
It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table.
If the End_Date of the tasks are consecutive, then they are part of the same project. 
Samantha is interested in finding the total number of different projects completed.
Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. 
If there is more than one project that have the same number of completion days, then order by the start date of the project.
*/  
-- create temporary table S contain start_date and E contain end_date
-- hàm rank() dùng để xếp hạng giá trị theo quy tắc các giá tri giống nhau xếp cùng 1 hạng, 
-- hạng của giá trị tiếp theo bằng giá trị hiện tại cộng với số giá trị trùng nhau
with S as (
            select start_date,
            rank() over (order by start_date) as rank_start
            from Projects
            where start_date not in (select end_date from Projects)
           ),
     E as (
            select end_date,
            rank() over (order by end_date) as rank_end
            from Projects
            where end_date not in (select start_date from Projects)
           )
-- join 2 temporary above together 
select S.start_date, E.end_date
from S join E on S.rank_start = E.rank_end
order by datediff(day,S.start_date,E.end_date), S.start_date