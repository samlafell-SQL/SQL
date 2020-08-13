-- Deadlocks

-- When one transaction can't complete because one transaction holds a lock the other needs

USE sql_store;
START TRANSACTION;
UPDATE customers SET state = 'VA' WHERE customer_id = 1;
UPDATE orders SET status = 1 WHERE order_id = 1;
COMMIT;

/* VALUES DON'T MATTER. */

/* Moving into new session... */
USE sql_store;
START TRANSACTION;
UPDATE orders SET status = 1 WHERE order_id = 1;
UPDATE customers SET state = 'VA' WHERE customer_id = 1;
COMMIT;

/* See how the orders of the trnasactions are reversed..
When we try to update both of these at the same time we are going to
be in a deadlock */

/* What do we do?

Write applications in a way that it can reissue a transaction if we run into deadlocks.

Can never completely get rid of them.. just minimize likelihood

If we frequently run into them...
- make sure we have the same order when updating multiple records

- keep transactions small and short

- try to run transactions during non-peak hours */