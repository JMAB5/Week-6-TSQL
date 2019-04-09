CREATE TABLE [dbo].[Account]
(
	[AcctNo] INT NOT NULL PRIMARY KEY, 
    [Fname] NVARCHAR(50) NOT NULL, 
    [Lname] NVARCHAR(50) NOT NULL, 
    [CreditLimit] MONEY NULL, 
    [Balance] MONEY NULL
	Constraint UC_NAME Unique (Fname,Lname),
	Check (CreditLimit>0),
	Check (Balance>=CreditLimit)
)
