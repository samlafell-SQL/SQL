-- Parameter Validation

/* Create a procedure to update an invoice */

DROP PROCEDURE IF EXISTS make_payment;
USE sql_invoicing;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `make_payment`(
	invoice_id INT,
    payment_amount DECIMAL(9, 2), -- Num with decimal. Total digits = 9, num digits after decimal = 2
    payment_date DATE
)
BEGIN
	IF payment_amount < 0 THEN
		SIGNAL SQLSTATE '22003' 
			SET MESSAGE_TEXT = 'Invalid Payment Amount';
	END IF; -- Keep Validation logic to the bare minimum
    
	UPDATE invoices i
    SET -- We are only updating two parameters because we only want to change these two things
		i.payment_total = payment_amount,
        i.payment_date = payment_date
	WHERE i.invoice_id = invoice_id;
END$$
DELIMITER ;

CALL make_payment(2, 0, '2019-01-01');

-- SQLSTATE ERRORS: https://www.ibm.com/support/knowledgecenter/en/SSEPEK_11.0.0/codes/src/tpc/db2z_sqlstatevalues.html#db2z_sqlstatevalues__code22

/*
It's going to be faster to do the parameter validation inside of the application.
Validating parameters once the application hits the database is slower.
*/