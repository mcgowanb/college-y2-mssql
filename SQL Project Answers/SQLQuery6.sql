
ALTER proc [SQL6]
@NewPassword varchar(20),
@ClientID int
as

begin try
	update dbo.ClientTbl
	set ClientPassword = @NewPassword
	where ClientID = @ClientID
end try

begin catch
;throw
end catch

