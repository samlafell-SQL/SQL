-- Creating Transactions

USE sql_store;

START TRANSACTION;

INSERT INTO orders (customer_id, order_date, status)
VALUES (1, '2019-01-01', 1);

INSERT INTO order_items
VALUES (LAST_INSERT_ID(), 1, 1, 1);

-- ROLLBACK;
-- COMMIT;


/* MYSQL automatically wraps INSERT, DELETE, UPDATE using transactions using 'autocommit' */

SHOW VARIABLES LIKE 'auto%';