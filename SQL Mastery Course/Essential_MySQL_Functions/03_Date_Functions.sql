-- Date Functions

-- NOW
SELECT NOW(), CURDATE(), CURTIME();

-- EXTRACTING
SELECT YEAR(NOW());
SELECT MONTH(NOW());
SELECT DAY(NOW());
SELECT HOUR(NOW());
SELECT MINUTE(NOW());
SELECT SECOND(NOW());

-- NON INTEGERS EXTRACTIONS
SELECT DAYNAME(NOW());
SELECT MONTHNAME(NOW());

-- EXTRACT
-- unit, 'from', and value
SELECT EXTRACT(DAY FROM NOW());
SELECT EXTRACT(YEAR FROM NOW());


/* Exercise get the orders from the current year */
SELECT *
FROM orders
WHERE YEAR(order_date) = EXTRACT(YEAR FROM NOW());