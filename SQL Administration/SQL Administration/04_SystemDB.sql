/*

model
Vorlage f�r neue DB
create database (Kopie der Model)

Backup model?
..bei �nderungen .. selten 
--Backup oder per Script

master
Logins 
Datenbanken
Konfigurationen

Backup: Logo!!


msdb
DB f�r den Agent
Jobs, Verlauf , Zeitpl�ne, Proxykonten, Emailsystem, SSIS Paketre (Wartungsplan)

Backup: jupp.. defintiv


temdDB
M�lleimer ..nur 1mal pro Server
#tab  ##tab
Zeilenversionierung
IX Verwaltung
Auslagerung von RAM in tempdb ,wenn unzureichend gesch�tzt wurde

Backup? 
n�... was auch , ist ja alles weg..

--welche tut ma meisten weh.. msdb 

distribution
-nur bei Replkation
NEU seit SQL 2022
 man kann mehr Systemdbs wie master, msdb 


 --am besten Wartungsplan f�r SystemDB Sicherung

 --Agent muss laufen

*/