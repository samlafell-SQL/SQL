-- Viewing Indexes

SHOW INDEXES IN customers;

-- Primary Key becomes Clustered Index
-- Collation = Ascending/Descneding
-- Cardinality = roughly how many unique values there are

ANALYZE TABLE customers;

/*
Other indexes:
Secondary index

These indexes store the index of the new index + the primary key
*/

SHOW INDEXES IN orders;

/*
When we create relationships, MySQL automatically creates indexes on the foreign keys
*/


