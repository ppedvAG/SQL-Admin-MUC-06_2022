--DB --
--Tipp: immer markieren und ausf�hren

create database schulungsDB
GO


--DB Grundeinstellungen
--Anfangsgr��e der Datendatei und des Logfiles


--Datendatei: 8 MB
--Logfile : 8 MB

--Wachstum: 64 MB pro Daten und Logfile

--fr�her (SQL 2014):  5MB Daten und 2 MB Logfile
--  1 MB Wachstum bei Daten und 10% bei Logfile


use schulungsDB;
GO


create table t1 (
							id int identity, 
							spx char(4100)
							)

insert into t1
select 'XY' 
GO 20000 ---14 Sek

--DIE DB m�sste eigtl 80MB gro� sein




create table t2 (
							id int identity, 
							spx char(4100)
							)

insert into t2
select 'XY' 
GO 20000 ---13 Sek

select 3*150


--Idee: man macht die Anfangsgr��en gleich so gro�. wie die Lebenszeit der DB auf dem Server
-- das Lgfileca 25% der Datendatei

--Vergr��erungsraten : ca 1024MB

--Trenne Daten von Logfile pro DB --eig HDDs