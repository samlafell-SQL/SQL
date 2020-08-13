-- Creating a copy of a table

CREATE TABLE orders_archived AS
SELECT * FROM orders;


-- SELECT up there is a subquery

INSERT INTO orders_archived
SELECT *
FROM orders
WHERE order_date < '2019-01-01';

-- This is using select as a subquery in an insert ^^



-- Exercise
USE sql_invoicing;
CREATE TABLE invoices_archive AS
SELECT
	i.invoice_id,
    i.number,
    c.name AS client,
    i.invoice_total,
    i.payment_total,
    i.payment_date,
    i.invoice_date,
    i.due_date
FROM invoices i
JOIN clients c
	USING (client_id)
WHERE i.payment_date IS NOT NULL;

