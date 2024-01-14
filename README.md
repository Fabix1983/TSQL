
spText_Search.sql

Procedura per la ricerca di una stringa di input all'interno delle stored procedure, funzioni e viste di un dato db SQL Server, con indicazione in uscita dell'elemento trovato con il relativo numero di occorrenze.

(Stored procedure for search an input string within the stored procedures, functions and views in a given SQL Server database, with output indication of the element found with the relative number of occurrences)


PROCEDURE [dbo].[spText_Search](@Text varchar(500)

-- utilizzo
EXEC dbo.spText_Search 'test'

-- uscita:
Elemento        Occorrenze
spText_Search	    1

MIT license

Gianlorenzo Fabio