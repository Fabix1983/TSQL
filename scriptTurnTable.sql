DECLARE @tblProvincie TABLE (Regione varchar(250), Provincia varchar(250))
INSERT INTO @tblProvincie
SELECT 'Lazio','Frosinone'
INSERT INTO @tblProvincie
SELECT 'Lazio','Latina'
INSERT INTO @tblProvincie
SELECT 'Lazio','Rieti'
INSERT INTO @tblProvincie
SELECT 'Lazio','Roma'
INSERT INTO @tblProvincie
SELECT 'Lazio','Viterbo'
INSERT INTO @tblProvincie
SELECT 'Umbria','Terni'
INSERT INTO @tblProvincie
SELECT 'Umbria','Perugia'
INSERT INTO @tblProvincie
SELECT 'Toscana','Arezzo'
INSERT INTO @tblProvincie
SELECT 'Toscana','Firenze'
INSERT INTO @tblProvincie
SELECT 'Toscana','Grosseto'
INSERT INTO @tblProvincie
SELECT 'Toscana','Livorno'
INSERT INTO @tblProvincie
SELECT 'Toscana','Lucca'
INSERT INTO @tblProvincie
SELECT 'Toscana','Massa-Carrara'
INSERT INTO @tblProvincie
SELECT 'Toscana','Pisa'
INSERT INTO @tblProvincie
SELECT 'Toscana','Pistoia'
INSERT INTO @tblProvincie
SELECT 'Toscana','Siena'
INSERT INTO @tblProvincie
SELECT 'Toscana','Prato'
INSERT INTO @tblProvincie
SELECT 'Valle d''Aosta','Aosta'

-- Serve per ciclare l'ultimo elemento
INSERT INTO @tblProvincie
SELECT 'W_last', 'W_last'

SELECT 'PRIMA' AS RUN, * FROM @tblProvincie WHERE Regione <> 'W_last' ORDER BY Regione

DECLARE @tblProvinciePerRegione TABLE(Regione varchar(250), ElencoProvince varchar(5000))

DECLARE @sRiferimentoACT varchar(250)
DECLARE @sProvinciaACT varchar(250)
DECLARE @sRiferimentoOLD varchar(250)
SET @sRiferimentoOLD = ''
DECLARE @sElencoTot varchar(5000)
SET @sElencoTot = ''

DECLARE Prov_Cursor_Dst CURSOR
FOR
	SELECT Regione, Provincia FROM @tblProvincie ORDER BY Regione

OPEN Prov_Cursor_Dst

FETCH NEXT FROM Prov_Cursor_Dst
INTO @sRiferimentoACT, @sProvinciaACT

WHILE @@FETCH_STATUS = 0
BEGIN
	-- DEBUG
	-- SELECT @sRiferimentoACT AS sRiferimentoACT, @sRiferimentoOLD AS sRiferimentoOLD, @sElencoTot AS sElencoTot

	IF @sRiferimentoACT <> @sRiferimentoOLD AND @sRiferimentoOLD <> ''
	BEGIN
		IF EXISTS (SELECT * FROM @tblProvinciePerRegione WHERE Regione = @sRiferimentoOLD)
		BEGIN
			UPDATE @tblProvinciePerRegione
			SET ElencoProvince = @sElencoTot
			WHERE Regione = @sRiferimentoOLD
		END
		ELSE
		BEGIN
			INSERT INTO @tblProvinciePerRegione(Regione, ElencoProvince)
			SELECT @sRiferimentoOLD, @sElencoTot
		END
		SET @sElencoTot = @sProvinciaACT
		SET @sRiferimentoOLD = @sRiferimentoACT
	END
	ELSE
	BEGIN
		SET @sElencoTot = @sElencoTot + ' ' + @sProvinciaACT	
	END

	IF @sRiferimentoOLD = ''
	BEGIN
		SET @sRiferimentoOLD = @sRiferimentoACT
	END
	
	FETCH NEXT FROM Prov_Cursor_Dst
	INTO @sRiferimentoACT, @sProvinciaACT 
END
		
CLOSE Prov_Cursor_Dst
DEALLOCATE Prov_Cursor_Dst

SELECT 'DOPO' AS RUN, Regione, RTRIM(LTRIM(ElencoProvince)) AS ElencoProvince FROM @tblProvinciePerRegione ORDER BY Regione