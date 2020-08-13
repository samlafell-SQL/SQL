-- Dropping Stored Procedures

DROP PROCEDURE IF EXISTS get_clients;

/*
Like with views, it's better to put DROP and CREATE PROCEDURE
code inside of a different folder, and put said folder in source control
*/

USE sql_invoicing;
DELIMITER $$
CREATE PROCEDURE get_clients()
BEGIN
	SELECT *
    FROM clients;
END$$
DELIMITER ;

/* Save that in a file called 'get_clients' inside of a stored_procedures folder */
/* put THAT under source control. Then you can see any changes you've made at any given time */