-- String Functions

-- LENGTH
SELECT LENGTH('sky');

-- UPPER/LOWER
SELECT LOWER('SKY');

-- LTRIM / RTRIM / TRIM
SELECT TRIM('    SKY      ');

-- LEFT / RIGHT
SELECT LEFT('Kindergarten', 4);
SELECT RIGHT('Kindergarten', 4);

-- SUBSTRING
SELECT SUBSTRING('Kindergarten', 3, 5);

-- LOCATE
SELECT LOCATE('n', 'Kindergarten');
SELECT LOCATE('q', 'Kindergarten');
SELECT LOCATE('garten', 'Kindergarten');

-- replace
SELECT REPLACE('Kindergarten', 'garten', 'garden');

-- CONCAT
SELECT CONCAT('first', 'last');

USE sql_store;
SELECT CONCAT(first_name, ' ', last_name) AS name
FROM customers;

-- MY SQL STRING FUNCTIONS


