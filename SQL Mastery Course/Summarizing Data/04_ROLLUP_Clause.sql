-- The ROLLUP operator

USE sql_invoicing;
SELECT
    state,
    city,
    SUM(invoice_total) AS total_sales
FROM invoices i
JOIN clients c USING (client_id)
GROUP BY state, city WITH ROLLUP;

-- ROLLUP calculates the summary for EACH group
-- VERY USEFUL

-- Not ANSI

-- Only MySQL

/* EXERCISE */

USE sql_invoicing;
SELECT
	pm.name,
    SUM(p.amount) AS amount_spent
FROM payments p
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id
GROUP BY pm.name WITH ROLLUP;
