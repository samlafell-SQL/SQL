-- With Option Check

UPDATE invoices_with_balance
SET payment_total = invoice_total
WHERE invoice_id = 2;
-- Notice how it DELETES invoice_id 2

-- Here's the code for the view again
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
WHERE (invoice_total - payment_total) > 0
WITH CHECK OPTION; -- add this. Prevents the view from deleting or excluding rows

-- Change invoice_id to 3
UPDATE invoices_with_balance
SET payment_total = invoice_total
WHERE invoice_id = 3;


/* Now when we run this, we get an error.
This way, we can't update views in such a 
way that a row would be deleted or excluded from the view */
