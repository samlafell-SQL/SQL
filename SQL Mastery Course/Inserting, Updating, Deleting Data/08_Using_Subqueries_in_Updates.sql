-- Using Subqueries in Updates

USE sql_invoicing;
UPDATE invoices
SET 
	payment_total = invoice_total * 0.5,
	payment_date = due_date
WHERE client_id = 
				(SELECT client_id
                FROM clients
                WHERE name = 'Myworks');
                
/* What if you want to update for clients in NY or CA? */

USE sql_invoicing;
UPDATE invoices
SET 
	payment_total = invoice_total * 0.5,
	payment_date = due_date
WHERE client_id IN
				(SELECT client_id
                FROM clients
                WHERE state in ('CA', 'NY'));
                
                
/* Exercise:
Update comments for customers that have 3k+ points
*/

USE sql_store;

UPDATE orders
SET comments = 'Gold'
WHERE customer_id IN 
					(SELECT customer_id
					FROM customers
					WHERE points > 3000);
	