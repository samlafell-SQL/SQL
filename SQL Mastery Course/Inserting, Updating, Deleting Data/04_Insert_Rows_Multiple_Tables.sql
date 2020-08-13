-- Hierarchcial Rows

/* Parent-Child Relationship.
Order table is the parent with 1 row
order_items has 1 or more rows per row in the order table */

INSERT INTO orders (customer_id, order_date, status)
VALUES (11, '2019-01-02', 1);

INSERT INTO order_items
VALUES (LAST_INSERT_ID(), 1, 1, 2.95),
	   (LAST_INSERT_ID(), 2, 1, 3.95);



