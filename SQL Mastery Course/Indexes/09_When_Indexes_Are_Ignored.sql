-- When indexes are ignored

EXPLAIN SELECT customer_id FROM customers
WHERE state = 'CA' OR points > 1000;

-- It's using an index, but doing a full-index scan

-- Have to rewrite query to utilize indexes
CREATE INDEX idx_points ON customers (points);
EXPLAIN
	SELECT customer_id
	FROM customers
	WHERE state = 'CA'
	UNION
	SELECT customer_id
	FROM customers
	WHERE points > 1000;

-- Full index scan another time
-- Why? Expression. When we use column in expression, we can't utilize an index
EXPLAIN
SELECT customer_id
FROM customers
WHERE points + 10 > 2010; -- 1010 rows


EXPLAIN
SELECT customer_id
FROM customers
WHERE points > 2000; -- 3 rows



