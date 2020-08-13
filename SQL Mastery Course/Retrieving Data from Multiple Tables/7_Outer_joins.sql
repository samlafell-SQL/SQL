-- Outer Joins

/*SELECT 
	c.customer_id,
    c.first_name,
    o.order_id
FROM customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id
ORDER BY c.customer_id;*/

SELECT 
		p.product_id,
        p.name,
        oi.quantity
FROM order_items AS oi
RIGHT JOIN products AS p
	ON oi.product_id = p.product_id
ORDER BY p.product_id;