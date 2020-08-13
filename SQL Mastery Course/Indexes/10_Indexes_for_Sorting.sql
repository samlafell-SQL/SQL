-- Indexes for Sorting
SHOW INDEXES IN customers;
DROP INDEX idx_state_lastname ON customers;

-- Sort
EXPLAIN
SELECT customer_id
FROM customers
-- ORDER BY state; -- 1010 rows. Scanning entire index. cost of 102.74
ORDER BY first_name; -- Filesort. This is expensive!! cost of 1,112.74
-- SHOW STATUS LIKE 'last_query_cost%';

/*
Also, when sorting...
If we mix the order we sort in (ASC, DESC), then we are going to use filesort.
And it's going to be expensive.

We could use ASC/ASC or DESC/DESC and it'll have less cost and use an index scna. That's fine.
*/



