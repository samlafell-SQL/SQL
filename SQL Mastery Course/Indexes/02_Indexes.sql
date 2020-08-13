-- Indexes

/*
How the DB software searches through data to find a specific record
*/

/* Find customers in California...
Without an index, have to search all customers in table
Create an index on the state column.
Create a directory of customers using state as the index.
Usually, they can fit into memory.

Reading data from memory is faster than reading from disk.
*/

/* Cost of indexes
Increase the size of the database
Slow down the writes
*/

/* Use Cases
Reserve indexes for performance critical queries
Design indexes based on queries, not on tables
*/

/* Storage
Usually stored as binary trees.
- fundamental data structure

Easy to think of them as a table */