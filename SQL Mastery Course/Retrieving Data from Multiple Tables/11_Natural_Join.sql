-- Natural Joins (NOT RECOMMENDED)

/* Easy to code but they're dangerous becuase we let the engine
figure it out on it's own */

USE sql_store;

SELECT 
	o.order_id,
    c.first_name
FROM orders o
NATURAL JOIN customers c;