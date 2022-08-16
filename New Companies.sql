/*
We have tables:
- Company: The company_code is the code of the company and founder is the founder of the company.
- Lead_Manager: The lead_manager_code is the code of the lead manager, and the company_code is the code of the working company.
- Senior_Manager: The senior_manager_code is the code of the senior manager, the lead_manager_code 
is the code of its lead manager, and the company_code is the code of the working company. 
- Manager: The manager_code is the code of the manager, the senior_manager_code is the code of its senior manager, 
the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company.
- Employee: The employee_code is the code of the employee, the manager_code is the code of its manager,
 the senior_manager_code is the code of its senior manager, the lead_manager_code is the code of its lead manager,
 and the company_code is the code of the working company.

Given the table schemas below, write a query to print the 
	company_code, 
	founder name, 
	total number of lead managers, 
	total number of senior managers, 
	total number of managers, 
	and total number of employees. 
Order your output by ascending company_code.
*/
select C.company_code, C.founder,
        (select count(distinct lead_manager_code) from Lead_Manager 
            where company_code =  C.company_code),
        (select count(distinct senior_manager_code) from Senior_Manager 
            where company_code =  C.company_code),
        (select count(distinct manager_code) from Manager 
            where company_code =  C.company_code),
        (select count(distinct employee_code) from Employee 
            where company_code =  C.company_code)
from Company C
order by C.company_code;