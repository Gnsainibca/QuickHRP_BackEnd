
--To insert record in Master Type Table for Master_MaritalStatus

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Master_MaritalStatus', 1
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 1);

--To insert data into mster marital status table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 1, 1, 'Single', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 1
      AND [ParentId] = 1
      AND [Name] = 'Single'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 1, 1, 'Married', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 1
      AND [ParentId] = 1
      AND [Name] = 'Married'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 1, 1, 'Divorced', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 1
      AND [ParentId] = 1
      AND [Name] = 'Divorced'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 1, 1, 'Widowed', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 1
      AND [ParentId] = 1
      AND [Name] = 'Widowed'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 1, 1, 'Not Specified', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 1
      AND [ParentId] = 1
      AND [Name] = 'Not Specified'
);

-- --To insert record in Master Type Table for 'Master_Gender
INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Master_Gender ', 2
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 2);

--To insert data into master gender  table
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 2, 2, 'Male', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 2
      AND [ParentId] = 2
      AND [Name] = 'Male'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 2, 2, 'Female', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 2
      AND [ParentId] = 2
      AND [Name] = 'Female'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 2, 2, 'Other', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 2
      AND [ParentId] = 2
      AND [Name] = 'Other'
);

--To insert record in Master Type Table for Master_ BloodGroup

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Master_BloodGroup', 3
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 3); 

--To insert data into master blood group table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 3, 3, 'A+', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 3
      AND [ParentId] = 3
      AND [Name] = 'A+'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 3, 3, 'A-', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 3
      AND [ParentId] = 3
      AND [Name] = 'A-'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 3, 3, 'B+', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 3
      AND [ParentId] = 3
      AND [Name] = 'B+'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 3, 3, 'B-', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 3
      AND [ParentId] = 3
      AND [Name] = 'B-'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 3, 3, 'AB+', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 3
      AND [ParentId] = 3
      AND [Name] = 'AB+'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 3, 3, 'AB-', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 3
      AND [ParentId] = 3
      AND [Name] = 'AB-'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 3, 3, 'O+', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 3
      AND [ParentId] = 3
      AND [Name] = 'O+'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 3, 3, 'O-', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 3
      AND [ParentId] = 3
      AND [Name] = 'O-'
);

--To insert record in Master Type Table for 'Master_PaymentMode'

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Master_PaymentMode', 4
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 4);
--To insert data into master payment mode table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 4, 4, 'Credit Card', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 4
      AND [ParentId] = 4
      AND [Name] = 'Credit Card'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 4, 4, 'Debit Card', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 4
      AND [ParentId] = 4
      AND [Name] = 'Debit Card'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 4, 4, 'Cash', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 4
      AND [ParentId] = 4
      AND [Name] = 'Cash'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 4, 4, 'Bank Transfer', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 4
      AND [ParentId] = 4
      AND [Name] = 'Bank Transfer'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 4, 4, 'PayPal', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 4
      AND [ParentId] = 4
      AND [Name] = 'PayPal'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 4, 4, 'UPI', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 4
      AND [ParentId] = 4
      AND [Name] = 'UPI'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 4, 4, 'Mobile Payment', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 4
      AND [ParentId] = 4
      AND [Name] = 'Mobile Payment'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 4, 4, 'Online', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 4
      AND [ParentId] = 4
      AND [Name] = 'Online'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 4, 4, 'Other', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 4
      AND [ParentId] = 4
      AND [Name] = 'Other'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 4, 4, 'Cheque', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 4
      AND [ParentId] = 4
      AND [Name] = 'Cheque'
);


--To insert record in Master Type Table for Master_UnitType

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Master_UnitType', 5
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 5);
--To insert data into mster unit type table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 5, 5, '10-21 mm Hg', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 5
      AND [ParentId] = 5
      AND [Name] = '10-21 mm Hg'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 5, 5, 'Bone density scan', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 5
      AND [ParentId] = 5
      AND [Name] = 'Bone density scan'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 5, 5, 'PET/CT scan', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 5
      AND [ParentId] = 5
      AND [Name] = 'PET/CT scan'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 5, 5, 'Digital mammography', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 5
      AND [ParentId] = 5
      AND [Name] = 'Digital mammography'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 5, 5, 'per hour', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 5
      AND [ParentId] = 5
      AND [Name] = 'per hour'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 5, 5, 'per km', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 5
      AND [ParentId] = 5
      AND [Name] = 'per km'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 5, 5, 'MG', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 5
      AND [ParentId] = 5
      AND [Name] = 'MG'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId], [Name], [Description], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted])
SELECT 5, 5, 'g/dl', null, 1,1, GETDATE(), NULL, NULL, 0, 0   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = 5
      AND [ParentId] = 5
      AND [Name] = 'g/dl'
);

