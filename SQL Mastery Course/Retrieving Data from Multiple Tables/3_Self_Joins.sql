-- Self Join

USE sql_hr;

SELECT e.employee_id,
	   e.first_name,
	   e.last_name,
       m.first_name AS 'Manager First Name',
       m.last_name AS 'Manager Last Name'
FROM employees AS e
JOIN employees AS m
	ON e.reports_to = m.employee_id;