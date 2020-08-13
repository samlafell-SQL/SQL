-- Cross Joins

SELECT
	c.first_name AS customer,
    p.name AS product
FROM customers c
CROSS JOIN products p
ORDER BY c.first_name;

/* In this example it doesn't make sense.

Maybe we have a table of sizes and a table of colors and we want all the possible combinations.

That's when we would use a cross join.

This is explicit syntax for a cross-join.

We also have implicit syntax...
if we just type,
FROM customers c, products p
*/


-- Do a cross join between shippers and products


-- Implicit

SELECT
	s.name AS shipper,
    p.name AS product
FROM shippers s, products p;


-- Explicit
SELECT
	s.name AS shipper,
    p.name AS product
FROM shippers s
CROSS JOIN products p
ORDER BY shipper;