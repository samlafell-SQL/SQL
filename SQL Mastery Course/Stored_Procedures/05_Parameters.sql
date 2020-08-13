-- Parameters

/* Pass a value to your stored procedure.
Also to pass parameters to calling program */

DROP PROCEDURE IF EXISTS get_clients_by_state;
USE sql_invoicing;
DELIMITER $$
CREATE PROCEDURE get_clients_by_state  -- List parameters
(
	state CHAR(2) -- string of 2 characters (NY, CA)
)
BEGIN
	SELECT *
    FROM clients c
    WHERE c.state = state;
END$$
DELIMITER ;

/* Don't forget VARCHAR, variable character. Here, CHAR makes more sense */

CALL get_clients_by_state();

/* Exercise:
Write a stored procedure to return invoices for a given clients
get_invoices_by_client */

DROP PROCEDURE IF EXISTS get_invoices_by_client;
USE sql_invoicing;
DELIMITER $$
CREATE PROCEDURE get_invoices_by_client  -- List parameters come next
(
	client_id INT
)
BEGIN
	SELECT *
    FROM invoices i
    WHERE i.client_id = client_id;
END$$
DELIMITER ;

CALL get_invoices_by_client(5);