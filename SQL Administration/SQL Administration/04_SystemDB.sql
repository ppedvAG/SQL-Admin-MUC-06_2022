/*

model
Vorlage für neue DB
create database (Kopie der Model)

Backup model?
..bei Änderungen .. selten 
--Backup oder per Script

master
Logins 
Datenbanken
Konfigurationen

Backup: Logo!!


msdb
DB für den Agent
Jobs, Verlauf , Zeitpläne, Proxykonten, Emailsystem, SSIS Paketre (Wartungsplan)

Backup: jupp.. defintiv


temdDB
Mülleimer ..nur 1mal pro Server
#tab  ##tab
Zeilenversionierung
IX Verwaltung
Auslagerung von RAM in tempdb ,wenn unzureichend geschätzt wurde

Backup? 
nö... was auch , ist ja alles weg..

--welche tut ma meisten weh.. msdb 

distribution
-nur bei Replkation
NEU seit SQL 2022
 man kann mehr Systemdbs wie master, msdb 


 --am besten Wartungsplan für SystemDB Sicherung

 --Agent muss laufen

*/