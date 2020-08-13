-- Output Parameters

DROP PROCEDURE IF EXISTS get_unpaid_invoices_for_client;
USE sql_invoicing;
DELIMITER $$
CREATE PROCEDURE get_unpaid_invoices_for_client
(
	client_id INT,
    OUT invoices_count SMALLINT,
    OUT invoices_total DECIMAL(9, 2) -- OUT marks these as output parameters
)
BEGIN
	SELECT COUNT(*), SUM(invoice_total)
	INTO invoices_count, invoices_total
    FROM invoices i
    WHERE i.client_id = client_id AND 
		payment_total = 0;
END$$


SET @invoices_count = 0;
SET @invoices_total = 0; -- These are user_defined variables. Define values in memory. Prefix with @.
CALL sql_invoicing.get_unpaid_invoices_for_client
	(3, @invoices_count, @invoices_total);
SELECT @invoices_count, @invoices_total;

-- Avoid output parameters unless you really need them?
