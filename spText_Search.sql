CREATE PROCEDURE [dbo].[spText_Search](
	@Text varchar(500)
)AS

SELECT
	O.name AS Elemento,
	COUNT(*) AS Occorrenze
FROM
	syscomments C
	INNER JOIN sysobjects O ON C.id = O.id
WHERE
	C.text LIKE '%' + @Text + '%' and
	O.name <> @Text
GROUP BY 
	O.name
ORDER BY 
	COUNT(*) desc

/*
-- utilizzo
EXEC dbo.spText_Search 'test'
*/