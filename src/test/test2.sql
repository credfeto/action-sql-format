SET
QUOTED_IDENTIFIER ON GO
SET
ANSI_NULLS ON GO CREATE
FUNCTION [Accounts].[FifoDetermineTransferType] (
  @accountId INT,
  @from VARCHAR(500),
  @to VARCHAR(500),
  @currentTransferType VARCHAR(50)
) RETURNS VARCHAR(50) BEGIN IF @currentTransferType NOT LIKE 'TRANSFER' BEGIN RETURN @currentTransferType END DECLARE @accountAddress [Accounts].[AccountAddressType];
SELECT
  TOP 1 @accountAddress=AccountAddress
FROM
  Accounts.MonitoredAccount
WHERE
  AccountId=@AccountId;
IF @accountAddress LIKE @from BEGIN RETURN 'TRANSFER_FROM';
END;
IF @accountAddress LIKE @to BEGIN RETURN 'TRANSFER_TO';
END;
RETURN @currentTransferType;
END GO