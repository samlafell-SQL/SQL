-- Concurrency Problems

/* Lost Updates

Second transaction overwrites first.
Two transactions updating the same customer.

Transaction A and B run at same time. Only the changes made by B
will stick. Changes made by A will be lost.

Use locks to avoid this.

MySQL uses locks automatically.
*/


/* Dirty Reads

When a transaction reads data that hasn't been comitted yet.

Use isolation level READ COMMITTED to avoid this.

The data can change later. That's fine.

But the transactions should only READ COMMITTED data
*/


/* Non-repeating Reads

Adding isolation to make sure we only read committed data.

But what if we re-read and then get different data?

Inconsistent. How do we handle?

We can either say that...
1) The most recent data is fine  (do nothing)
2) The data at the beginning of the transaction should be used throughout
	- Implement a REPEATABLE READ
*/


/* Phantom Reads

querying customers with 10+ point
Same time, B updates customers and a new customer becomes elegible

New data point that hasn't been selecting in first query

We could reexecute transaction A.

But if it's absolutely critical, we have to make sure no other transactions are running

If that's the case -- we need to make this transaction SERIALIZABLE

Meaning that transactions are executed sequentailly.
And our transaction will WAIT until all other transactions are done to run

Reserve this to scenarios where it's absolutely critical to prevent phantom reads
*/


