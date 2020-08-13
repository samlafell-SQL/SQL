-- Creating Indexes

EXPLAIN
SELECT customer_id
FROM customers
WHERE state = 'CA';

/* Details
TYPE = ALL; FULL TABLE SCAN
ROWS = 1010; scanned all rows
*/

/* This is because there is no index... */

CREATE INDEX idx_state ON customers (state);

EXPLAIN
SELECT customer_id
FROM customers
WHERE state = 'CA';

/* Details..
type = ref; (INDEX)
rows = 112; reduced the rows by 10x!!
possible_keys = idx_state... it's considering what index to use
key = idx_state... which one it did use
*/

/* Write a query to find customers with more than 1000 points */

EXPLAIN
SELECT customer_id
FROM customers
WHERE points > 1000;

CREATE INDEX idx_points ON customers (points);

-- Run it again




