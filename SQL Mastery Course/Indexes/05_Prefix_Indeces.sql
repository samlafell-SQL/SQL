-- Prefix Indexes

/* How to index strings.
Types: Char, Varchar, Text, Blob

Only want to include the Prefix of the column
when indexing a string column
*/

-- Include enough characters to uniquely identify each customer
-- CREATE INDEX idx_lastname ON customers (last_name(20));

-- How many character is ideal? Let's look
SELECT COUNT(*) FROM customers;

-- 1010 records
SELECT 
	COUNT(DISTINCT LEFT(last_name, 1)),
	COUNT(DISTINCT LEFT(last_name, 5)),
    COUNT(DISTINCT LEFT(last_name, 10))
FROM customers;

-- By only using 5 characters, we can optimally identify a majority of individuals last names
