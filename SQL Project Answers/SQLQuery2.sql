

ALTER proc [SQL2]
@ClientType smallint
as
select ClientName
from ClientTbl
where ClientTypeID = @ClientType