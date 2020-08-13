-- Altering or Dropping Views

/* Two ways...
1. Drop and Recreate
*/

/*
DROP VIEW client_balance;

CREATE VIEW client_balance AS
SELECT
	c.client_id,
    c.name,
    SUM(i.invoice_total) - SUM(i.payment_total) AS balance
FROM clients c
JOIN invoices i USING (client_id)
GROUP BY c.client_id, c.name;
*/

/* 2. Replace Keyword */

CREATE OR REPLACE VIEW client_balance AS
SELECT
	c.client_id,
    c.name,
    SUM(i.invoice_total) - SUM(i.payment_total) AS balance
FROM clients c
JOIN invoices i USING (client_id)
GROUP BY c.client_id, c.name;


/* The best way to save a view is save them to a file and put them under source control. */