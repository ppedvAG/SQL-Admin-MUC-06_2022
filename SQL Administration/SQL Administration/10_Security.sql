--Security
USE [master]
GO
CREATE LOGIN [EVI] WITH PASSWORD=N'123', DEFAULT_DATABASE=[Northwind], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [Northwind]
GO
CREATE USER [EVI] FOR LOGIN [EVI]
GO

--SID 0x950D85941F4F1D45B78E523E7D2BBF2B

use northwind

select * from sysusers

select * from syslogins
--das gleiche mit Fritz.. SQL Login mit STD DB northwind Kennwort 123


USE [master]
GO
CREATE LOGIN [Fritz] WITH PASSWORD=N'123', DEFAULT_DATABASE=[Northwind], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
use [msdb];
GO
USE [Northwind]
GO
CREATE USER [Fritz] FOR LOGIN [Fritz]
GO



USE [Northwind]
GO
CREATE SCHEMA [IT] AUTHORIZATION [dbo]
GO
USE [Northwind]
GO
CREATE SCHEMA [MA] AUTHORIZATION [dbo]
GO


--ADMIN

use 

create table it.personal(
										itpersonal int
										)

create table it.kst (itkst int)

create table ma.personal(
										mapersonal int
										)

create table ma.kst (makst int)


--Fritz  IT

select * from northwind.it.kst

NORTHWIND
				-----IT
						-------KST


						use [Northwind]
GO
GRANT SELECT ON SCHEMA::[MA] TO [EVI]
GO
use [Northwind]
GO
GRANT SELECT ON SCHEMA::[IT] TO [Fritz]
GO


select * from orders

select * from kst

select * from it.kst

--STD Schema: normalerweise dbo

select * from orders

select * from kst --geht nicht weil es keine dbo.kst gibt

USE [Northwind]
GO
ALTER USER [EVI] WITH DEFAULT_SCHEMA=[MA]
GO
USE [Northwind]
GO
ALTER USER [Fritz] WITH DEFAULT_SCHEMA=[IT]
GO


use [Northwind]
GO
GRANT SELECT ON [IT].[kst] TO [EVI]
GO


use [Northwind]
GO
GRANT CREATE TABLE TO [EVI]
GO


USE [Northwind]
GO
CREATE ROLE [ITRolle] AUTHORIZATION [dbo]
GO
USE [Northwind]
GO
ALTER ROLE [ITRolle] ADD MEMBER [Fritz]
GO


use [Northwind]
GO
REVOKE SELECT ON SCHEMA::[IT] TO [Fritz] AS [dbo]
GO
use [Northwind]
GO
GRANT SELECT ON SCHEMA::[IT] TO [ITRolle]
GO


USE [master]
GO
CREATE LOGIN [Peter] WITH PASSWORD=N'123', DEFAULT_DATABASE=[Northwind], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
use [msdb];
GO
USE [Northwind]
GO
CREATE USER [Peter] FOR LOGIN [Peter]
GO
USE [Northwind]
GO
ALTER USER [Peter] WITH DEFAULT_SCHEMA=[IT]
GO
USE [Northwind]
GO
ALTER ROLE [ITRolle] ADD MEMBER [Peter]

GO



--Besitz immer dem DBO geben..!!!

USE [Northwind]
GO
CREATE APPLICATION ROLE [Gehaltsrolle] WITH DEFAULT_SCHEMA = [dbo], PASSWORD = N'ppedv2019!'
GO



