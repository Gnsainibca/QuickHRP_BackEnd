﻿--To insert record in Hospital Table 
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
SELECT 'Gender', 20
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

--To insert record in Master Type Table for Operation Category

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Operation Category', 110
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 110);

--To insert record in Master Type Table for Medicine Group

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Medicine Group', 120
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 120);

--To insert record in Master Type Table for Medicine Company

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Medicine Company', 130
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 130);

--To insert record in Master Type Table for Medicine Unit

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Medicine Unit', 140
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 140);

--To insert record in Master Type Table for Doasage Duration

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Medicine Doasage Duration', 150
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 150);

--To insert record in Master Type Table for Doasage Interval

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Medicine Doasage Interval', 160
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 160);

--To insert record in Master Type Table for Medicine Category

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Medicine Category', 170
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170);

--To insert record in Master Type Table for Pathology Unit

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Pathology Unit', 180
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 180);

--To insert record in Master Type Table for Pathology Category

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Pathology Category', 190
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 190);

--To insert record in Master Type Table for Radiology Unit

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Radiology Unit', 200
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 200);

--To insert record in Master Type Table for Radiology Category

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Radiology Category', 210
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 210);

--To insert record in Master Type Table for Symptoms Type

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Symptoms Type', 220
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 220);

--To insert record in Master Type Table for Findings Category

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Findings Category', 230
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 230);

--To insert record in Master Type Table for HR Contract Type

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'HR Contract Type', 240
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 240);

--To insert record in Master Type Table for HR Specialist

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'HR Specialist', 250
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 250);

--To insert record in Master Type Table for HR Designation

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'HR Designation', 260
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 260);

--To insert record in Master Type Table for HR Department

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'HR Department', 270
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270);

--To insert record in Master Type Table for HR Leave Type

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'HR Leave Type', 280
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 280);

--To insert record in Master Type Table for Appointment Status

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Appointment Status', 290
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 290);

--To insert record in Master Type Table for Appointment Source

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Appointment Source', 300
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 300);

--To insert record in Master Type Table for HR Appointment Priority

INSERT INTO [QuickHRP].[dbo].[MasterType] ([Name], [BusinessKey])
SELECT 'Appointment Priority', 310
WHERE NOT EXISTS (SELECT 1 FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 310);

--To insert data into mster marital status table 

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10), null, 'Single', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10)
      AND [Field1] = 'Single'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10), null, 'Married', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10)
      AND [Field1] = 'Married'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10), null, 'Divorced', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10)
      AND [Field1] = 'Divorced'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10), null, 'Widowed', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10)
      AND [Field1] = 'Widowed'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10), null, 'Not Specified', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 10)
      AND [Field1] = 'Not Specified'
);


--To insert data into master gender  table
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 20), null, 'Male', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 20)
      AND [Field1] = 'Male'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 20), null, 'Female', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 20)
      AND [Field1] = 'Female'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 20), null, 'Other', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 20)
      AND [Field1] = 'Other'
);



--To insert data into master blood group table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30), null, 'A+', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30)
      AND [Field1] = 'A+'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30), null, 'A-', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30)
      AND [Field1] = 'A-'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30), null, 'B+', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30)
      AND [Field1] = 'B+'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30), null, 'B-', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30)
      AND [Field1] = 'B-'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30), null, 'AB+', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30)
      AND [Field1] = 'AB+'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30), null, 'AB-', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 6   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30)
      AND [Field1] = 'AB-'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30), null, 'O+', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 7   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30)
      AND [Field1] = 'O+'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30), null, 'O-', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 8   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 30)
      AND [Field1] = 'O-'
);


--To insert data into master payment mode table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'Credit Card', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Field1] = 'Credit Card'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'Debit Card', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Field1] = 'Debit Card'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'Cash', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Field1] = 'Cash'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'Bank Transfer', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Field1] = 'Bank Transfer'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'PayPal', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Field1] = 'PayPal'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'UPI', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 6   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Field1] = 'UPI'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'Mobile Payment', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 7   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Field1] = 'Mobile Payment'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'Online', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 8   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Field1] = 'Online'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'Other', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 9   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Field1] = 'Other'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40), null, 'Cheque', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 10   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 40)
      AND [Field1] = 'Cheque'
);



--To insert data into mster unit type table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50), null, '10-21 mm Hg', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50)
      AND [Field1] = '10-21 mm Hg'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50), null, 'Bone density scan', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50)
      AND [Field1] = 'Bone density scan'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50), null, 'PET/CT scan', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50)
      AND [Field1] = 'PET/CT scan'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50), null, 'Digital mammography', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50)
      AND [Field1] = 'Digital mammography'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50), null, 'per hour', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50)
      AND [Field1] = 'per hour'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50), null, 'per km', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 6   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50)
      AND [Field1] = 'per km'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50), null, 'MG', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 7   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50)
      AND [Field1] = 'MG'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50), null, 'g/dl', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 8   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 50)
      AND [Field1] = 'g/dl'
);

--To insert data into master floor table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 60), null, 'Ground  Floor', 'A good choice here would be luxury vinyl tile (LVT), vinyl composition tile (VCT), sheet vinyl, rubber, or linoleum.', (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 60)
      AND [Field1] = 'Ground  Floor'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 60), null, '1st Floor', 'Neonatal intensive care units (NICUs) which provide care for newborn infants.', (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 60)
      AND [Field1] = '1st Floor'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 60), null, '2nd Floor', 'The pediatric intensive care unit (PICU) where children receive critical care. Depending on the facility, newborns may be treated in a PICU or a neonatal ICU. Smaller facilities may have a PICU only, while larger facilities may offer both a PICU and a neonatal ICU.', (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 60)
      AND [Field1] = '2nd Floor'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 60), null, '3nd Floor', 'A palliative or hospice unit is where end-of-life care is provided if you have a life-limiting illness, which may or may not be cancer-related. Hospice and palliative care focus on providing comfort and quality of life. In some facilities, oncology and hospice/palliative care may be provided in the same unit.', (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4 
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 60)
      AND [Field1] = '3nd Floor'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 60), null, '4th Floor', 'The coronary/cardiac care unit (CCU) is a specialized intensive care unit for cardiac issues. If you have heart disease, experienced a cardiac event such as a heart attack, or if you re recovering from open-heart surgery, you may be treated in the CCU. In some facilities, a separate open-heart recovery unit may be utilized for surgical patients.', (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 60)
      AND [Field1] = '4th Floor'
);

--To insert data into master bed type table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 70), null, 'Normal', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 70)
      AND [Field1] = 'Normal'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 70), null, 'VIP', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 70)
      AND [Field1] = 'VIP'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 70), null, 'Standard', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3 
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 70)
      AND [Field1] = 'Standard'
);

--To insert data into master source table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 80), null, 'Advertisement', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 80)
      AND [Field1] = 'Advertisement'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 80), null, 'Online Front Site', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 80)
      AND [Field1] = 'Online Front Site'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 80), null, 'Front Office', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 80)
      AND [Field1] = 'Front Office'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 80), null, 'From visitors', 'Visitor centers used to provide fairly basic information about the place, corporation or event they are celebrating, acting more as the entry way to a place. The role of the visitor center has been rapidly evolving over the past 10 years to become more of an experience and to tell the story of the place or brand it represents. Many have become destinations and experiences in their own right.', (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4 
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 80)
      AND [Field1] = 'From visitors'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 80), null, 'Online Advertising', 'Online advertising, also known as online marketing, Internet advertising, digital advertising or web advertising, is a form of marketing and advertising which uses the Internet to deliver promotional marketing messages to consumers.', (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 80)
      AND [Field1] = 'Online Advertising'
);

--To insert data into master complain type table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 90), null, 'Poor communication', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 90)
      AND [Field1] = 'Poor communication'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 90), null, 'Billing Discrepancies', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 90)
      AND [Field1] = 'Billing Discrepancies'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 90), null, 'Long Wait Times', 'Long Wait Times', (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 90)
      AND [Field1] = 'Long Wait Times'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 90), null, 'Hospital services', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 90)
      AND [Field1] = 'Hospital services'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 90), null, 'Food quality', 'A reference to a set of rules that were followed when the resource was constructed, and which must be understood when processing the content. Often, this is a reference to an implementation guide that defines the special rules along with other profiles etc.', (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 90)
      AND [Field1] = 'Food quality'
);

--To insert data into master purpose table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 100), null, 'Seminar', 'A seminar may be defined as a gathering of people for the purpose of discussing a stated topic. Such gatherings are usually interactive sessions where the participants engage in discussions about the delineated topic.', (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 100)
      AND [Field1] = 'Seminar'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 100), null, 'Inquiry', 'Inquiry is an approach to learning that involves a process of exploring the natural or material world, and that leads to asking questions, making discoveries, and testing those discoveries in the search for new understanding.', (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 100)
      AND [Field1] = 'Inquiry'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 100), null, 'Visit', 'Visitor centers used to provide fairly basic information about the place, corporation or event they are celebrating, acting more as the entry way to a place. The role of the visitor center has been rapidly evolving over the past 10 years to become more of an experience and to tell the story of the place or brand it represents. Many have become destinations and experiences in their own right.', (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 100)
      AND [Field1] = 'Visit'
);

--To insert data into master operation category table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 110), null, 'Urology', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 110)
      AND [Field1] = 'Urology'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 110), null, 'Thoracic Surgery', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 110)
      AND [Field1] = 'Thoracic Surgery'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 110), null, 'Plastic Surgery', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 110)
      AND [Field1] = 'Plastic Surgery'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 110), null, 'Orthopedic Surgery', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 110)
      AND [Field1] = 'Orthopedic Surgery'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 110), null, 'Ophthalmology', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 110)
      AND [Field1] = 'Ophthalmology'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 110), null, 'Gynaecology', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 6   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 110)
      AND [Field1] = 'Gynaecology'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 110), null, 'ENT and Oral Surgery', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 7   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 110)
      AND [Field1] = 'ENT and Oral Surgery'
);

--To insert data into master medicine group table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 120), null, 'HIPERIN', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 120)
      AND [Field1] = 'HIPERIN'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 120), null, 'Antigout agents', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 120)
      AND [Field1] = 'Antigout agents'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 120), null, 'Antiparasitics', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 120)
      AND [Field1] = 'Antiparasitics'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 120), null, 'Antimycobacterials', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 120)
      AND [Field1] = 'Antimycobacterials'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 120), null, 'Antibacterials', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 120)
      AND [Field1] = 'Antibacterials'
);


--To insert data into master medicine company table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 130), null, 'Medimax', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 130)
      AND [Field1] = 'Medimax'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 130), null, 'Lupin Limited', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 130)
      AND [Field1] = 'Lupin Limited'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 130), null, 'Biocon Limited', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 130)
      AND [Field1] = 'Biocon Limited'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 130), null, 'Alkem Laboratories', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 130)
      AND [Field1] = 'Alkem Laboratories'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 130), null, 'Johnson & Johnson', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 130)
      AND [Field1] = 'Johnson & Johnson'
);

--To insert data into master medicine unit table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 140), null, 'g/dl', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 140)
      AND [Field1] = 'g/dl'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 140), null, 'mg', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 140)
      AND [Field1] = 'mg'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 140), null, 'ml', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 140)
      AND [Field1] = 'ml'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 140), null, 'mm', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 140)
      AND [Field1] = 'mm'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 140), null, 'mg/mL', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 140)
      AND [Field1] = 'mg/mL'
);

--To insert data into master medicine doasage duration table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 150), null, '1 Week', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 150)
      AND [Field1] = '1 Week'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 150), null, '2 Week', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 150)
      AND [Field1] = '2 Week'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 150), null, '1 Month', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 150)
      AND [Field1] = '1 Month'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 150), null, 'Afternoon', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 150)
      AND [Field1] = 'Afternoon'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 150), null, 'Morning', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 150)
      AND [Field1] = 'Morning'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 150), null, 'Evening', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 6   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 150)
      AND [Field1] = 'Evening'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 150), null, 'Night', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 7   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 150)
      AND [Field1] = 'Night'
);

--To insert data into master medicine doasage interval table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 160), null, 'Only one a day', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 160)
      AND [Field1] = 'Only one a day'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 160), null, '2 times in a day', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 160)
      AND [Field1] = '2 times in a day'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 160), null, '3 times in a day', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 160)
      AND [Field1] = '3 times in a day'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 160), null, '4 times in a day', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 160)
      AND [Field1] = '4 times in a day'
);

--To insert data into master medicine category table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170), null, 'Tablet', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170)
      AND [Field1] = 'Tablet'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170), null, 'Diaper', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170)
      AND [Field1] = 'Diaper'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170), null, 'Preparations', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170)
      AND [Field1] = 'Preparations'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170), null, 'Liquid', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170)
      AND [Field1] = 'Liquid'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170), null, 'Implants / Patches', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170)
      AND [Field1] = 'Implants / Patches'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170), null, 'Inhalers', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 6   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170)
      AND [Field1] = 'Inhalers'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170), null, 'Drops', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 7  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170)
      AND [Field1] = 'Drops'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170), null, 'Surgical', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 8   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170)
      AND [Field1] = 'Surgical'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170), null, 'Cream', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 9  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170)
      AND [Field1] = 'Cream'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170), null, 'Ointment', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 10 
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170)
      AND [Field1] = 'Ointment'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170), null, 'Injection', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 11 
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170)
      AND [Field1] = 'Injection'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170), null, 'Capsule', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 12   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170)
      AND [Field1] = 'Capsule'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170), null, 'Syrup', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 13   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 170)
      AND [Field1] = 'Syrup'
);

--To insert data into master pathology unit table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 180), null, '(U/L)', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 180)
      AND [Field1] = '(U/L)'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 180), null, 'Cells / cubic mm', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 180)
      AND [Field1] = 'Cells / cubic mm'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 180), null, 'million/mm3', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 180)
      AND [Field1] = 'million/mm3'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 180), null, 'Nanometer', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 180)
      AND [Field1] = 'Nanometer'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 180), null, 'Dalton (Da)', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 180)
      AND [Field1] = 'Dalton (Da)'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 180), null, 'mmol/L', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 6   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 180)
      AND [Field1] = 'mmol/L'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 180), null, 'Micrometer (oi)', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 7  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 180)
      AND [Field1] = 'Micrometer (oi)'
);


--To insert data into master pathology category table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 190), null, 'Electromagnetic Waves', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 190)
      AND [Field1] = 'Electromagnetic Waves'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 190), null, 'Reproductive Biology', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 190)
      AND [Field1] = 'Reproductive Biology'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 190), null, 'Molecular Diagnostics', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 190)
      AND [Field1] = 'Molecular Diagnostics'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 190), null, 'Hematology', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 190)
      AND [Field1] = 'Hematology'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 190), null, 'Clinical Chemistry', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 190)
      AND [Field1] = 'Clinical Chemistry'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 190), null, 'Clinical Microbiology', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 6  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 190)
      AND [Field1] = 'Clinical Microbiology'
);

--To insert data into master radiology unit table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 200), null, 'Teslas', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 200)
      AND [Field1] = 'Teslas'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 200), null, '(dGy×cm2)', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 200)
      AND [Field1] = '(dGy×cm2)'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 200), null, 'KHz', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 200)
      AND [Field1] = 'KHz'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 200), null, 'HVL', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 200)
      AND [Field1] = 'HVL'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 200), null, 'Mammography', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 200)
      AND [Field1] = 'Mammography'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 180), null, 'MRI', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 6   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 200)
      AND [Field1] = 'MRI'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 180), null, 'CT', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 7  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 200)
      AND [Field1] = 'CT'
);


--To insert data into master radiology category table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 210), null, 'MRI CARDIAC WITH CONTRAST', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 210)
      AND [Field1] = 'MRI CARDIAC WITH CONTRAST'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 210), null, 'M. R. C. P.', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 210)
      AND [Field1] = 'M. R. C. P.'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 210), null, 'CT 3D STUDY', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 210)
      AND [Field1] = 'CT 3D STUDY'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 210), null, 'CT CHEST PLAIN', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 210)
      AND [Field1] = 'CT CHEST PLAIN'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 210), null, 'CT ORBITS', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 210)
      AND [Field1] = 'CT ORBITS'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 210), null, 'DOPPLER PERIPHERAL BILATERAL (VENOUS)', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 6  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 210)
      AND [Field1] = 'DOPPLER PERIPHERAL BILATERAL (VENOUS)'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 210), null, 'ULTRASOUND WHOLE ABDOMEN', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 7 
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 210)
      AND [Field1] = 'ULTRASOUND WHOLE ABDOMEN'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 210), null, 'X-RAY LUMBOSACRAL SPINE AP AND LAT VIEWS', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 8 
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 210)
      AND [Field1] = 'X-RAY LUMBOSACRAL SPINE AP AND LAT VIEWS'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 210), null, 'X-RAY PNS (WATERS VIEW)', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 9  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 210)
      AND [Field1] = 'DOPPLER PERIPHERAL BILATERAL (VENOUS)'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 210), null, 'DOPPLER PERIPHERAL BILATERAL (VENOUS)', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 10 
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 210)
      AND [Field1] = 'X-RAY PNS (WATERS VIEW)'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 210), null, 'X-RAY CHEST PA VIEW', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 11
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 210)
      AND [Field1] = 'X-RAY CHEST PA VIEW'
);

--To insert data into master symptoms type table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 220), null, 'Lung problems', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 220)
      AND [Field1] = 'Lung problems'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 220), null, 'Stomach problems', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 220)
      AND [Field1] = 'Stomach problems'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 220), null, 'Bladder problems', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 220)
      AND [Field1] = 'Bladder problems'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 220), null, 'Skin problems', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 220)
      AND [Field1] = 'Skin problems'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 220), null, 'Muscle or joint problems', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5 
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 220)
      AND [Field1] = 'Muscle or joint problems'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 220), null, 'Emotional problems', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 6  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 220)
      AND [Field1] = 'Emotional problems'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 220), null, 'Eating or weight problems', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 7  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 220)
      AND [Field1] = 'Eating or weight problems'
);

--To insert data into master findings category table

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 230), null, 'Nose Diseases', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 230)
      AND [Field1] = 'Nose Diseases'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 230), null, 'Eye Diseases', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 230)
      AND [Field1] = 'Eye Diseases'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 230), null, 'Hair Problems', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 230)
      AND [Field1] = 'Hair Problems'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 230), null, 'Bone Density Problems', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 230)
      AND [Field1] = 'Bone Density Problems'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 230), null, 'Skin problems', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 230)
      AND [Field1] = 'Skin problems'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 230), null, 'Typhidot (or Widal Test)', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 6  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 230)
      AND [Field1] = 'Typhidot (or Widal Test)'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 230), null, 'Fever', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 7   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 230)
      AND [Field1] = 'Fever'
);

--To insert data into master HR contract type

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 240), null, 'Probation', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 240)
      AND [Field1] = 'Probation'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 240), null, 'Permanent', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 240)
      AND [Field1] = 'Permanent'
);

--To insert data into master HR specialist

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 250), null, 'Cardiologists', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 250)
      AND [Field1] = 'Cardiologists'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 250), null, 'Dermatologists', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 250)
      AND [Field1] = 'Dermatologists'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 250), null, 'Endocrinologists', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 250)
      AND [Field1] = 'Endocrinologists'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 250), null, 'Gastroenterologists', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 250)
      AND [Field1] = 'Gastroenterologists'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 250), null, 'Ophthalmologists', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 250)
      AND [Field1] = 'Ophthalmologists'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 250), null, 'Neuroradiology', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 6  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 250)
      AND [Field1] = 'Neuroradiology'
);

--To insert data into master HR designation

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 260), null, 'Doctor', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 260)
      AND [Field1] = 'Doctor'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 260), null, 'Admin', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 260)
      AND [Field1] = 'Admin'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 260), null, 'IT Admin', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 260)
      AND [Field1] = 'IT Admin'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 260), null, 'Pathologist', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 260)
      AND [Field1] = 'Pathologist'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 260), null, 'Pharmacist', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 260)
      AND [Field1] = 'Pharmacist'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 260), null, 'Radiologist', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 6   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 260)
      AND [Field1] = 'Radiologist'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 260), null, 'Nurse', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 7   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 260)
      AND [Field1] = 'Nurse'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 260), null, 'Accountant', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 8   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 260)
      AND [Field1] = 'Accountant'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 260), null, 'Receptionist', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 9   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 260)
      AND [Field1] = 'Receptionist'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 260), null, 'Driver', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 10   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 260)
      AND [Field1] = 'Driver'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 260), null, 'Technical Head', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 11   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 260)
      AND [Field1] = 'Technical Head'
);

--To insert data into master HR department

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270), null, 'OT', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270)
      AND [Field1] = 'OT'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270), null, 'Doctor Department', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270)
      AND [Field1] = 'Doctor Department'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270), null, 'Admin', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270)
      AND [Field1] = 'Admin'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270), null, 'IPD Department', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270)
      AND [Field1] = 'IPD Department'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270), null, 'OPD Department', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270)
      AND [Field1] = 'OPD Department'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270), null, 'ICU', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 6   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270)
      AND [Field1] = 'ICU'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270), null, 'Blood Bank Department', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 7   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270)
      AND [Field1] = 'Blood Bank Department'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270), null, 'Pathology', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 8   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270)
      AND [Field1] = 'Pathology'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270), null, 'Radiology', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 9   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270)
      AND [Field1] = 'Radiology'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270), null, 'Pharmacy Department', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 10   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270)
      AND [Field1] = 'Pharmacy Department'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270), null, 'Reception', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 11   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270)
      AND [Field1] = 'Reception'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270), null, 'Human Resource', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 12   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270)
      AND [Field1] = 'Human Resource'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270), null, 'Gynecology', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 13   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270)
      AND [Field1] = 'Gynecology'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270), null, 'Finance', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 14   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270)
      AND [Field1] = 'Finance'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270), null, 'Emergency Department', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 15   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270)
      AND [Field1] = 'Emergency Department'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270), null, 'Cardiology', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 16   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270)
      AND [Field1] = 'Cardiology'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270), null, 'BURN CARE', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 17   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270)
      AND [Field1] = 'BURN CARE'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270), null, 'NICU', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 18   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270)
      AND [Field1] = 'NICU'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270), null, 'Nursing Department', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 19   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 270)
      AND [Field1] = 'Nursing Department'
);

--To insert data into master HR leave type

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 280), null, 'Casual Leave', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 280)
      AND [Field1] = 'Casual Leave'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 280), null, 'Privilege Leave', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 280)
      AND [Field1] = 'Privilege Leave'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 280), null, 'Sick Leave', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 280)
      AND [Field1] = 'Sick Leave'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 280), null, 'Maternity Leave', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 280)
      AND [Field1] = 'Maternity Leave'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 280), null, 'Paternity Leave', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 5   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 280)
      AND [Field1] = 'Paternity Leave'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 280), null, 'Fever Leave', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 6  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 280)
      AND [Field1] = 'Fever Leave'
);

--To insert data into master appointment status

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 290), null, 'Pending', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 290)
      AND [Field1] = 'Pending'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 290), null, 'Approved', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 290)
      AND [Field1] = 'Approved'
);
INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 290), null, 'Cancel', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 290)
      AND [Field1] = 'Cancel'
);

--To insert data into master appointment source

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 300), null, 'Offline', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 300)
      AND [Field1] = 'Offline'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 300), null, 'Online', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 300)
      AND [Field1] = 'Online'
);

--To insert data into master appointment priority

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 310), null, 'Very Urgent', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 1   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 310)
      AND [Field1] = 'Very Urgent'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 310), null, 'Urgent', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 2  
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 310)
      AND [Field1] = 'Urgent'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 310), null, 'Normal', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 3   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 310)
      AND [Field1] = 'Normal'
);

INSERT INTO [QuickHRP].[dbo].[MasterData] 
([TypeId], [ParentId1], [Field1], [Field2], [HospitalId], 
[CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [Inactive], [IsDeleted], [OrderNumber])
SELECT (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 310), null, 'Low', null, (SELECT ID FROM [dbo].[HospitalRegistration] WHERE [Code] = 'QuickHRP1001'),1, GETDATE(), NULL, NULL, 0, 0, 4   
WHERE NOT EXISTS (
    SELECT 1 
    FROM [QuickHRP].[dbo].[MasterData]
    WHERE [TypeId] = (SELECT ID FROM [QuickHRP].[dbo].[MasterType] WHERE [BusinessKey] = 310)
      AND [Field1] = 'Low'
);
