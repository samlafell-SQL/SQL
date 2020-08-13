-- Using Triggers for Auditing

USE sql_invoicing; 

CREATE TABLE payments_audit
(
	client_id 		INT 			NOT NULL, 
    date 			DATE 			NOT NULL,
    amount 			DECIMAL(9, 2) 	NOT NULL,
    action_type 	VARCHAR(50) 	NOT NULL,
    action_date 	DATETIME 		NOT NULL
)


/* Trigger for Updating invoice table after insert to payments */
/* For logging trigger actions */
DELIMITER $$
DROP TRIGGER IF EXISTS payments_after_insert;
CREATE TRIGGER payments_after_insert -- associated with payments, fired after inserting a record
	AFTER INSERT ON payments
    FOR EACH ROW -- Trigger is fired on each row that is affected (MYSQL doesn't support table --level trigger)
BEGIN
	UPDATE invoices
    SET payment_total = payment_total + NEW.amount -- Also have OLD (old row with old values).... Amount because we have 'amount' column
    WHERE invoice_id = NEW.invoice_id;
    
    INSERT INTO payments_audit
    VALUES (NEW.client_id, NEW.date, NEW.amount, 'Insert', NOW());
END $$
DELIMITER ;


/* Trigger for updating invoice table after delete from payments */
/* For logging trigger actions */
DELIMITER $$
DROP TRIGGER IF EXISTS payments_after_delete;
CREATE TRIGGER payments_after_delete -- associated with payments, fired after deleting a record
	AFTER DELETE ON payments
    FOR EACH ROW -- Trigger is fired on each row that is affected (MYSQL doesn't support table --level trigger)
BEGIN
	UPDATE invoices
    SET payment_total = payment_total - OLD.amount -- Also have OLD (old row with old values).... Amount because we have 'amount' column
    WHERE invoice_id = OLD.invoice_id;
    
    INSERT INTO payments_audit
    VALUES (OLD.client_id, OLD.date, OLD.amount, 'Delete', NOW());
END $$
DELIMITER ;


/* Try it out */

INSERT INTO payments
VALUES (DEFAULT, 5, 3, '2019-01-01', 10, 1);

DELETE
FROM payments
WHERE payment_id = 10;