-- Creating Relationships

USE sql_store2;
CREATE TABLE IF NOT EXISTS orders;
(
	order_id 	INT PRIMARY KEY,
    customer_id INT NOT NULL,
    FOREIGN KEY fk_orders_customers (customer_id)
		REFERENCES customers (customer_id)
        ON UPDATE CASCADE -- SET NULL, NO ACTION
        ON DELETE RESTRICT
);

