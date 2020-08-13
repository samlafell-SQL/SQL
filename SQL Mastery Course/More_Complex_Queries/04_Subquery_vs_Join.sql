-- Subqueries vs Joins

USE sql_invoicing;

-- Using a Subquery
SELECT *
FROM clients
WHERE client_id NOT IN (SELECT DISTINCT client_id
						FROM invoices);

-- Using a Join
SELECT *
FROM clients
LEFT JOIN invoices USING (client_id)
WHERE client_id IS NULL;


/* Whether you use subquery or join has to do with...
1. Speed of Computation
2. Readability

Here, the subquery is probaly better
*/

/* Exercise
-- Find customers who have ordered lettuce (id = 3)
	-- select customer_id, first_name, last_name
*/
USE sql_store;
SELECT DISTINCT
	c.customer_id,
    c.first_name,
    c.last_name
FROM orders o
JOIN customers c USING (customer_id)
WHERE order_id IN (SELECT order_id
					FROM order_items
					WHERE product_id = 3);


SELECT *
FROM customers
WHERE customer_id IN (
						SELECT o.customer_id
						FROM order_items oi
						JOIN orders o USING (order_id)
						WHERE product_id = 3
);


-- This one is probably the most readable
SELECT DISTINCT c.customer_id, first_name, last_name
FROM customers c
JOIN orders o USING (customer_id)
JOIN order_items oi USING (order_id)
WHERE product_id = 3;