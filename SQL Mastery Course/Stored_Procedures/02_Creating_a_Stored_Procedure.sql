-- Creating a Stored Procedure

USE sql_invoicing;
DELIMITER $$ -- Change default delimiter

CREATE PROCEDURE get_clients()
BEGIN
	SELECT * FROM clients;
END$$
DELIMITER ;

/* In other DBMS, you don't have to change the default delimiter */

-- https://www.mysqltutorial.org/getting-started-with-mysql-stored-procedures.aspx
-- It wasn't working for me here

CALL get_clients();


/* Exercise:
- Stored Procedure called
	- "get_invoices_with_balance"
    - return all invoices wiht balance > 0
*/

USE sql_invoicing;
DELIMITER $$ -- Change default delimiter

CREATE PROCEDURE get_invoices_with_balance()
BEGIN
	SELECT * 
    FROM invoices_with_balance
    WHERE balance > 0;
END$$
DELIMITER ;

CALL get_invoices_with_balance();

