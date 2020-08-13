-- The EXISTS operator

-- select clients that have an invoice

SELECT *
FROM clients
WHERE client_id IN (
	SELECT DISTINCT client_id
    FROM invoices
);

SELECT DISTINCT client_id, c.name, address, city
FROM clients c
JOIN invoices i USING (client_id);


-- Use EXISTS
SELECT *
FROM clients c
-- Using EXISTS to see if there is a row that matches this criteria
-- Checking to see if there is a record that matches this criteria
WHERE EXISTS (
		SELECT client_id
        FROM invoices
        -- correlated subquery
        WHERE client_id = c.client_id
);

/* We use the EXISTS operator because

SELECT *
FROM clients
WHERE client_id IN (
	SELECT DISTINCT client_id
    FROM invoices
);

This query resolves in...

SELECT *
FROM clients
WHERE client_id IN (1, 2, 3, 5)

But what if we had millions of records? This would be a very long long list
*/


/* When that subquery is going to return a really long list,
it's more efficient to use the EXISTS operator

When we use exists, the subquery doesn't return a result.

The EXISTS will return a boolean, and then the outer query will return the information about
that client.

Exercise: Find products that have never been ordered 
*/

USE sql_store;
SELECT *
FROM products p
-- Checking to see if there is a record that matches this criteria
WHERE NOT EXISTS (
		SELECT product_id
        FROM order_items
        -- correlated subquery. We need to reference back to the larger query to see..
        -- okay, does the product id of the row I'm looking at exist in the outer query
        -- if so, it will return the row as TRUE
        WHERE product_id = p.product_id
        -- But, because we have NOT EXISTS. True will become False.
);

/* Think about situations that have lots of data.
This ^^ query is going to be more effective because it wont try to save a list of the product ids */