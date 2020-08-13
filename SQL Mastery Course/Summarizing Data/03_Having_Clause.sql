-- HAVING clause

/*
SELECT
	client_id,
    SUM(invoice_total) AS total_sales
FROM invoices
GROUP BY client_id
HAVING total_sales > 500;
*/

-- HAVING can filter data AFTER a group by

SELECT
	client_id,
    SUM(invoice_total) AS total_sales,
    COUNT(*) AS number_of_invoices
FROM invoices
GROUP BY client_id
HAVING total_sales > 500 AND number_of_invoices > 5;

/* Exercise */
-- Find customers that...
-- Are from Virginia
-- and have spent more than $100

USE sql_store;
SELECT
	c.customer_id,
	c.first_name,
    c.last_name,
	SUM(oi.unit_price*oi.quantity) AS total_spent,
    c.state
FROM order_items oi
JOIN orders o USING (order_id)
JOIN customers c USING (customer_id)
WHERE c.state = 'VA'
GROUP BY c.customer_id,
		 c.first_name,
		 c.last_name
HAVING total_spent > 100;


