-- Subqueries in the SELECT clause

/* Say we want to return a table that has the average of invoices in every row, with the difference
between the current invoice and the average of all invoices */

USE sql_invoicing;
SELECT
	invoice_id,
    invoice_total,
    (SELECT AVG(invoice_total)
		FROM invoices) AS invoice_avg,
	invoice_total-(SELECT invoice_avg) AS difference
FROM invoices;

/* Exercise:
return clients, total sales, avg, and different
*/

SELECT
	c.client_id,
    c.name,
    SUM(i.invoice_total) AS total_sales,
    (SELECT AVG(invoice_total) FROM invoices) AS average,
    SUM(i.invoice_total)-(SELECT average) AS difference
FROM clients c
LEFT JOIN invoices i USING (client_id)
GROUP BY c.client_id
ORDER BY c.client_id;

-- OR --

SELECT
	c.client_id,
    c.name,
    
    (SELECT SUM(invoice_total) 
		FROM invoices
        WHERE client_id = c.client_id) AS total_sales,
        
    (SELECT AVG(invoice_total) 
		FROM invoices) AS average,
        
    (SELECT total_sales - average) AS difference
FROM clients c
ORDER BY c.client_id;