-- Normalization

/*

1NF: 1st Normal Form
Each cell should have a single value and we cannot have repeated columns.
-- Makes "tags" a bad idea
-- can't have tag1, tag2, tag3
-- tags should be a separate table


2NF: 2nd Normal Form
Must have 1NF
Every table should describe one entity.
Every column in the table should describe that entity.
Where is the single place we need to store this info so it's not duplicated?


3NF: 3rd Normal Form
Must have 2NF
You don't have columns that are dependant on other columns.
I.e., should not be derrived from other columns.

First_Name, Last_Name.... Thus we should NOT have a column called FULL_NAME
Invoice_Total, Payment_Total... Thus we should NOT have a column called BALANCE
*/
