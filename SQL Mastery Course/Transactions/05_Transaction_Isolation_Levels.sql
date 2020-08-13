-- Transaction Isolation Levels
/* Problems:

Lost Updates: 2 transactions update same row and the last one overrides changes
Dirty Reads: Reading uncommitted data
Non-repeating reads: Reading same data twice in a transaction but get different results
Phantom reads: Miss one or more rows in our query

*/

/* Isolation Levels:


Read Uncommitted: Does us no good.

Read Committed: Gives our transactions a little isolation and prevents dirty reads. 
But transactions could have different results. 

Repeatable Reads: Multiple reads return same result event if data changes

Serializable: Prevent phantom reads. 
If data is changed in the meantime, our transaction will WAIT to get the most recent data.
Increases memory and CPU.

More performance and scalability problems as we increase isolation.
*/

/* In summary:

Lower isolation level gives us more concurrency.

But that means concurrency problems.

But that's better performance.

High isolation level gives us less concurrency.

Less concurrency problems.

Worse performacne. Increase need for memory and CPU resources.

Repeatable Reads is ideal!!

Only change isolation level if you have to
*/

SHOW VARIABLES LIKE 'transaction_isolation%';

-- Change transaction isolation level
SET SESSION TRANSACTION ISOLATION LEVEL serializable;

-- Change transaction isolation level globally
SET GLOBAL TRANSACTION ISOLATION LEVEL serializable;
