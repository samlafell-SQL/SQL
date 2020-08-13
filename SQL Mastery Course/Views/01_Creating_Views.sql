-- Creating Views

USE sql_invoicing;

-- Create the view
CREATE VIEW sales_by_client AS
SELECT
	c.client_id,
    c.name,
    SUM(invoice_total) AS total_sales
FROM clients c
JOIN invoices i USING (client_id)
GROUP BY client_id, name;


-- Now select the view
SELECT *
FROM sales_by_client
ORDER BY total_sales DESC;

/*
Views do NOT store data. They just provide a VIEW to the underlying tables.
This makes them efficient for memory stores.
*/

/* Create a view to see the balance for each client */

CREATE VIEW client_balance AS
SELECT
	c.client_id,
    c.name,
    SUM(i.invoice_total) - SUM(i.payment_total) AS balance
FROM clients c
JOIN invoices i USING (client_id)
GROUP BY c.client_id, c.name;



