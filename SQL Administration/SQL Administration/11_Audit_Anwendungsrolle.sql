use northwind

exec sp_setapprole 'Gehaltsrolle', 'ppedv2019!'

use master
--man kann nur das tun, was der Rolle erlaubt wurde..

--Kontrolle: wir wollen wissen, ob jemand (Evi) auf die employees zugriff (SELECT)

-- wie k�nnte man einen INS UP DEL �berwachen?-- DML TRIGGER

--CREATE DROP ALTER -- DDL Trigger

--SELECT .? Tools.. Profiler  XEvents

--Audit

--Logfile (AUDIT)
--�berwachung auf Server oder DB
