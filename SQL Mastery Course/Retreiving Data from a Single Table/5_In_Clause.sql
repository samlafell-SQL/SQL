-- IN Clause

SELECT *
FROM Customers
WHERE state /*NOT*/ in ('VA', 'GA', 'FL');