use northwind

exec sp_setapprole 'Gehaltsrolle', 'ppedv2019!'

use master
--man kann nur das tun, was der Rolle erlaubt wurde..

--Kontrolle: wir wollen wissen, ob jemand (Evi) auf die employees zugriff (SELECT)

-- wie könnte man einen INS UP DEL überwachen?-- DML TRIGGER

--CREATE DROP ALTER -- DDL Trigger

--SELECT .? Tools.. Profiler  XEvents

--Audit

--Logfile (AUDIT)
--Überwachung auf Server oder DB
