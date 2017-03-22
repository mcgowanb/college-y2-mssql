
ALTER proc [SQL11]
as
select ClientID, ClientName
from dbo.ClientTbl as ct
where NoOfKeyHolders >
(
select(avg(NoOfKeyHolders))
from dbo.ClientTbl
where ClientTypeID = ct.ClientTypeID
)

