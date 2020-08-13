-- Deleting Rows

DELETE FROM invoices;

-- Delete with WHERE

DELETE FROM invoices
WHERE client_id = (SELECT *
					FROM clients
                    WHERE name = 'Myworks');