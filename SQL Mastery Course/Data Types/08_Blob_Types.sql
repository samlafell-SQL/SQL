-- Blob Types

/*

Large binary data...
Images, videos, etc...

TINYBLOB: 255b
BLOB: 65kb
MEDIUMBLOB: 16MB
LONGBLOB: 4FB

*/


/* Usually it's better to keep these files out of databases

Will experience performance problem.

Should read images from file structure and not databases.

Take all this into account

*/