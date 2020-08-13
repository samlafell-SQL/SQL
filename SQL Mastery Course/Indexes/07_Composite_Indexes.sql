-- Composite Indexes

USE sql_store;
SHOW INDEXES IN customers;

EXPLAIN
SELECT customer_id
FROM customers
WHERE state='CA' AND points>1000; -- 112 rows scanned

-- MySQL will only pick one index
-- Using this, MySQL will use the index that returns the fewest rows
-- The second part of this query runs a table_scan
-- This is where we need a composite index

USE sql_store;
-- Order matters in the new index
CREATE INDEX idx_state_points ON customers (state, points);

EXPLAIN
SELECT customer_id
FROM customers
WHERE state='CA' AND points>1000; -- 58 rows scanned!!!

-- MySQL automatically includes the primary key in all indexes
-- So, single column indexes tend to waste space as is
-- Generally stick to composite indexes
-- MySQL allows for a maximum of 16 columns in an index

-- 4-6 columns perform well. Experiment based on queries.

DROP INDEX idx_state ON customers;
DROP INDEX idx_points ON customers;

SHOW INDEXES IN customers;



/* order of columns in composite index...

1. Put the most frequently used columns first
2. Columns with a Higher Cardinality first (# unique values)
	- Gender is not a good column to use first (cardinality of 2)
3. Always take queries into account
*/

SELECT
	COUNT(DISTINCT state),
    COUNT(DISTINCT last_name)
FROM customers;

-- Cardinality is NOT always best_practice

CREATE INDEX idx_lastname_state ON customers (last_name, state);

EXPLAIN SELECT customer_id
FROM customers
WHERE state = 'CA' AND last_name LIKE 'A%'; -- 40 rows searched

/*
In this query, it's going to be more efficient to actually make the
STATE the fist index and the last_name the second index.

We will filter to CA.
Then find all last names beginning with A.
It's more intuitiative then trying to find ALL last names with A
And then find the ones in California.
*/

CREATE INDEX idx_state_lastname ON customers (state, last_name);

EXPLAIN SELECT customer_id
FROM customers
WHERE state = 'CA' AND last_name LIKE 'A%'; -- 7 rows searched


EXPLAIN SELECT customer_id
FROM customers
WHERE state = 'CA' AND last_name LIKE 'A%';

/* In the example above, cardinality rule may not be the best for the indexes...

The = on the State filter is more restrictive
The LIKE on the last_name is more open. So it's better to filter by the more restrictive */

EXPLAIN SELECT customer_id
FROM customers
USE INDEX (idx_lastname_state)
WHERE state LIKE 'A%' AND last_name LIKE 'A%'; -- 40 rows

EXPLAIN SELECT customer_id
FROM customers
USE INDEX (idx_state_lastname)
WHERE state LIKE 'A%' AND last_name LIKE 'A%'; -- 51 rows

-- Not a realistic example.
-- Want to optimize PERFORMANCE CRITICAL queries.

DROP INDEX idx_lastname_state ON customers;

