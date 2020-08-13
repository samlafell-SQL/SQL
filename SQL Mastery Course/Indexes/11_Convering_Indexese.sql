-- Convering Indexese

EXPLAIN
SELECT *
FROM customers
ORDER BY state;
SHOW STATUS LIKE 'last_query_cost%'; -- EXPENSIVE with *

EXPLAIN
SELECT customer_id, state
FROM customers
ORDER BY state;
SHOW STATUS LIKE 'last_query_cost%'; -- a lot cheaper. It's covering index.
--  An index that cover everything a query needs.