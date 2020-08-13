-- Unions

/* Joins are about combining columns

UNIONS combine rows!!
*/

SELECT *
FROM orders;

/* We see one order from 2019
All other orders from different years...
What if we want to create a report, get the orders
Add a label "active" if placed in 2019
Add a label "archived" if placed before
*/

SELECT
	order_id,
    order_date,
    'Active' AS status
FROM orders
WHERE order_date >= '2019-01-01'
UNION
SELECT
	order_id,
    order_date,
    'Archived' AS status
FROM orders
WHERE order_date < '2019-01-01';

/* This allows us to combine records from multiple queries.
In this example our queries are against the same table.
But we can pull from multiple tables! */

-- The column name depends on the first query
SELECT
	first_name
FROM customers
UNION
SELECT
	name
FROM shippers;
-- No real world meaning for this query ^^

/*
An example of real world might be...
Combining customers from archived orders
with current customers
SELECT
	first_name
FROM archived_orders
UNION
SELECT
	name
FROM orders;
*/


/*
This results in an error. We have to return the same amount of clumns
in each query... 
SELECT
	first_name,
    last_name
FROM customers
UNION
SELECT
	name
FROM shippers;
*/


SELECT
	c.customer_id,
    c.first_name,
    c.points,
    'Bronze' as type
FROM customers c
WHERE points < 2000
UNION
SELECT
	c.customer_id,
    c.first_name,
    c.points,
    'Silver' as type
FROM customers c
WHERE points BETWEEN 2000 AND 3000
UNION
SELECT
	c.customer_id,
    c.first_name,
    c.points,
    'Gold' as type
FROM customers c
WHERE points > 3000
ORDER BY first_name;
