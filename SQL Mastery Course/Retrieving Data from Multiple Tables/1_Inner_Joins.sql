-- Inner Joins

SELECT order_id,
	   oi.product_id,
       p.name,
       quantity,
       oi.unit_price
FROM order_items AS oi
JOIN products AS p 
			ON oi.product_id = p.product_id;

