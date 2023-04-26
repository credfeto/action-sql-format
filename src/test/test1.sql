-- Needs Reformatting

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


SELECT *
FROM [dbo].[Example] ex
WHERE ex.[id] < 252;