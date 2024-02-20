SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO

CREATE PROCEDURE [TokenPrice].[Token_Get]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [CoinMarketCapTokenId],
        [Token],
        [Enabled]
    FROM TokenPrice.Token(NOLOCK)
END
GO


