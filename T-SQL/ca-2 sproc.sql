USE [S00165159TSQLProject]
GO

ALTER PROC [campus\S00165159].[Assign1]
--external variables
@ActionID int, @MemberID int, @BetAmount smallmoney, @WalletID int
AS
--internal variables
DECLARE @Odds numeric(18,2), @NoOfBets int, @Balance smallmoney
--get odds

SELECT @Odds = Odds
FROM action_tbl
WHERE ActionID = @ActionID
--no of bets
SELECT @NoOfBets = COUNT(*) 
FROM bets_tbl
WHERE MemberID = @MemberID 
AND MONTH(BetDate) = MONTH(GETDATE()) 
AND YEAR(BetDate) = YEAR(GETDATE())
-- wallet balance
SELECT @Balance = Balance 
FROM wallet_tbl
WHERE WalletID = @WalletID
-- too many bets
IF @NoOfBets >= 5
BEGIN
;THROW 50001, 'Sorry bet is refused 5 bets have been made this month', 1
END
-- Check balance against bet amount
IF @Balance < @BetAmount
BEGIN
;THROW 50002, 'Sorry bet is refused Wallet Balance is breached',1
END
--insert records
BEGIN TRY
INSERT INTO bets_tbl (ActionID, MemberID, BetAmount, BetDate, Odds)
VALUES(@ActionID, @MemberID, @BetAmount, GETDATE(), @Odds)
END TRY
BEGIN CATCH
;THROW
END CATCH
--update wallet table
BEGIN TRY
UPDATE wallet_tbl 
SET Balance -= @BetAmount 
WHERE WalletID = @WalletID 
END TRY
BEGIN CATCH
;THROW
END CATCH
--complete

RETURN 0