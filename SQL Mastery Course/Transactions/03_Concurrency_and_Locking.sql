-- Concurrency and Locking

/* Concurrency is when one user modifies the data that other users
are trying to pull down or modify */

/* How to minimize concurrency problems */

-- Simulate two people trying to change points simultaneously

-- Open new instance

USE sql_store;
START TRANSACTION;
UPDATE customers
SET points = points + 10
WHERE customer_id = 1;
COMMIT;

-- Do the same thing in a new instance
