--TAG 2

--Backup Security

--Login    vs     User?  
 SID

--Login = Betreten des SQL SQL Server  (master) 
--NT Logins  od / und SQL Logins

--NT Logins  wird die Windows SID verwendet
--SQL Konten: eigen SID generiert

select name, * from syslogins
select * from sysusers
--User = Rechte in der DB   (BenutzerDB SEL INS UP DEL CREATE .. 


--Backup
Ph.bak------> Andreas --- Restore auf Andreas Rechner

--in der DB ist ein Otto.. hat aber kein Login , weil dsa in der master von Philipp drin ist

--kopie der master .. nicht so gut

--Tipp:
--Google: sp_helprevlogin


-- V   TTT   D  TTT  D TTT

--V							D TTT





--Wer macht regelm Backups und wer macht Restore?--SQL Agent per Zeitplan --- Restore: SQL Dienst
--Und wer macht ein manuelles Backup?  SQL Dienst
--Es greift immer das Dienstkoto auf externe Ressourcen zu

select 1600/33 --48MB / Sec ..auch TTT dabei
select 1100/3 ---366MB /sec nur V 

--so häufig wie möglich ein V, desto schneller der Restore
--mach das T in rel kurzen Intervalllen.. 15/30min
--streue immer wieder ein D zwischen den T ein. alles 3 bis 4 T, damit wird der Restore verkürzt und auch gesichert

--Wie lange darf der Server ausfallen bzw DB?  Reaktionszeit + Restoredauer
--Wie groß darf der DAtenverlust sein in min?  regelt das T

--DB 150gb
--Ausfallzeit 15min-- Hochverfügbarkeit
--HADR: Logshipping (sekundäre DB mit delta t von min  (1 min)
--          Spiegelen DB sind synchron und unter 3 Sekunden Failover (10 sek)
--         Availability Groups.. = Spiegeln (1 min)
--			Cluster: schützt nicht vor Ausfall einer Datei oder DB  (30min bis Stunde)

--V TTTTTTTxTTTTTTDTTTTTTTTTDTTTTTTTTTTTTTTTTDTTTTT

--Proxy
--braucht man für Auftäge für ext Ressourcen.. und AGent hat und soll das Recht nicht besitzten
--wie ausführen als