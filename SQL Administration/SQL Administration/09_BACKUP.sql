/* BACKUP


Wie oft muss ich sichern?


Firmenregel:  2 Fragen
wie lange darf der Server ausgefallen sein?
wie hoch darf der DAtenverlust sein in Zeit?  regelt das mind INtervall einer Sicherung

kann nur Zeitpunkte wieder herstellen

Fälle

1. DB defekt
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
