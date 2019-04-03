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
IF '$(LoadTestData)' = 'true'


BEGIN
	
-- ENSURE THERE IS NO DATA IN THE TABLES BEFORE DEPLOYING SAMPLE DATA -- 
DELETE FROM tblLog;
DELETE FROM tblAccount;

-- INSERT SAMPLE DATA --
INSERT INTO Account (AcctNo,Fname,Lname,CreditLimit,Balance) VALUES
(2342275,'Josh', 'Bereson',-30,40),
(923353819,'Edward','McKenzie-Mcharg',-16,24),
(987654321,'Roland','Baker', -1000,955),
(294444582,'Richard','Sims',-7,77);

INSERT INTO Log (OrigAcct,LogDateTime,RecAcct,Amount) VALUES
(2342275,DATEADD(minute,-1,GETUTCDATE()),94444582,3),
(923353819,DATEADD(minute,-2,GETUTCDATE()),987654321,31),
(987654321,DATEADD(minute,-3,GETUTCDATE()),923353819,121),
(294444582,DATEADD(minute,-4,GETUTCDATE()),2342275,5.31);

END;