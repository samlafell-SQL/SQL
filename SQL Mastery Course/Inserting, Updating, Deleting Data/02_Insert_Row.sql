-- INSERT a row

INSERT INTO customers
VALUES (
	DEFAULT, 
    'Sam', 
    'LaFell', 
    '1996-06-18',
    NULL,
    '1513 Collegeview Ave',
    'Raleigh',
    'NC',
    DEFAULT)


-- Also possible...
-- Define the columns we are entering in
INSERT INTO customers (
	first_name,
    last_name,
    birth_date,
    address,
    city,
    state
)
VALUES (
    'Sam', 
    'LaFell', 
    '1996-06-18',
    '1513 Collegeview Ave',
    'Raleigh',
    'NC')
