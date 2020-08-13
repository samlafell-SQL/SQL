-- Limit Clause

-- First parameter is an offset, second parameter tells us how mayn values to pull
/*SELECT *
FROM customers
LIMIT 6,3;*/


-- Limit clause should always come at the end
-- Who are our most loyal customers?
SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3;