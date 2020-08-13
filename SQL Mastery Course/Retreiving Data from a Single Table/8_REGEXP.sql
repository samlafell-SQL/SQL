-- REGEX


/*SELECT *
FROM customers
-- WHERE last_name LIKE '%field%';
WHERE last_name REGEXP 'field';*/

-- $ for end of string
/*SELECT *
FROM customers
WHERE last_name REGEXP 'field$';*/

-- | to split terms
/*SELECT *
FROM customers
WHERE last_name REGEXP 'field|mac|rose';*/

/*SELECT *
FROM customers
WHERE last_name REGEXP 'field$|mac|rose';*/

-- [] to look for any single character
/*SELECT *
FROM customers
WHERE last_name REGEXP '[gim]e';*/

/*SELECT *
FROM customers
WHERE last_name REGEXP 'e[a-h]';*/

-- first name are elka or ambur
/*SELECT *
FROM customers
WHERE first_name REGEXP 'elka|ambur';*/

-- last name ends with ey or on
/*SELECT *
FROM customers
WHERE last_name REGEXP 'ey$|on$';*/

-- last name start with my or contain se
/*SELECT *
FROM customers
WHERE last_name REGEXP '^my|se';*/

-- last name contain b followed by R or U
SELECT *
FROM customers
WHERE last_name REGEXP 'b[ru]';
