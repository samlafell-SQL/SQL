-- Variables
-- Pass these variables to get output


-- User or Session Variables
-- DEFINE with SET
-- PREFIX with @
SET @invoices_count = 0;

-- Local Variables
-- Freed up as soon as the stored procedure is done
-- Usually use with calculations
USE `sql_invoicing`;
DROP procedure IF EXISTS `get_risk_factor`;

DELIMITER $$
USE `sql_invoicing`$$
CREATE PROCEDURE `get_risk_factor` ()
BEGIN
	DECLARE risk_factor DECIMAL(9, 2) DEFAULT 0;
    DECLARE invoices_total DECIMAL(9, 2);
    DECLARE invoices_count INT; -- Only useful inside the stored procedure
    
    SELECT COUNT(*), SUM(invoice_total)
    INTO invoices_count, invoices_total
    FROM invoices;
    
    SET risk_factor = invoices_total / invoices_count * 5;
    
    SELECT risk_factor; -- The DECLARE variables free up when the stored procedure is over

END$$

DELIMITER ;
