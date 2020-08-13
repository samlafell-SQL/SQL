-- The ANY keyword

-- clients with at least 2 invoices
SELECT client_id
FROM invoices
GROUP BY client_id
HAVING COUNT(*) > 2;


-- Select these clients
SELECT *
FROM clients
WHERE client_ID IN (
	SELECT client_id
	FROM invoices
	GROUP BY client_id
	HAVING COUNT(*) > 2
);

-- ANOTHER WAY
-- Replace 'IN' with '= ANY'
SELECT *
FROM clients
WHERE client_ID = ANY (
	SELECT client_id
	FROM invoices
	GROUP BY client_id
	HAVING COUNT(*) > 2
);