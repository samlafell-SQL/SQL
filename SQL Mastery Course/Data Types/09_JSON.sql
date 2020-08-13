-- JSON Type

/*
JSON: JavaScript Object Notation
Lightweight format for storing and trasnferring data over the internet

{
	"key": value
}
*/

USE sql_store;
/* Add in 'properties' as a JSON */
ALTER TABLE `sql_store`.`products` 
ADD COLUMN `properties` JSON NULL AFTER `size`;

-- Create a JSON Object
UPDATE products
SET properties = '
{
	"dimensions" : [1, 2, 3],
    "weight": 10,
    "manufacturer": {"name":"sony"}
}
'
WHERE product_id = 1;

-- Check it out
SELECT *
FROM products;




-- Another way to create JSON
UPDATE products
SET properties = JSON_OBJECT
(
	'weight', 10, 
	'dimensions', JSON_ARRAY(1, 2, 3),
    'manufacturer', JSON_OBJECT('name', 'sony')
)
WHERE product_id = 1;


-- Extract individual key, value pairs
SELECT 
	product_id,
    JSON_EXTRACT(properties, '$.weight') AS weight
FROM products
WHERE product_id = 1;


-- Extract even better
SELECT 
	product_id,
    properties -> '$.weight' AS weight
FROM products
WHERE product_id = 1;


-- Extract even better AND from an array
SELECT 
	product_id,
    properties -> '$.dimensions[0]' AS dimensions
FROM products
WHERE product_id = 1;


-- Extract even better AND from nested JSON
SELECT 
	product_id,
    properties ->> '$.manufacturer.name' AS Manufacturer
FROM products
WHERE properties ->> '$.manufacturer.name' = 'sony';

-- UPDATE JSON
UPDATE products
SET properties = JSON_SET(
	properties,
    '$.weight', 20,
    '$.age', 10
)
WHERE product_id = 1;

SELECT product_id, properties
FROM products
WHERE properties ->> '$.manufacturer.name' = 'sony';


-- REMOVE JSON
UPDATE products
SET properties = JSON_REMOVE(
	properties,
    '$.age'
)
WHERE product_id = 1;

SELECT product_id, properties
FROM products
WHERE properties ->> '$.manufacturer.name' = 'sony';
