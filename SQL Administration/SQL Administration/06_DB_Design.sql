--DB Design

/*

Spalten und Datentypen

Primary Key -Prim�rschl�ssel      
---achtet darauf, dass ein DS eindeutig ist
--PK --->  Beziehung -- FK

Beziehung:
PK Werte k�nnen nicht gel�scht werden, wenn FK Werte vorhanden sind

Fremdschl�ssel


Normalsierung
1 NF  atomar .. jede Zelle nur ein Wert
2 NF  Jede Zeile hat einen PK
3 NF  alle Spalten ausserhalb des PK d�rfen keine gegens. Abh�ngigkeiten



Datentypen

'Otto'

char(50)			'otto                                                 ' 50 
varchar(50)		'otto'   4
nvarchar(50)	'otto'    4 * 2    8
nchar(50)       'otto                 ' 50 *2                    100
text()   .NICHT MEHR NEHMEN!!!!!!!!!!

--bei fixen L�ngen char un dbei var L�nge varchar-. und wenn Zeichensatz unklar dann n...


--Bestelldatum
date
datetime(ms)
smalldatetime (sek)
datetime2 (ns)
datetieoffset (ms und Zeitzone)

--Zahlen
int +- 2,1 Mrd
smallint  32000
tinyint  + 255
money (kommt von float hat aber nur 8 Nachkommastellen)
decimal (5,2)   5 Zeichen davon 2 Nachkommastellen

besondere
XML
Geo (L / B)
geometry



--schlechtes Design.. datetime wenn keine Zeit sein muss
n... wenn kein b�sonders Zeichensatz 





Indizes



*/

use Northwind
delete from Customers where customerid = 'ALFKI'

select * from orders where customerid = 'ALFKI'
