
-- Eseguita anche con transazione pending
SELECT 'WITH (NOLOCK)', * 
FROM tblUtenti WITH (NOLOCK)

-- Eseguita anche con transazione pending
SELECT 'WITH (NOLOCK)', * 
FROM tblUtenti UT WITH (NOLOCK)
INNER JOIN tblProfessioni PR WITH (NOLOCK) ON Pr.ID = UT.RifProfessione

-- NON eseguita finche la transazione non viene committata o rollbackata
SELECT 'NORMALE', * 
FROM tblUtenti