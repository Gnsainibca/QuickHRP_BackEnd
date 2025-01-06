-- Start :::::: MaterType -



-- END :::::: MaterType -


-- Start :::::: MasterData - TypeId = 1 - PaymentMode -

IF NOT EXISTS(SELECT [Name] FROM [dbo].[MasterData] WHERE [TypeId] = 1 AND [Name] = 'CASH')
BEGIN
     INSERT INTO [dbo].[MasterData]([TypeId], [ParentId], [Name], [Description], [HospitalId] ,[CreatedBy], [CreatedOn], Inactive, IsDeleted)
     VALUES (1, null, 'CASH', null, 1, 1, GETDATE(),0,0)
END

IF NOT EXISTS(SELECT [Name] FROM [dbo].[MasterData] WHERE [TypeId] = 1 AND [Name] = 'UPI')
BEGIN
     INSERT INTO [dbo].[MasterData]([TypeId], [ParentId], [Name], [Description], [HospitalId] ,[CreatedBy], [CreatedOn], Inactive, IsDeleted)
     VALUES (1, null, 'UPI', null, 1, 1, GETDATE(),0,0)
END

-- END :::::: MasterData - TypeId = 1 - PaymentMode -