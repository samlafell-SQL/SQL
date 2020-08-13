-- Updatable Views

SELECT *
from sales_by_client;

/* You can use views in INSERT, UPDATE, or DELETE table phrases when you dont have...
1) DISTINCT keyword
2) Aggregate Functions
3) Group By/ HAIVING
4) UNION 

Then, the view is known as updateable view */

CREATE OR REPLACE VIEW invoices_with_balance AS
SELECT
	invoice_id,
    number,
    client_id,
    invoice_total,
    payment_total,
    invoice_total - payment_total AS balance,
    invoice_date,
    due_date,
    payment_date
FROM invoices
WHERE (invoice_total - payment_total) > 0;

/* The above view is an updateable view */
-- There are no aggregage, distinct, or unions

-- For example...
DELETE FROM invoices_with_balance
WHERE invoice_id = 1;

UPDATE invoices_with_balance
SET due_date = DATE_ADD(due_date, INTERVAL 2 DAY)
WHERE invoice_id = 2;

