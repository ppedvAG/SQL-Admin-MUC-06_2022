/* BACKUP


Wie oft muss ich sichern?


Firmenregel:  2 Fragen
wie lange darf der Server ausgefallen sein?
wie hoch darf der DAtenverlust sein in Zeit?  regelt das mind INtervall einer Sicherung

kann nur Zeitpunkte wieder herstellen

Fälle

1. DB defekt --dbcc checkdb
2. HDD Ausfall (LDF oder /  und MDF)
3. SQL ist tot ( Hardware tot, aber HDD ist noch da)
4. SQL tot oder DB tot.  normaler Restore
5. versehentliches Ändern/Löschen von Daten

update kunden set city = 'Paris'

6. Wenn ich ich schon ahne , dass gleich was passierten kann?



--Welche Arten von Backup gibts?

Voll   V
sichert nach Checkpoint alle Datendateien und das LDF weg
Pfad, Dateiname, und Daten  es wird keine Luft mitgesichert

DIff  D
sichert nach Checkpoint alle geänderten Seiten bzw Blöcke seit der letzten V weg

Transaktionsprotokoll    T
schreibt Anweisungen mit (DML)
alle TX , die commitzed sind werden in das Backup geschrieben und aus dem Log entfernt



V   6:00
	T
	T
	T
	D
	T
	T
	T
	D
	T
	T
	T
	D 17 Uhr
	T
	T
	T  18:00
	alle 30min T Sichern, dann würder T Restore max 30min

	um 18 Uhr zu restore benötigt man: 
	das letzte V
	das letzte D
	alle nachfolgende Ts

	--welche Sicherung bietet den schnellsten Restore?
	V

	--daher sollte man das V so oft wie möglich sichern?

	--wie lange dauert der restore eines T?
	der Restore eines T dauert so lange , wie die Anweisungen brauchen
	 daher sollte man T in kürzeren Zyklen sichern und nicht viele Ts am Stück restore müssen
	 daher auch Ds dazwischen streuen

	 V TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT dauert 3 Stunden
	 V                                                                                             DTTT   dauert 10min
	 V TTTTTTT X TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTDTTTT
	 -----------| Restorebar

Ein D verkürzt den Restore und sichert den Restore ab..


--RecoveryModel
USE [master]
GO
ALTER DATABASE [Northwind] SET RECOVERY FULL WITH NO_WAIT


--Model:

Einfach
das T protokolliert alle DML Anweisungen, auch BULK Befehle
Ist die Anweisung fertig, dann verschwindet die aus dem Protokoll
also eine Sicherung des T macht keinen Sinn und ist nicht möglich
man kann nur V zd D restore

Massenprotokolliert
wie Model Einfach, aber es wird nichts gelöscht
es werden BULK Befehle nicht exakt bobachtet
man kann nur dann auf Sekunde restoren, wenn kein BULK vorkam
man muss das T sichern

Vollständig
es wird nichts gelöscht
es wird alles pedantisch protkolliert
daher ein Restore auf Sek möglich
man muss das T sichern - sonst gigantisch großt

!!! Nur eine T Sicherung löscht TX aus dem Log heraus, da diese in das Backup kommen..



---VOLL
BACKUP DATABASE [Northwind]
TO  DISK = N'D:\_BACKUP\Northwind.bak' 
WITH NOFORMAT, NOINIT,  NAME = N'Nwind Voll', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO


--DIFF
BACKUP DATABASE [Northwind] 
TO  DISK = N'D:\_BACKUP\Northwind.bak' WITH  DIFFERENTIAL , 
NOFORMAT, NOINIT,  NAME = N'Nwind Diff', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO


--TLOG
BACKUP LOG [Northwind] TO  DISK = N'D:\_BACKUP\Northwind.bak' 
WITH NOFORMAT, NOINIT,  NAME = N'Nwind Log', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

--UHRZEIT: 10:32

--15 MIn
--V   TTT D TTT D TTT D TTT


--Fälle

-- Fall 5:
--Versehentliches Löschen / Ändern von Daten
--restore als anderen DB mit anderen Namen und anderen DAteinamen..
--Fragmentsicherung ausschalten


--Fall 4: kompletter Restore auf anderen Server
--auf DAtenbanken "restoren"
--evtl Pfade kontrollieren und ändern..

--Fall 3 
--eine Datei ist defekt oder Server ist tot und HDD ist noch da

--DB Offline / getrennt
--ist eine DB offline oder getrennt, dann kann man Dateien kopieren

--Man braucht zum Anfügen mind die mdf
--Fehlt das Log , dann kann man sich erstellen alssen (Log mit Error Meldung entfernen)



--Fall: saublöd.. Userfehler versehentlich DAten manipuliert und man muss ordentlich restoren..

--um  eine DB zu restore müssen alle User runtergworfen werden und die Dateien mbzw DB muss durch das Backup ersetzt werden

-Firmenregel: so gering wie möglich DAtenvelust

--- Sicherung 1032 T 
--  Error  11:15 
-- nächste Backup käme um 11:30 (TLogsicherung)

-idee 1:	Restore vo 1032 alles bis 11:24 weg
--Idee 2:  Warten bis 11:30 , dann haben wir ein T (10:32 bis 11:30) Restore 11:14
			--Verlust alles weg von 11:14 bis 1130
Idee 3: Warumj warten bis 1130.. man kann jetzt auch ein T Backu machen und keiner darf mehr was tun...
--Datenverlust 11:16   11:14 .. 
*/

USE [master]
ALTER DATABASE [Northwind] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
BACKUP LOG [Northwind] TO  DISK = N'D:\_BACKUP\Northwind_LogBackup_2022-06-14_11-30-41.bak' WITH NOFORMAT, NOINIT,  NAME = N'Northwind_LogBackup_2022-06-14_11-30-41', NOSKIP, NOREWIND, NOUNLOAD,  NORECOVERY ,  STATS = 5
RESTORE DATABASE [Northwind] FROM  DISK = N'D:\_BACKUP\Northwind.bak' WITH  FILE = 25,  NORECOVERY,  NOUNLOAD,  REPLACE,  STATS = 5
RESTORE DATABASE [Northwind] FROM  DISK = N'D:\_BACKUP\Northwind.bak' WITH  FILE = 37,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [Northwind] FROM  DISK = N'D:\_BACKUP\Northwind.bak' WITH  FILE = 38,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [Northwind] FROM  DISK = N'D:\_BACKUP\Northwind.bak' WITH  FILE = 39,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [Northwind] FROM  DISK = N'D:\_BACKUP\Northwind.bak' WITH  FILE = 40,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [Northwind] FROM  DISK = N'D:\_BACKUP\Northwind_LogBackup_2022-06-14_11-30-41.bak' WITH  NOUNLOAD,  STATS = 5,  STOPAT = N'2022-06-14T11:15:00'
ALTER DATABASE [Northwind] SET MULTI_USER

GO


--Fall: Wenn ich weiss, dass was passiert..

--Momentaufnahme: 
--keine GUI
--dafür TSQL


USE master
GO


-- Create the database snapshot
CREATE DATABASE Nwind_1150 ON
( NAME = Northwind,  --logische Name der Datendatei der Northwind
FILENAME = 'D:\_SQLDBDATA\Nwind_1150.mdf' ) --, ()
AS SNAPSHOT OF Northwind
GO

--Restore erin DB durch Snapshot

--1 Kein User darf auf einer der beiden DBs sein
--wie: Aktivitätsmonitor

--2 

restore database northwind
from database_Snapshot = 'Nwind_1150'

---Kann man mehr Snapshots haben?
--Ja

--Kann man einen Snapshot sichern?
--Nö

--Kann man einen Snapshot restoren?
--Hä... Nöööö

--Kann man die OrgDB backup?
--Hoffe doch. jaa geht!!

--Kann man die OrgDB restoren?
--Nö... dafür muss man alle Snapshots vorher löschen




---Backupstrategie

--Arbeitstzeiten: MO bis FR 
--6:00 bis 20 Uhr

--DB Größe : 15 GB

--Wie lange darf die DB ausfallen ( in Minuten oder Stunden)?  1 h
--Wie groß darf ein max Datenverlust in Zeit sein ( min/h) ? 30min 

--V  : täglich ausser SA/SO   21 UHR
--T: alle 30min Mo bis Fr  von 6:30 bis 20:00
--D :alle 3 bis 4 T  alle 2 Stunden MO bis FR von 8:15 bis 20:15

--Wartungsplan

--Ola Hallengren


--Arbeitstzeiten: MO bis FR 
--6:00 bis 20 Uhr

--DB Größe : 1500 GB

--Wie lange darf die DB ausfallen ( in Minuten oder Stunden)?  1 h
--Wie groß darf ein max Datenverlust in Zeit sein ( min/h) ? 15min 

--V  : täglich ausser SA/SO   21 UHR
--T: alle 30min Mo bis Fr  von 6:30 bis 20:00
--D :alle 3 bis 4 T  alle 2 Stunden MO bis FR von 8:15 bis 20:15

select 1500000/300/60

--was wenn der Restore länger dauern würde als die Ausfallzeit erlaubt?
-- HADR  Cluster  AVG Hochverfügbarkeit



--Was ist mit den SystemDBs?
--alle sind defekt

--model
--msdb
--master

von C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Binn\Templates in die DB Verzeichnisse reinkopieren und ie alten kaputte ersetzen

--auch der jew. System DB restore beginnen
--die msdb muss in einem Einzelbenutzermodus sein
--bei master muss der Server in Einzelbenutzermodus sein
----Startparameter  -m