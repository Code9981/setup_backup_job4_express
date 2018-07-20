USE [MSDB]
GO
/****** 
Object:  StoredProcedure [dbo].[USP_backupdatabase]    
Owner: Code9981
Description: this SP accepts one parameter @db as the databasename to be backed up and one paramter for specifying the path; and create database backup files with name as MYDB_YYYYMMDD.bak format

Script Date: 7/20/2018 8:42:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[USP_backupdatabase] 
@db varchar(50), --eg @db='MYDB'
@path varchar(100) --eg @path='C:\SQLBACKUP\' please note to add '\' at the end.

AS 

set nocount on
DECLARE @backupfilename varchar(100)

Select @backupfilename=(SELECT @path+@db+'_'+convert(varchar(100),getdate(),112)+'.bak')

BACKUP DATABASE @db TO  DISK =@backupfilename

