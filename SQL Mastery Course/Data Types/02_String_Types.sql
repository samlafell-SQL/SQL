-- String Types

/*

CHAR(x) : Fixed-Length
VARCHAR(x) : Variable-Length

Can store Zip Codes and Phone Numbers here.

These values may contain hyphen or ().

VARCHAR(50) for short
VARCHAR(255) for medium-length
	- max is 65,535
MEDIUMTEXT
	- max is 16M
    - good for CSV, JSON, and Books
LONGTEXT
	- max is 4GB
    - textbooks and years of log files
    
TINYTEXT
	- max is 255 bytes
TEXT
	- max is 64KB

VARCHAR is better than TINYTEXT or TEXT because
VARCHAR can be indexed.

Bytes:
1: English
2: European & Middle Eastern
3: Asian

so CHAR(10) will reserve 30 bytes. */