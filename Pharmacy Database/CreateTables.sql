-- Create the Pharmacy database if it does not exist
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Pharmacy')
BEGIN
    CREATE DATABASE Pharmacy;
    PRINT 'Pharmacy database created successfully.';
END
ELSE
BEGIN
    PRINT 'Pharmacy database already exists.';
END
GO

-- Use the Pharmacy database
USE Pharmacy;
GO

-- Create Patient Table
CREATE TABLE Patient (
    PID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Sex CHAR(1),
    Address VARCHAR(100) NOT NULL,
    Contact VARCHAR(50) NOT NULL,
    PDetails VARCHAR(100)

);

-- Create Medicine Table
CREATE TABLE Medicine (
    DrugID INT PRIMARY KEY,
    MfgDate DATE,
    Quantity INT,
    Price DECIMAL(8,2),
    Manufacturer VARCHAR(100),
    ExpDate DATE
);

-- Create Doctor Table
CREATE TABLE Doctor (
    DocID INT PRIMARY KEY,
    DocName VARCHAR(100) NOT NULL,
    Hospital VARCHAR(100),
    Contact VARCHAR(50) NOT NULL,
    Address1 VARCHAR(100) NOT NULL,
    Address2 VARCHAR(100)
);

-- Create Bill Table
CREATE TABLE Bill (
    BillID INT PRIMARY KEY,
    Amt DECIMAL(8,2),
    Quantity INT,
    DrugID INT,
    DocID INT,
    PID INT,
    FOREIGN KEY (DrugID) REFERENCES Medicine(DrugID),
    FOREIGN KEY (DocID) REFERENCES Doctor(DocID),
    FOREIGN KEY (PID) REFERENCES Patient(PID)
);

-- Create Pharmacy Table
CREATE TABLE Pharmacy (
    StoreID INT PRIMARY KEY,
    StoreName VARCHAR(100) NOT NULL,
    PinCode VARCHAR(20) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    Address1 VARCHAR(100) NOT NULL,
    Address2 VARCHAR(100)
);

-- Create Hospital Table
CREATE TABLE Hospital (
    HospitalID INT PRIMARY KEY,
    HosName VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    State VARCHAR(100) NOT NULL,
    PinCode VARCHAR(20) NOT NULL,
    City VARCHAR(100) NOT NULL
);

-- Create Supplier Table
CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    State VARCHAR(100) NOT NULL,
    QuotedPrice DECIMAL(8,2)
);

-- Create Employee Table
CREATE TABLE Employee (
    EID INT PRIMARY KEY,
    EmpName VARCHAR(100) NOT NULL,
    Salary DECIMAL(8,2),
    EAddress VARCHAR(100),
    Sex CHAR(1),
    NID VARCHAR(20) NOT NULL
);

-- Populate Patient Table
INSERT INTO Patient (PID, Name, Sex, Address, Contact, PDetails) VALUES
(1, 'John Doe', 'M', '123 Main St, City1 12345', '555-123-4567', 'Details1'),
(2, 'Jane Smith', 'F', '456 Elm St, City2 23456', '555-234-5678', 'Details2'),
(3, 'Alice Johnson', 'F', '789 Oak St, City3 34567', '555-345-6789', 'Details3'),
(4, 'Bob Williams', 'M', '1011 Pine St, City4 45678', '555-456-7890', 'Details4'),
(5, 'Emily Brown', 'F', '1213 Maple St, City5 56789', '555-567-8901', 'Details5'),
(6, 'Michael Jones', 'M', '1415 Cedar St, City6 67890', '555-678-9012', 'Details6'),
(7, 'Sarah Davis', 'F', '1617 Birch St, City7 78901', '555-789-0123', 'Details7'),
(8, 'David Wilson', 'M', '1819 Walnut St, City8 89012', '555-890-1234', 'Details8'),
(9, 'Jessica Taylor', 'F', '2021 Ash St, City9 90123', '555-901-2345', 'Details9'),
(10, 'Matthew Martinez', 'M', '2223 Spruce St, City10 01234', '555-012-3456', 'Details10');


-- Populate Medicine Table
INSERT INTO Medicine (DrugID, MfgDate, Quantity, Price, Manufacturer, ExpDate) VALUES
(1, '2023-01-01', 100, 10.50, 'Manufacturer1', '2024-01-01'),
(2, '2022-12-01', 200, 20.75, 'Manufacturer2', '2023-12-01'),
(3, '2022-11-01', 150, 15.25, 'Manufacturer3', '2023-11-01'),
(4, '2022-10-01', 120, 12.75, 'Manufacturer4', '2023-10-01'),
(5, '2022-09-01', 180, 18.25, 'Manufacturer5', '2023-09-01'),
(6, '2022-08-01', 90, 9.50, 'Manufacturer6', '2023-08-01'),
(7, '2022-07-01', 110, 11.75, 'Manufacturer7', '2023-07-01'),
(8, '2022-06-01', 130, 13.25, 'Manufacturer8', '2023-06-01'),
(9, '2022-05-01', 70, 7.50, 'Manufacturer9', '2023-05-01'),
(10, '2022-04-01', 140, 14.75, 'Manufacturer10', '2023-04-01');


-- Populate Doctor Table
INSERT INTO Doctor (DocID, DocName, Hospital, Contact, Address1, Address2) VALUES
(1, 'Dr. John Smith', 'Hospital1', '555-123-4567', '123 Main St', 'City1'),
(2, 'Dr. Emily Johnson', 'Hospital2', '555-234-5678', '456 Elm St', 'City2'),
(3, 'Dr. Michael Williams', 'Hospital3', '555-345-6789', '789 Oak St', 'City3'),
(4, 'Dr. Sarah Brown', 'Hospital4', '555-456-7890', '1011 Pine St', 'City4'),
(5, 'Dr. David Jones', 'Hospital5', '555-567-8901', '1213 Maple St', 'City5'),
(6, 'Dr. Jessica Davis', 'Hospital6', '555-678-9012', '1415 Cedar St', 'City6'),
(7, 'Dr. Matthew Wilson', 'Hospital7', '555-789-0123', '1617 Birch St', 'City7'),
(8, 'Dr. Olivia Taylor', 'Hospital8', '555-890-1234', '1819 Walnut St', 'City8'),
(9, 'Dr. Ethan Martinez', 'Hospital9', '555-901-2345', '2021 Ash St', 'City9'),
(10, 'Dr. Sophia Thomas', 'Hospital10', '555-012-3456', '2223 Spruce St', 'City10');


-- Populate Bill Table
INSERT INTO Bill (BillID, Amt, Quantity, DrugID, DocID, PID) VALUES
(1, 100.50, 5, 1, 1, 1),
(2, 200.75, 10, 2, 2, 2),
(3, 150.25, 8, 3, 3, 3),
(4, 120.75, 7, 4, 4, 4),
(5, 180.25, 9, 5, 5, 5),
(6, 90.50, 4, 6, 6, 6),
(7, 110.75, 6, 7, 7, 7),
(8, 130.25, 3, 8, 8, 8),
(9, 70.50, 2, 9, 9, 9),
(10, 140.75, 1, 10, 10, 10);


-- Populate Pharmacy Table
INSERT INTO Pharmacy (StoreID, StoreName, PinCode, City, State, Location, Address1, Address2) VALUES
(1, 'Pharmacy1', '12345', 'City1', 'State1', 'Location1', '123 Main St', 'City1'),
(2, 'Pharmacy2', '23456', 'City2', 'State2', 'Location2', '456 Elm St', 'City2'),
(3, 'Pharmacy3', '34567', 'City3', 'State3', 'Location3', '789 Oak St', 'City3'),
(4, 'Pharmacy4', '45678', 'City4', 'State4', 'Location4', '1011 Pine St', 'City4'),
(5, 'Pharmacy5', '56789', 'City5', 'State5', 'Location5', '1213 Maple St', 'City5'),
(6, 'Pharmacy6', '67890', 'City6', 'State6', 'Location6', '1415 Cedar St', 'City6'),
(7, 'Pharmacy7', '78901', 'City7', 'State7', 'Location7', '1617 Birch St', 'City7'),
(8, 'Pharmacy8', '89012', 'City8', 'State8', 'Location8', '1819 Walnut St', 'City8'),
(9, 'Pharmacy9', '90123', 'City9', 'State9', 'Location9', '2021 Ash St', 'City9'),
(10, 'Pharmacy10', '01234', 'City10', 'State10', 'Location10', '2223 Spruce St', 'City10');


-- Populate Hospital Table
INSERT INTO Hospital (HospitalID, HosName, Location, State, PinCode, City) VALUES
(1, 'Hospital1', 'Location1', 'State1', '12345', 'City1'),
(2, 'Hospital2', 'Location2', 'State2', '23456', 'City2'),
(3, 'Hospital3', 'Location3', 'State3', '34567', 'City3'),
(4, 'Hospital4', 'Location4', 'State4', '45678', 'City4'),
(5, 'Hospital5', 'Location5', 'State5', '56789', 'City5'),
(6, 'Hospital6', 'Location6', 'State6', '67890', 'City6'),
(7, 'Hospital7', 'Location7', 'State7', '78901', 'City7'),
(8, 'Hospital8', 'Location8', 'State8', '89012', 'City8'),
(9, 'Hospital9', 'Location9', 'State9', '90123', 'City9'),
(10, 'Hospital10', 'Location10', 'State10', '01234', 'City10');


-- Populate Supplier Table
INSERT INTO Supplier (SupplierID, SupplierName, City, Location, State, QuotedPrice) VALUES
(1, 'Supplier1', 'City1', 'Location1', 'State1', 100.50),
(2, 'Supplier2', 'City2', 'Location2', 'State2', 200.75),
(3, 'Supplier3', 'City3', 'Location3', 'State3', 150.25),
(4, 'Supplier4', 'City4', 'Location4', 'State4', 120.75),
(5, 'Supplier5', 'City5', 'Location5', 'State5', 180.25),
(6, 'Supplier6', 'City6', 'Location6', 'State6', 90.50),
(7, 'Supplier7', 'City7', 'Location7', 'State7', 110.75),
(8, 'Supplier8', 'City8', 'Location8', 'State8', 130.25),
(9, 'Supplier9', 'City9', 'Location9', 'State9', 70.50),
(10, 'Supplier10', 'City10', 'Location10', 'State10', 140.75);


-- Populate Employee Table
INSERT INTO Employee (EID, EmpName, Salary, EAddress, Sex, NID) VALUES
(1, 'John Doe', 50000.00, '123 Main St, City1 12345', 'M', 'A123456789'),
(2, 'Jane Smith', 60000.00, '456 Elm St, City2 23456', 'F', 'B234567890'),
(3, 'Alice Johnson', 55000.00, '789 Oak St, City3 34567', 'F', 'C345678901'),
(4, 'Bob Williams', 65000.00, '1011 Pine St, City4 45678', 'M', 'D456789012'),
(5, 'Emily Brown', 70000.00, '1213 Maple St, City5 56789', 'F', 'E567890123'),
(6, 'Michael Jones', 75000.00, '1415 Cedar St, City6 67890', 'M', 'F678901234'),
(7, 'Sarah Davis', 80000.00, '1617 Birch St, City7 78901', 'F', 'G789012345'),
(8, 'David Wilson', 85000.00, '1819 Walnut St, City8 89012', 'M', 'H890123456'),
(9, 'Jessica Taylor', 90000.00, '2021 Ash St, City9 90123', 'F', 'I901234567'),
(10, 'Matthew Martinez', 95000.00, '2223 Spruce St, City10 01234', 'M', 'J012345678');



-- Drop the trigger if it already exists to avoid conflicts
IF OBJECT_ID('UpdateMedicineStock', 'TR') IS NOT NULL
DROP TRIGGER UpdateMedicineStock;
GO

-- Create the trigger named "UpdateMedicineStock" for updating stock after a new bill is inserted
CREATE TRIGGER UpdateMedicineStock
ON Bill
AFTER INSERT
AS
BEGIN
    -- Decrease the quantity of the sold medicine in the Medicine table
    UPDATE Medicine
    SET Quantity = Quantity - (SELECT Quantity FROM inserted WHERE DrugID = Medicine.DrugID)
    WHERE DrugID IN (SELECT DrugID FROM inserted);
END;
PRINT 'UpdateMedicineStock trigger created successfully.';
GO

-- Drop the procedure if it already exists to avoid conflicts
IF OBJECT_ID('UpdateMedicinePriceProcedure', 'P') IS NOT NULL
DROP PROCEDURE UpdateMedicinePriceProcedure;
GO

-- Create the procedure named "UpdateMedicinePriceProcedure" for updating medicine prices periodically
CREATE PROCEDURE UpdateMedicinePriceProcedure
AS
BEGIN
    BEGIN TRY
        -- Start a transaction
        BEGIN TRANSACTION;

        -- Update medicine prices based on some criteria
        UPDATE Medicine
        SET Price = Price * 1.1; -- Increase prices by 10%

        -- Commit the transaction if successful
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if an error occurs
        IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

        -- Throw an error message
        THROW;
    END CATCH;
END;
PRINT 'UpdateMedicinePriceProcedure procedure created successfully.';
GO

EXEC UpdateMedicinePriceProcedure;