-- Needs Reformatting
SET
NOCOUNT ON;
SET
ANSI_NULLS ON;
SET
TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT
  [id],
  [name]
FROM
  [dbo].[example] ex
WHERE
  ex.[id]<252
ORDER BY
  ex.[name] DESC,
  ex.[date_created] ASC;