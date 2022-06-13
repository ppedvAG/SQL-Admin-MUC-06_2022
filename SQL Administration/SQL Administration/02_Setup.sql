--Eigenständige Installation

--Mehrfache Installation --> Instanzen  (25)
--Was haben wir davon ?
--Jede Installation ist eine komplett vorllständig eig Installation

--Warum sollte ihch das machen?
--aus Sicherheitsgründen... SA hat Vollzugrff
----Optimierung wg Serversettings



--Instanzfunktion (merhfach installierbar)
---DB Engine + Volltext und Replikation


--Freigegeben Funktion
--muss man nur 1* installieren


--Instanzname
--pro Rechner eine StadINstanz
--Aufruf:  PC  (Port 1433)
--noch weitere Instanzen.. 25

-- Aufruf
-- PC\Instanzname   (Port ???????)  random Port



--DIENSTE


--Agent (Jobs per Zeitplan).. braucht sicher Netzwerkzugrff
--SQL Datenabnkengine = SQL Server
--Browserdienst ..kann man gut bei benannten Instanzen brauchen  UDP 1434
--Volltext , wenn man Volltext verwendet..


--Dienstkonten: NT Service\........    
--sind lokale Konten 
--machen autom Kennwortänderungen
--arbeiten im Netzwerk mit Comouterkonto

--es sind auch DOMUser einsetzbar

--Volumewartungstask .. bei Haken werden Dateivergrößerung vn SQL Server selbst übernmommen und nicht mehr vorher ausgenullt



--Authentifizierung
--SQL Login nur dann , wenn keine DOM Auth möglich ist


--Windows Admins sind keine SQL Admions mehr
-- es können auch Grupen hinzugefügt werden


--Pfade: Trenne Daten von Logs phsikalisch


--Tempdb ..sollte eig HDs haben
--sollte soviele DAtendateien wie Kerne haben... max 8



--MAXDOP
--Anzahl der Kerne, max 8  darf eine Abfrage maximal bekommen..

--Arbeitsspeicher

--Gesamter RAM - OS (ca 2 bis 10GB)) --> MAX RAM
--MIN : 0
--
