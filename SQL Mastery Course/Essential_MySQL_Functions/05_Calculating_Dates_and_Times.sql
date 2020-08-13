-- Calculating Dates & Times


-- adding a day
SELECT DATE_ADD(NOW(), INTERVAL 1 DAY);

-- Subtracting a year
SELECT DATE_SUB(NOW(), INTERVAL 1 YEAR);

-- Difference in dates
SELECT DATEDIFF('2019-01-01 9:00', '2019-01-05 17:00');

-- SECONDS elapsed since midnight
SELECT TIME_TO_SEC('09:02') - TIME_TO_SEC('09:00');