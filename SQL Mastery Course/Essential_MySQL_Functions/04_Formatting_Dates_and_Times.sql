-- Formatting Dates and Times

-- Normal: '2019-03-11'

-- DATE_FORMAT(date_value, format_string)
SELECT DATE_FORMAT(NOW(), '%Y');

SELECT DATE_FORMAT(NOW(), '%M %d %Y');

-- SQL date and time functions on the website

SELECT TIME_FORMAT(NOW(), '%H:%i %p');