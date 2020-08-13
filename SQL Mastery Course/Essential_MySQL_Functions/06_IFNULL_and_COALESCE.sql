-- IFNULL and COALESCE

USE sql_store;

SELECT
	order_id,
    IFNULL(shipper_id, 'Not Assigned') AS shipper
FROM orders;


-- Coalesce
SELECT
	order_id,
    COALESCE(shipper_id, comments, 'Not Assigned') AS shipper
FROM orders;

/* IFNULL you can substitute a null value with something else
Coalesce will return the first Nonnull value in the list */

/* Exercise:
Display two columns.
-- Customer full name
-- Customer phone, or 'Unknown' if no phone */

SELECT
	CONCAT(first_name, ' ', last_name) AS customer,
    COALESCE(phone, 'Unknown') AS phone -- or IFNULL, that's fine too
FROM customers;

