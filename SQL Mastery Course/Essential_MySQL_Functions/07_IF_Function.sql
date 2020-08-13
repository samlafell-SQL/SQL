-- The IF function

/* 2 categories of orders..
active or archived.
this year = active
other years = archive */

-- How to use it...
-- IF(expression, first, second)

SELECT
	order_id,
    order_date,
    IF(
		YEAR(order_date) = YEAR(NOW()), 
		'Active', 
		'Archived'
	) AS category
FROM orders;


/* Write a query that returns the product_id, name,
# of times it was ordered, and if freq > 1 then frequency = 'Many Times',
else, 'Once' */

SELECT 
	product_id,
    p.name,
	COUNT(*) AS orders,
    IF ( 
		COUNT(*) = 1,
        'Once',
        'Many times'
    ) AS frequency
FROM products p
JOIN order_items oi USING (product_id)
GROUP BY product_id, p.name;