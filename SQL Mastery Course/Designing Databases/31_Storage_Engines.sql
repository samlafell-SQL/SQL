-- Storage Engines

SHOW ENGINES;

/*
MyISAM: Old
InnoDB: New
*/

ALTER TABLE customers
ENGINE = InnoDB;


