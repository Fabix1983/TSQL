
-> <b>spText_Search.sql</b>

Procedura per la ricerca di una stringa di input all'interno delle stored procedure, funzioni e viste di un dato db SQL Server, con indicazione in uscita dell'elemento trovato con il relativo numero di occorrenze.

(Stored procedure for search an input string within the stored procedures, functions and views in a given SQL Server database, with output indication of the element found with the relative number of occurrences)


PROCEDURE [dbo].[spText_Search](@Text varchar(500)

-- utilizzo
EXEC dbo.spText_Search 'test'

-- uscita:
Elemento        Occorrenze
spText_Search	    1

----------------------------------------------------------------------------------------------------------------------------------------------------------------

-> <b>spCreatePassword.sql</b>

Stored Procedure per la creazione di una password randomica con caratteri minuscoli, maiuscoli, numeri e caratteri speciali con dimensione passata in ingresso.

(Stored Procedure for create a random password with alphabetic, special and numeric characters with input length size)

PROCEDURE [dbo].[spCreatePassword](@PasswordLen int, @Password VARCHAR(50) OUT)

-- utilizzo
DECLARE @sPWD varchar(50)
EXEC dbo.spCreatePassword 12, @sPWD OUT
SELECT @sPWD

----------------------------------------------------------------------------------------------------------------------------------------------------------------

-> <b>scriptTurnTable.sql</b>

Codice T-sql per concatenare in una colonna i record precedenti in righe a parità di riferimento chiave.

(T-sql code for concatenate the previous records in rows, with the same key reference, in a single column)

Esempio risultati:

PRIMA:
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

DOPO:
Regione         ElencoProvince

Lazio           Frosinone Latina Rieti Roma Viterbo

Toscana         Arezzo Firenze Grosseto Livorno Lucca Massa-Carrara Pisa Pistoia Siena Prato

Umbria          Terni Perugia

Valle d'Aosta   Aosta

----------------------------------------------------------------------------------------------------------------------------------------------------------------
-> <b>Test Utilizzo WITH (NOLOCK)</b>

FILE:

OpTransaction.sql 
(lasciare transazione pending)

SelectTest.sql 
(provare le diverse select, quella senza no lock non restituirà i dati finche la transazione non viene confermata o annullata.)

L'utilizzo della clausola WITH (NOLOCK) applicata a SELECT di SQL SERVER permette di ottenere i risultati della select anche quando questa è lockata da una transazione pending permettendo cosi
di evitare lunghi tempi di attesa dovuti all'attesa del commit/rollback della transazione relativa o possibili deadlock del recupero dati.

Svantaggio dell'utilizzo di questa clausola è ovviamente il fatto che se la transazione va in rollback i dati in uscita mostrati non sono coerenti con la transazione in quanto la select restituisce una "fotografia dei dati in quel preciso istante" pertanto non è consiglibile applicarla a quei contesti in cui i dati subiscono variazioni molto frequenti; ma nei contesti dove applicabile porta a una riduzione dei tempi di fornitura dei dati da parte delle select coinvolte.

ESEMPIO di uso:
SELECT * 
FROM tblUtenti UT WITH (NOLOCK)
INNER JOIN tblProfessioni PR WITH (NOLOCK) ON Pr.ID = UT.RifProfessione

----------------------------------------------------------------------------------------------------------------------------------------------------------------

MIT license

Gianlorenzo Fabio
