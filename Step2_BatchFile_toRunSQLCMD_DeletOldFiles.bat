:: copy the following and modify the instance name, username password, YourDatabaseName, YourSQLBACKUPfolder and the days to keep and save to a location you remember which will be used in next step

SQLCMD -S.\SQL2016express -U username -P passsword -Q "EXEC MSDB.dbo.USP_backupdatabase @db='YourDatabaseName', @path='YouSQLBACKUPfolder'"

:: this is to delete 10days older files in the folder

FORFILES /P "YourSQLBACKUPfolder" /S  /M *.* /D -10 /C "cmd /c del @path"
