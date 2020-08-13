-- Other Benefits of Views

/*
1. Simplify Queries (provide abstraction over our tables)

2. Reduce the impact of changes
	- What if we change the column name?
		- We can modify our CREATE OR UPDATE VIEW code to bring back the old name
	- What if we move the column to a different table?
		- We can just join the tables in the view.

3. Restrict access to the data in the underlying table
	-- Don't apply these blindly but they help with data security
*/

