-- Correlated Subqueries

USE sql_hr;

/* Correlated subqueries are kind of like for loops. imagine..
We want to return employees if they make more than the average
amount at their office.

for each employee:
	calculate the avg salary for employee.office
    return the employee if salary > avg
*/


SELECT *
FROM employees e
WHERE salary > (
	SELECT AVG(salary)
    FROM employees
    -- For each employee, the subquery will run
    -- if the salary is > avg, it will return the employee
    WHERE office_id = e.office_id
    -- After running this subquery, it will move on to the next line
    -- Then have to run this subquery again
);

-- Get invoices that are larger than the clients invoice amount
/*
for invoice
	calculate the average invoice amount per client_id
    return the invoice if invoice > avg
*/

USE sql_invoicing;
SELECT *
FROM invoices i
WHERE invoice_total > (
	SELECT AVG(invoice_total)
    FROM invoices
    WHERE client_id = i.client_id
);

