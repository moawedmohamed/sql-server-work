
-- for make the backup for the database 
BACKUP DATABASE [hello]
TO DISK = N'/var/opt/mssql/backups/backUp.bak'
WITH FORMAT, INIT;

-- make the restore this database trhat you make backup for it 

USE master;
ALTER DATABASE [hello]
SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

RESTORE DATABASE [hello]
FROM DISK = N'/var/opt/mssql/backups/backUp.bak'
WITH REPLACE;

ALTER DATABASE [hello]
SET MULTI_USER;
