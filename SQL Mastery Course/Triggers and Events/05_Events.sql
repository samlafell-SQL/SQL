-- Events

/* What are they?
A task or block of code that gets updated on a regular schedule */

SHOW VARIABLES;

-- Event scheduler variable

SHOW VARIABLES LIKE 'event%';
SET GLOBAL event_scheduler = ON;

DELIMITER $$
CREATE EVENT yearly_delete_stale_audit_rows -- start names with intervals
ON SCHEDULE
	-- AT '2019-05-01'
    -- EVERY 2 DAY
    EVERY 1 YEAR STARTS '2019-01-01' ENDS '2029-01-01'
DO BEGIN
	DELETE FROM payments_audit
    WHERE action_date < NOW() - INTERVAL 1 YEAR;
END $$

DELIMITER ;
