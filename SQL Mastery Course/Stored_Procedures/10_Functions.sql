-- Functions

/*
Functions are similar to stored procedures
But functions can only return a single value.
*/


USE `sql_invoicing`;
DROP function IF EXISTS `get_risk_factor_for_client`;

DELIMITER $$
USE `sql_invoicing`$$
CREATE FUNCTION `get_risk_factor_for_client` 
(
	client_id INT
)
RETURNS INT
-- Need at least one attribute
-- DETERMINSTIC: returns the same output given the same input (tax = 10% of total order)
-- READS SQL DATA: We will have a select in the Function
-- MODIFIES SQL DATA: An insert/update/or delete
READS SQL DATA 
BEGIN
	DECLARE risk_factor DECIMAL(9, 2) DEFAULT 0;
    DECLARE invoices_total DECIMAL(9, 2);
    DECLARE invoices_count INT; -- Only useful inside the stored procedure
    
    SELECT COUNT(*), SUM(invoice_total)
    INTO invoices_count, invoices_total
    FROM invoices i
    WHERE i.client_id = client_id;
    
    SET risk_factor = invoices_total / invoices_count * 5;
    
	RETURN IFNULL(risk_factor, 0);
END$$

DELIMITER ;


SELECT
	client_id,
    name,
    get_risk_factor_for_client(client_id) AS risk_factor
FROM clients;

/* Also a good idea to source control functions */

DROP FUNCTION IF EXISTS get_risk_factor_for_client;
