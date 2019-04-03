CREATE TABLE [dbo].[Account]
(
	[AcctNo] INT NOT NULL,
	[Fname] NVARCHAR(100) NOT NULL,
	[Lname] NVARCHAR(100) NOT NULL,
	[CreditLimit] MONEY,
	[Balance] MONEY, 
	CONSTRAINT [PK_Account] PRIMARY KEY ([AcctNo]),
    CONSTRAINT [UQ_Account_Fname_Lname] UNIQUE ([Fname], [Lname]),
	CONSTRAINT [CK_Account_CreditLimit] CHECK ([CreditLimit] < 0),
	CONSTRAINT [CK_Account_Balance] CHECK ([Balance] > [CreditLimit])
)