-- Needs Reformatting

SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


SELECT [id], [name]
FROM [dbo].[Example] ex
WHERE ex.[id] < 252
order by
  ex.[name] desc,
  ex.[date_created] asc;
