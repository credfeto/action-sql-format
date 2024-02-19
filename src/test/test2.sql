SET
QUOTED_IDENTIFIER ON GO
SET
ANSI_NULLS ON GO CREATE
FUNCTION [Accounts].[FifoDetermineTransferType] (
  @accountId INT,
  @from VARCHAR(500),
  @to VARCHAR(500),
  @currentTransferType VARCHAR(50)
) RETURNS VARCHAR(50) AS BEGIN
-- HELLO
IF @currentTransferType NOT LIKE 'TRANSFER' RETURN @currentTransferType;

DECLARE @accountAddress [Accounts].[AccountAddressType];

SELECT
  TOP 1 @accountAddress = [AccountAddress]
FROM
  [Accounts].[MonitoredAccount] (NOLOCK)
WHERE
  [AccountId] = @AccountId;

IF @accountAddress LIKE @from RETURN 'TRANSFER_FROM';

IF @accountAddress LIKE @to RETURN 'TRANSFER_TO';

RETURN @currentTransferType;

END GO