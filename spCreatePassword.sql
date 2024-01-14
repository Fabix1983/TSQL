CREATE PROCEDURE [dbo].[spCreatePassword](@PasswordLen int, @Password VARCHAR(50) OUT) AS 

SET @Password = ''

DECLARE @char char 
DECLARE @charint int
DECLARE @int int 
SET @int = 0

/*
97/122 Caratteri minuscolo
65/90 Caratteri maiuscolo
48/57 Numeri
33, 35, 36, 37, 38, 42, 43, 63, 64  Caratteri Speciali
*/

WHILE @int < @PasswordLen
BEGIN
	SET @charint = ROUND(RAND()*122,0)
	SET @char = CHAR(@charint)
	IF ( @charint >= 97 AND @charint <= 122 ) OR ( @charint >= 65 AND @charint <= 90 ) OR ( @charint >= 48 AND @charint <= 57 ) OR ( @charint IN (33, 35, 36, 37, 38, 42, 43, 63, 64 ) )
	BEGIN
		SET @password = @password + @char
		SET @int = @int + 1
	END
END

/*
-- UTILIZZO
DECLARE @sPWD varchar(50)
EXEC dbo.spCreatePassword 12, @sPWD OUT
SELECT @sPWD
*/
