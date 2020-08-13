-- Parameters with Default Value

/* Return Clients in California as Default */


DROP PROCEDURE IF EXISTS get_clients_by_state;
USE sql_invoicing;
DELIMITER $$
CREATE PROCEDURE get_clients_by_state 
(
	state CHAR(2) 
)
BEGIN
	-- Beginning of IF BLOCK ... NEW
	IF state IS NULL THEN
		SET state = 'CA';
	END IF; -- End of IF Block
    
	SELECT *
    FROM clients c
    WHERE c.state = state;
END$$
DELIMITER ;


CALL get_clients_by_state(NULL); -- HAVE TO SPECIFY NULL



/* Seperate way to do it */

DROP PROCEDURE IF EXISTS get_clients_by_state;
USE sql_invoicing;
DELIMITER $$
CREATE PROCEDURE get_clients_by_state 
(
	state CHAR(2) 
)
BEGIN
	-- Beginning of IF BLOCK ... NEW
	IF state IS NULL THEN
		SELECT * FROM clients;
	ELSE
		SELECT *
		FROM clients c
		WHERE c.state = state;
	END IF; -- End of IF Block

END$$
DELIMITER ;


CALL get_clients_by_state(NULL); -- HAVE TO SPECIFY NULL




/* Way Number Three.
An improvement on Number two. */

DROP PROCEDURE IF EXISTS get_clients_by_state;
USE sql_invoicing;
DELIMITER $$
CREATE PROCEDURE get_clients_by_state 
(
	state CHAR(2) 
)
BEGIN
	SELECT *
	FROM clients c
	WHERE c.state = IFNULL(state, c.state); -- If 'state' is null.. c.state = c.state which is always true
END$$
DELIMITER ;


CALL get_clients_by_state('CA'); 


/* Write a Stored Procedure called  'get_payments'
-- two parametes
	-- client_id
    -- payment_method_id
*/


DROP PROCEDURE IF EXISTS get_payments;
USE sql_invoicing;
DELIMITER $$
CREATE PROCEDURE get_payments
(
	client_id INT, -- 4 bytes of memory. larger numbers.
    payment_method_id TINYINT -- Takes 1 byte of memory. 0-255.
)
BEGIN
	SELECT *
	FROM payments p
	WHERE 
		p.client_id = IFNULL(client_id, p.client_id) AND 
        p.payment_method = IFNULL(payment_method_id, p.payment_method);
END$$
DELIMITER ;

CALL get_payments(NULL, NULL);
