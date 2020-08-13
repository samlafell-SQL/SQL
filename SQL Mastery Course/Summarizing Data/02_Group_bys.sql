-- Group by!

SELECT
	state,
    city,
	SUM(invoice_total) AS total_sales
FROM invoices i
JOIN clients c
	USING (client_id)
GROUP BY state, city;

-- Group by is always AFTER Where and BEFORE Order by

USE sql_invoicing;
SELECT
	p.date AS date,
    pm.name AS payment_method,
    SUM(amount) AS total_payments
FROM payments p 
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id
GROUP BY p.date, p.payment_method
ORDER BY date;