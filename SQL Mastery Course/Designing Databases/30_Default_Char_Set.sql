-- Character Set and Collations

/*
A table that maps each character to a number.
*/

SHOW CHARSET LIKE 'utf%';

/*
Default collation are rules for how the charset treats characters in that language.

'utf8_general_ci' means case insensitive
MySQL reserves a max of 3 bytes for UTF8.

Most of the time you can stick to the default character set.
But sometimes maybe you want to decrease the type to decrease size
*/


/*
Example: CHAR(10)
If using UTF8, MySQL will reserve 30 bytes for each cell
1,000,000 records?
30,000,000 bytes for this column.
*/

/*
What about only accepting latin langugages?
Use... 'latin1'
will use 1/3 of the storage as UTF8
*/

/* Schema Inspector for a table, you can change the CHARACTERSET */

/* Actually, visually change it looking a TABLE information. */

/* Most of the time, you want to set character set at DB LEVEL */

CREATE DATABASE IF NOT EXISTS db_name
	CHARACTER SET latin1;

CREATE TABLE table1
(
)
CHARACTER SET latin1;

ALTER TABLE table1
CHARACTER SET latin1;



