--Monitoring

----Meldung: Problem SQL langsam

---- Reihenfolge für Monitoring
--1.  Taskmanager: Ausschluss andere Dinge (Anitvirentool, Viren, Trojaner..)
--- mslaugh.exe   teakids.exe mit Admin acount
--> nix gefunden...

--2 SQL Server genauer anschauen
--> Aktivitätsmonitor  
----> Wartezustände

select * from sys.dm_os_wait_stats

--wait_time = gesamte Wartezeit
--signal_time = Wartezeit auf Ressource  (= ein Teil der gesamt Wartezeit)
--alle Zeiten sind kummulierend

--alle Sessions mit SID > 50 sind User (auch Agent)



--DMVs Data Management Views

select * from sysprocesses

---historische Betrachtung

--sammlet alle Wartezeiten kummulierend seit Neustart

select * from sys.dm_os_wait_stats
--eigtl müssten wir folgendes tun
-- wenn man alle Wartezeiten addiert = gemsamte  Laufzeit des Servers
--Wartezeit einer Ressource im Vergleich zur gesamt Laufzteit

--Wenn wir alle zB 10min die Wartenzeiten speichern, 

LCK_M_S	242	5894499	1855310	33    um 10 Uhr
LCK_M_S	242	5894499	1855310	33   um 10:10 
LCK_M_S	242	8745766	1855310	33  um 10:20

--Neben der Datensammlung kann man auch Abfragen direkt messen
-- set statistics io, time on 
--sowie Abfragepläne

--Diese bieten wertvolle Hinweise, erfordern aber aktives Monitoring
set statistics io,time on

select * from orders where freight > 10


select * from custorders where id = 100
--250ms CPU .. 128ms Dauer... 60240 Seiten

--nach QueryStore und IX Vorschlag aus dem QueryStore
--, CPU-Zeit = 0 ms, verstrichene Zeit = 0 ms.
--Seiten : 4 

select 8*60000 --- 480MB RAM 
select 4 * 8 = 32 kb
--22 Seiten   IO = RAM
--00 ms Analyse
--CPU-Zeit = 0 ms, verstrichene Zeit = 170 ms.

--> Sehr cool´daher: Query Store Merkt sich , fast unscheinbar - die Messwerte und Pläne, und bereitet die grafisch auf... auf Dauer
--> muss alerdings aktiviert werden




select * into #t from sysmessages

--Datensammlung... 
--regelm Messungen per DMVs und archviert die Ergebnisse in einer DB

select 30*2*14440*730--- 632 Mio