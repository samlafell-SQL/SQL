-- Implicit Join Syntax

USE sql_store;

/* This query is the same as the query as below */
SELECT *
FROM orders AS o
JOIN customers AS c
	ON o.customer_id = c.customer_id;
    
/* Implicit join syntax below... */
SELECT *
FROM orders o, customers c
WHERE o.customer_id = c.customer_id;

/* Recommended to stay away from the implicit join syntax.
Could cause a cross-join if you're not careful.
Pythonic: Explicit is better than Implicit */