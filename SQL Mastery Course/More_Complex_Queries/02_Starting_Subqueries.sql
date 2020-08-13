-- Subqueries

/* Exercise */
-- Find products that are more expensive than lettuce
USE sql_store;
SELECT *
FROM products
WHERE unit_price > (SELECT unit_price
					FROM products
                    WHERE product_id = 3);
                    

-- In sql_hr find employees who earn more than the average
USE sql_hr;
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary)
				FROM employees);



