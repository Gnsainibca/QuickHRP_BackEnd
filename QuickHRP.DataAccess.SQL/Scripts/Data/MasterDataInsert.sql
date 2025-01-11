--To insert record in Hospital Table 
INSERT INTO [dbo].[HospitalRegistration]
            ([Name],[Description],[Code],[Phone],[AlternateContactNumber],[Email],[Address],[Logo],[SmallLogo]
           ,[CreatedBy],[CreatedOn],[ModifiedBy],[ModifiedOn],[Inactive],[IsDeleted])
     SELECT
           'QuickHRP','QuickHRP','QuickHRP1001','9990935485','9711182961','vijaysharma1003@outlook.com','Ghaziabad',null,null,1,GetDate(),null,null,0,0
           WHERE NOT EXISTS (SELECT 1 FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001')


--To insert record in Master Type Table for MaritalStatus

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'MaritalStatus', 10
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10);

-- --To insert record in Master Type Table for 'Gender
INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Gender ', 20
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 20);

--To insert record in Master Type Table for BloodGroup

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'BloodGroup', 30
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30); 

--To insert record in Master Type Table for 'PaymentMode'

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'PaymentMode', 40
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40);

--To insert record in Master Type Table for UnitType

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'UnitType', 50
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50);

--To insert record in Master Type Table for Floor

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Floor', 60
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 60);

--To insert record in Master Type Table for BedType

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'BedType', 70
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 70);

--To insert record in Master Type Table for Source

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Source', 80
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 80);

--To insert record in Master Type Table for Complain Type

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'ComplainType', 90
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 90);

--To insert record in Master Type Table for Complain Type

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Purpose', 100
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 100);

--To insert data into mster marital status table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10), null, 'Single', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10)
      AND [Name] = 'Single'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10), null, 'Married', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10)
      AND [Name] = 'Married'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10), null, 'Divorced', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10)
      AND [Name] = 'Divorced'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10), null, 'Widowed', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10)
      AND [Name] = 'Widowed'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10), null, 'Not Specified', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10)
      AND [Name] = 'Not Specified'
);


--To insert data into master gender  table
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 20), null, 'Male', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 20)
      AND [Name] = 'Male'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 20), null, 'Female', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 20)
      AND [Name] = 'Female'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 20), null, 'Other', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 20)
      AND [Name] = 'Other'
);



--To insert data into master blood group table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30), null, 'A+', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30)
      AND [Name] = 'A+'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30), null, 'A-', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30)
      AND [Name] = 'A-'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30), null, 'B+', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30)
      AND [Name] = 'B+'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30), null, 'B-', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30)
      AND [Name] = 'B-'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30), null, 'AB+', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30)
      AND [Name] = 'AB+'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30), null, 'AB-', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 6   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30)
      AND [Name] = 'AB-'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30), null, 'O+', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 7   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30)
      AND [Name] = 'O+'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30), null, 'O-', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 8   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30)
      AND [Name] = 'O-'
);


--To insert data into master payment mode table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'Credit Card', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Name] = 'Credit Card'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'Debit Card', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Name] = 'Debit Card'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'Cash', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Name] = 'Cash'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'Bank Transfer', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Name] = 'Bank Transfer'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'PayPal', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Name] = 'PayPal'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'UPI', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 6   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Name] = 'UPI'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'Mobile Payment', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 7   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Name] = 'Mobile Payment'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'Online', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 8   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Name] = 'Online'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'Other', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 9   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Name] = 'Other'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'Cheque', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 10   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Name] = 'Cheque'
);



--To insert data into mster unit type table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50), null, '10-21 mm Hg', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50)
      AND [Name] = '10-21 mm Hg'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50), null, 'Bone density scan', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50)
      AND [Name] = 'Bone density scan'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50), null, 'PET/CT scan', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50)
      AND [Name] = 'PET/CT scan'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50), null, 'Digital mammography', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50)
      AND [Name] = 'Digital mammography'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50), null, 'per hour', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50)
      AND [Name] = 'per hour'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50), null, 'per km', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 6   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50)
      AND [Name] = 'per km'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50), null, 'MG', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 7   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50)
      AND [Name] = 'MG'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50), null, 'g/dl', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 8   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50)
      AND [Name] = 'g/dl'
);

--To insert data into master floor table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 60), null, 'Ground  Floor', 'A good choice here would be luxury vinyl tile (LVT), vinyl composition tile (VCT), sheet vinyl, rubber, or linoleum.', (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 60)
      AND [Name] = 'Ground  Floor'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 60), null, '1st Floor', 'Neonatal intensive care units (NICUs) which provide care for newborn infants.', (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 60)
      AND [Name] = '1st Floor'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 60), null, '2nd Floor', 'The pediatric intensive care unit (PICU) where children receive critical care. Depending on the facility, newborns may be treated in a PICU or a neonatal ICU. Smaller facilities may have a PICU only, while larger facilities may offer both a PICU and a neonatal ICU.', (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 60)
      AND [Name] = '2nd Floor'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 60), null, '3nd Floor', 'A palliative or hospice unit is where end-of-life care is provided if you have a life-limiting illness, which may or may not be cancer-related. Hospice and palliative care focus on providing comfort and quality of life. In some facilities, oncology and hospice/palliative care may be provided in the same unit.', (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4 
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 60)
      AND [Name] = '3nd Floor'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 60), null, '4th Floor', 'The coronary/cardiac care unit (CCU) is a specialized intensive care unit for cardiac issues. If you have heart disease, experienced a cardiac event such as a heart attack, or if you re recovering from open-heart surgery, you may be treated in the CCU. In some facilities, a separate open-heart recovery unit may be utilized for surgical patients.', (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 60)
      AND [Name] = '4th Floor'
);

--To insert data into master bed type table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 70), null, 'Normal', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 70)
      AND [Name] = 'Normal'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 70), null, 'VIP', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 70)
      AND [Name] = 'VIP'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 70), null, 'Standard', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3 
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 70)
      AND [Name] = 'Standard'
);

--To insert data into master source table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 80), null, 'Advertisement', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 80)
      AND [Name] = 'Advertisement'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 80), null, 'Online Front Site', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 80)
      AND [Name] = 'Online Front Site'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 80), null, 'Front Office', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 80)
      AND [Name] = 'Front Office'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 80), null, 'From visitors', 'Visitor centers used to provide fairly basic information about the place, corporation or event they are celebrating, acting more as the entry way to a place. The role of the visitor center has been rapidly evolving over the past 10 years to become more of an experience and to tell the story of the place or brand it represents. Many have become destinations and experiences in their own right.', (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4 
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 80)
      AND [Name] = 'From visitors'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 80), null, 'Online Advertising', 'Online advertising, also known as online marketing, Internet advertising, digital advertising or web advertising, is a form of marketing and advertising which uses the Internet to deliver promotional marketing messages to consumers.', (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 80)
      AND [Name] = 'Online Advertising'
);

--To insert data into master complain type table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 90), null, 'Poor communication', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 90)
      AND [Name] = 'Poor communication'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 90), null, 'Billing Discrepancies', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 90)
      AND [Name] = 'Billing Discrepancies'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 90), null, 'Long Wait Times', 'Long Wait Times', (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 90)
      AND [Name] = 'Long Wait Times'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 90), null, 'Hospital services', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 90)
      AND [Name] = 'Hospital services'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 90), null, 'Food quality', 'A reference to a set of rules that were followed when the resource was constructed, and which must be understood when processing the content. Often, this is a reference to an implementation guide that defines the special rules along with other profiles etc.', (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 90)
      AND [Name] = 'Food quality'
);

--To insert data into master purpose table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 100), null, 'Seminar', 'A seminar may be defined as a gathering of people for the purpose of discussing a stated topic. Such gatherings are usually interactive sessions where the participants engage in discussions about the delineated topic.', (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 100)
      AND [Name] = 'Seminar'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 100), null, 'Inquiry', 'Inquiry is an approach to learning that involves a process of exploring the natural or material world, and that leads to asking questions, making discoveries, and testing those discoveries in the search for new understanding.', (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 100)
      AND [Name] = 'Inquiry'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 100), null, 'Visit', 'Visitor centers used to provide fairly basic information about the place, corporation or event they are celebrating, acting more as the entry way to a place. The role of the visitor center has been rapidly evolving over the past 10 years to become more of an experience and to tell the story of the place or brand it represents. Many have become destinations and experiences in their own right.', (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 100)
      AND [Name] = 'Visit'
);
