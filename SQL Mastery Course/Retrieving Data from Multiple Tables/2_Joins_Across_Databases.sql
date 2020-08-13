-- Joining Across Databases

USE sql_store;

SELECT *
FROM order_items AS oi
JOIN sql_inventory.products AS p
		ON oi.product_id = p.product_id;
