-- Needs Reformatting


   SET nocount
    ON;

   SET ansi_nulls
    ON;

   SET
TRANSACTION
ISOLATION LEVEL READ COMMITTED;
SELECT [id],
       [name]

  FROM [dbo].[example] ex

 WHERE ex.[id] < 252

 ORDER BY ex.[name] DESC,
          ex.[date_created] ASC;