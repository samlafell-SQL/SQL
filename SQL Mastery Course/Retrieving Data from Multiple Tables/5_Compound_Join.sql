-- Compound Join Conditions

USE sql_store;

SELECT *
FROM order_items AS oi
JOIN order_item_notes AS oin
	ON oi.order_id = oin.order_id
    AND oi.product_id = oin.product_id;