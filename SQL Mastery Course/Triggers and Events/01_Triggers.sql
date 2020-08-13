-- Triggers

/* What is a Trigger?

A block of SQL Code that automatically gets executed
before or after an insert, update, or delete statement */

-- Use triggers for data consistency
-- SQL Store, multiple payments towards a given invoice

DELIMITER $$
DROP TRIGGER IF EXISTS payments_after_insert;
CREATE TRIGGER payments_after_insert -- associated with payments, fired after inserting a record
	AFTER INSERT ON payments
    FOR EACH ROW -- Trigger is fired on each row that is affected (MYSQL doesn't support table --level trigger)
BEGIN
	UPDATE invoices
    SET payment_total = payment_total + NEW.amount -- Also have OLD (old row with old values).... Amount because we have 'amount' column
    WHERE invoice_id = NEW.invoice_id;
END $$

DELIMITER ;

/* Can't modify data in PAYMENTS table because it will trigger an infinite loop */
    
INSERT INTO payments
VALUES (DEFAULT, 5, 3, '2019-01-01', 10, 1)



/* EXERCISE
Create a trigger that gets fired when we delete a payment
*/
DELIMITER $$
CREATE TRIGGER payments_after_delete -- associated with payments, fired after deleting a record
	AFTER DELETE ON payments
    FOR EACH ROW -- Trigger is fired on each row that is affected (MYSQL doesn't support table --level trigger)
BEGIN
	UPDATE invoices
    SET payment_total = payment_total - OLD.amount -- Also have OLD (old row with old values).... Amount because we have 'amount' column
    WHERE invoice_id = OLD.invoice_id;
END $$
DELIMITER ;

DELETE FROM payments
WHERE client_id = 5 AND invoice_id = 3;