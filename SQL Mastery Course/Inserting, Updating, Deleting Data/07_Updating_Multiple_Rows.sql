-- Updating Multiple Rows

USE sql_invoicing;
UPDATE invoices
SET 
	payment_total = invoice_total * 0.5,
	payment_date = due_date
WHERE client_id = 3;

-- Write SQL Statement to
	-- give any customers born before 1990
    -- 50 extra points

USE sql_store;
UPDATE customers
SET
	points = points + 50
WHERE birth_date < '1990-01-01';
