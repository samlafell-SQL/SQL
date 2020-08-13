-- The USING Clause

/*
To use the USING Clause, the two columns have to have the same name
across tables
*/

/*
USE sql_store;

SELECT
	o.order_id,
    c.first_name,
    sh.name AS shipper
FROM orders o
JOIN customers c
	-- ON o.customer_id = c.customer_id
    USING (customer_id)
LEFT JOIN shippers sh
	-- ON o.shipper_id = sh.shipper_id
	USING (shipper_id);
*/



/* Order_Items has a composite primary key...
If we want to join, we have to join both the primary keys */

/*
SELECT *
FROM order_items oi
JOIN order_item_notes oin
	-- ON oi.order_id = oin.order_id AND
	-- 	oi.product_id = oin.product_id
	USING (order_id, product_id);
*/

/* Exercise */

USE sql_invoicing;

SELECT
	p.date,
    c.name AS client,
    p.amount,
    pm.name AS payment_method
FROM payments p
JOIN clients c
	USING (client_id)
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id;




