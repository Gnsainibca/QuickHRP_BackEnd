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

--To insert data into mster marital status table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10), null, 'Single', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10)
      AND [Name] = 'Single'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10), null, 'Married', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10)
      AND [Name] = 'Married'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10), null, 'Divorced', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10)
      AND [Name] = 'Divorced'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10), null, 'Widowed', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10)
      AND [Name] = 'Widowed'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10), null, 'Not Specified', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10)
      AND [Name] = 'Not Specified'
);


--To insert data into master gender  table
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 20), null, 'Male', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 20)
      AND [Name] = 'Male'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 20), null, 'Female', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 20)
      AND [Name] = 'Female'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 20), null, 'Other', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 20)
      AND [Name] = 'Other'
);



--To insert data into master blood group table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30), null, 'A+', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30)
      AND [Name] = 'A+'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30), null, 'A-', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30)
      AND [Name] = 'A-'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30), null, 'B+', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30)
      AND [Name] = 'B+'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30), null, 'B-', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30)
      AND [Name] = 'B-'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30), null, 'AB+', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30)
      AND [Name] = 'AB+'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30), null, 'AB-', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30)
      AND [Name] = 'AB-'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30), null, 'O+', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30)
      AND [Name] = 'O+'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30), null, 'O-', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30)
      AND [Name] = 'O-'
);


--To insert data into master payment mode table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'Credit Card', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Name] = 'Credit Card'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'Debit Card', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Name] = 'Debit Card'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'Cash', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Name] = 'Cash'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'Bank Transfer', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Name] = 'Bank Transfer'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'PayPal', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Name] = 'PayPal'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'UPI', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Name] = 'UPI'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'Mobile Payment', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Name] = 'Mobile Payment'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'Online', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Name] = 'Online'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'Other', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Name] = 'Other'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'Cheque', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Name] = 'Cheque'
);



--To insert data into mster unit type table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50), null, '10-21 mm Hg', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50)
      AND [Name] = '10-21 mm Hg'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50), null, 'Bone density scan', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50)
      AND [Name] = 'Bone density scan'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50), null, 'PET/CT scan', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50)
      AND [Name] = 'PET/CT scan'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50), null, 'Digital mammography', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50)
      AND [Name] = 'Digital mammography'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50), null, 'per hour', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50)
      AND [Name] = 'per hour'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50), null, 'per km', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50)
      AND [Name] = 'per km'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50), null, 'MG', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50)
      AND [Name] = 'MG'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50), null, 'g/dl', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50)
      AND [Name] = 'g/dl'
);

