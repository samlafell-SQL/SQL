-- SEARIALIZABLE Isolation Level

/* Solves all concurrency problems */

SET TRANSACTION ISOLATION LEVEL serializable;
START TRANSACTION;
SELECT * FROM customers WHERE state = 'VA';
COMMIT;


/* Only use when you want to prevent phantom reads.

Repeatable reads fits with most scenarios */
