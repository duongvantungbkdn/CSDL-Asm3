/*
We define an employee's total earnings to be their monthly salary*month worked, 
and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. 
Write a query to find the maximum total earnings for all employees as well as the total number of employees 
who have maximum total earnings. Then print these values as  space-separated integers.

Input Format:
The Employee table containing employee data for a company is described as follows:
	employee_id is an employee's ID number,
	name is their name, 
	months is the total number of months they've been working for the company, 
	and salary is the their monthly salary.
*/

with tempTB as (select months*salary as earnings from Employee)
select top 1 earnings, count(*)
from tempTB
group by earnings
order by earnings desc;