-- Creating and Dropping Databases

-- DROP DATABASE IF EXISTS sql_store2;

CREATE DATABASE IF NOT EXISTS sql_store2;

-- Creating Tables
USE sql_store2;

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE IF NOT EXISTS customers
(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name 	VARCHAR(50) NOT NULL,
    last_name 	VARCHAR(50) NOT NULL,
    points 		INT NOT NULL DEFAULT 0,
    email 		VARCHAR(255) NOT NULL UNIQUE
);

-- Modify Table
ALTER TABLE customers
	ADD middle_name VARCHAR(50) AFTER first_name;

ALTER TABLE customers
	ADD city 		VARCHAR(50) NOT NULL,
    MODIFY COLUMN first_name VARCHAR(55) DEFAULT '',
    DROP points
;

-- Create Relationship
USE sql_store2;
CREATE TABLE IF NOT EXISTS orders
(
	order_id 	INT PRIMARY KEY,
    customer_id INT NOT NULL,
    FOREIGN KEY fk_orders_customers (customer_id)
		REFERENCES customers (customer_id)
        ON UPDATE CASCADE -- SET NULL, NO ACTION
        ON DELETE RESTRICT
);

/*
Now, orders table depends on customers table.
We would have to delete orders table first in order to delete customers table now.
*/
