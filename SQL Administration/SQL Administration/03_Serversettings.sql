--Kontrolle von HV-SQL 1
--schulung\Administrator   ppedv2019!


--Installation nach best practice


--SSMS: 18.11.1
-- 19 Preview 2 ... SQL 2022
--immer die letzte Version !  + Azure Data studio Studio

/*

1. Trenne Daten von Logs
--theoretisch ja... aber wir haben nur einen HDD

2. MAXDOP = Anzahl der Kerne (max 8)
--Erweitert.. Max Grad der Paralellit�t: 2 

3.  tempdb : Anzahl der DAtendateien = Anzahl der Kerne max 8
--alle Datendateien der temoddb sollen / m�ssen gleich gro� sein
--wenn man man vergr��ert, dann alle gleich gro� machen...



4. Empf Arbeitsspeicher = sollte nicht 2,1 PB sein...
MIN: 0 , der Wert gilt erst als unterste Grenze ,wenn erreicht
MAX: 2,1PB
--Werte geleten nur wenn bereits belegt
--6 GB - OS--> 4000 MB MAX



--DB Settings..
--Backup komprimieren
-- +CHEKCUM pr�fen



*/