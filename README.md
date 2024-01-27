
-> spText_Search.sql

Procedura per la ricerca di una stringa di input all'interno delle stored procedure, funzioni e viste di un dato db SQL Server, con indicazione in uscita dell'elemento trovato con il relativo numero di occorrenze.

(Stored procedure for search an input string within the stored procedures, functions and views in a given SQL Server database, with output indication of the element found with the relative number of occurrences)


PROCEDURE [dbo].[spText_Search](@Text varchar(500)

-- utilizzo
EXEC dbo.spText_Search 'test'

-- uscita:
Elemento        Occorrenze
spText_Search	    1

----------------------------------------------------------------------------------------------------------------------------------------------------------------

-> spCreatePassword.sql

Stored Procedure per la creazione di una password randomica con caratteri minuscoli, maiuscoli, numeri e caratteri speciali con dimensione passata in ingresso.

(Stored Procedure for create a random password with alphabetic, special and numeric characters with input length size)

PROCEDURE [dbo].[spCreatePassword](@PasswordLen int, @Password VARCHAR(50) OUT)

-- utilizzo
DECLARE @sPWD varchar(50)
EXEC dbo.spCreatePassword 12, @sPWD OUT
SELECT @sPWD

----------------------------------------------------------------------------------------------------------------------------------------------------------------

-> scriptTurnTable.sql

Codice T-sql per concatenare in una colonna i record precedenti in righe a parità di riferimento chiave.

(T-sql code for concatenate the previous records in rows, with the same key reference, in a single column)

Esempio risultati:

RUN	    Regione	Provincia
PRIMA	Lazio	Frosinone
PRIMA	Lazio	Latina
PRIMA	Lazio	Rieti
PRIMA	Lazio	Roma
PRIMA	Lazio	Viterbo
PRIMA	Toscana	Arezzo
PRIMA	Toscana	Firenze
PRIMA	Toscana	Grosseto
PRIMA	Toscana	Livorno
PRIMA	Toscana	Lucca
PRIMA	Toscana	Massa-Carrara
PRIMA	Toscana	Pisa
PRIMA	Toscana	Pistoia
PRIMA	Toscana	Siena
PRIMA	Toscana	Prato
PRIMA	Umbria	Terni
PRIMA	Umbria	Perugia
PRIMA	Valle d'Aosta	Aosta

RUN	    Regione	        ElencoProvince
DOPO	Lazio	        Frosinone Latina Rieti Roma Viterbo
DOPO	Toscana	        Arezzo Firenze Grosseto Livorno Lucca Massa-Carrara Pisa Pistoia Siena Prato
DOPO	Umbria	        Terni Perugia
DOPO	Valle d'Aosta	Aosta

----------------------------------------------------------------------------------------------------------------------------------------------------------------

MIT license

Gianlorenzo Fabio