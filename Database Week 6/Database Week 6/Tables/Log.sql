CREATE TABLE [dbo].[Log]
(
	[OrigAcct] INT NOT NULL , 
    [LogDateTime] DATETIME NOT NULL, 
    [RecAcct] INT NULL, 
    [Ammount] MONEY NOT NULL, 
    PRIMARY KEY ([OrigAcct],[LogDateTime]),
	Foreign Key (OrigAcct) References Account(AcctNo),
	Foreign Key (RecAcct) references Account(AcctNo)
)