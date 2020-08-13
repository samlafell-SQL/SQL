-- Self Outer Join

USE sql_hr;


-- Return every employee in the table whether they have a manager or not
SELECT
	e.employee_id,
    e.first_name,
    m.first_name AS manager
FROM employees e
LEFT JOIN employees m
	ON e.reports_to = m.employee_id;