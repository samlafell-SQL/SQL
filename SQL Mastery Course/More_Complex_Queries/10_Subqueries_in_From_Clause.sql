-- Subqueries in the FROM clause


SELECT *
FROM (
	SELECT 
        c.client_id,
		c.name,
        
		(SELECT SUM(invoice_total)
                FROM invoices
                WHERE client_id = c.client_id) AS total_sales,
                
            (SELECT AVG(invoice_total)
                FROM invoices) AS average,
                
            (SELECT total_sales - average) AS difference
    FROM clients c) AS sales_summary;


/* So, this is possible.
But, having subqueries in the FROM clause is not ideal because it makes our queries
about 100x more complex.

So it's better to utilize a VIEW when this situation arises... */

/* Or, reserve it for simple queries
