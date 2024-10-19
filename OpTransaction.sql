

SELECT * FROM tblUtenti
SELECT * FROM tblProfessioni

SET XACT_ABORT ON
BEGIN TRANSACTION tr

UPDATE tblUtenti
SET Nome = 'Lucas'
WHERE ID = 1

/*
UPDATE tblProfessioni
SET Nome = 'Astronauta'
WHERE ID = 1
*/

ROLLBACK TRANSACTION tr