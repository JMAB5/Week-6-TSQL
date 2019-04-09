/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
IF '$(LoadTestData)' = 'True'


BEGIN
	
-- ENSURE THERE IS NO DATA IN THE TABLES BEFORE DEPLOYING SAMPLE DATA -- 
DELETE FROM Account;
DELETE FROM Log;

-- INSERT SAMPLE DATA --
INSERT INTO Account (AcctNo,Fname,Lname,CreditLimit,Balance) Values
(1,'Josh','Bereson',10,100),
(2,'Roland','Baker',15,1500),
(3,'Edward','McKenzie-McHarg',20,60);

INSERT INTO Log (OrigAcct,LogDateTime,RecAcct,Ammount) Values
(2,'2019-04-08 16:20:00',3,1000),
(1,'2003-02-10 09:15:34',2,5),
(3,'2017-06-23 13:53:22',1,27);
End;
