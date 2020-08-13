-- The CASE operator


-- If function
-- Test an expression and different values
SELECT
	order_id,
    order_date,
    IF(
		YEAR(order_date) = YEAR(NOW()), 
		'Active', 
		'Archived'
	) AS category
FROM orders;


-- What if we have multiple expressions?
/* For example...
"This Year" for this year
"Last Year" for last year
"Archived" for earlier years */

SELECT
	order_id,
    order_date,
    CASE
		WHEN YEAR(order_date) = YEAR(NOW()) THEN 'Active'
        WHEN YEAR(order_date) = YEAR(NOW()) - 1 THEN 'Last Year'
		WHEN YEAR(order_date) < YEAR(NOW()) - 1 THEN 'Archived'
        ELSE 'Future'
	END AS category
FROM orders;


/* Exercise
Return customer, points, and category
> 3000 is Gold
Between 2k and 3k is silver
<2k is bronze */

SELECT
	CONCAT(first_name, ' ', last_name) AS customer,
    points,
    CASE
		WHEN points > 3000 THEN 'Gold'
        WHEN points >= 2000 THEN 'Silver'
        ELSE 'Bronze'
	END AS category
FROM customers
ORDER BY points DESC;



