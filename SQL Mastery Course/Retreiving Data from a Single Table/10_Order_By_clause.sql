-- order by clause

/*SELECT *
FROM customers
ORDER BY state DESC, first_name;*/

/*SELECT first_name, last_name
FROM customers
ORDER BY birth_date;*/

SELECT *
FROM order_items
WHERE order_id = 2
ORDER BY (unit_price*quantity) DESC;