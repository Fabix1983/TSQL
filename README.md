
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

Regione	Provincia
Lazio	Frosinone
Lazio	Latina
Lazio	Rieti
Lazio	Roma
Lazio	Viterbo
Toscana	Arezzo
Toscana	Firenze
Toscana	Grosseto
Toscana	Livorno
Toscana	Lucca
Toscana	Massa-Carrara
Toscana	Pisa
Toscana	Pistoia
Toscana	Siena
Toscana	Prato
Umbria	Terni
Umbria	Perugia
Valle d'Aosta	Aosta

Regione         ElencoProvince
Lazio           Frosinone Latina Rieti Roma Viterbo
Toscana         Arezzo Firenze Grosseto Livorno Lucca Massa-Carrara Pisa Pistoia Siena Prato
Umbria          Terni Perugia
Valle d'Aosta   Aosta

----------------------------------------------------------------------------------------------------------------------------------------------------------------

MIT license

Gianlorenzo Fabio