CREATE TABLE Customers_Source (
    CustomerId INT PRIMARY KEY IDENTITY(1,1),
    TransactionId VARCHAR(50) NOT NULL UNIQUE,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100),
    Address NVARCHAR(200),
    PhoneNumber NVARCHAR(20),
    CreatedDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE MigrationStatus (
    StatusId INT PRIMARY KEY IDENTITY(1,1),
    CustomerId INT NOT NULL,
    MigrationStatus VARCHAR(20) NOT NULL CHECK (MigrationStatus IN ('New', 'InProgress', 'Completed', 'Failed')),
    UpdatedDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CustomerId) REFERENCES Customers_Source(CustomerId)
);




-- Insert updated data
INSERT INTO Customers_Source (TransactionId, FirstName, LastName, Email, Address, PhoneNumber)
VALUES 
    ('TXN001', 'John', 'Doe', 'john.doe@example.com', NULL, NULL),
    ('TXN002', 'Jane', 'Smith', 'jane.smith@example.com', NULL, NULL),
    ('TXN003', 'Alice', 'Johnson', 'alice.johnson@example.com', NULL, NULL),
    ('TXN004', 'Bob', 'Wilson', 'bob.wilson@example.com', NULL, NULL),
    ('TXN005', 'Emma', 'Brown', 'emma.brown@example.com', NULL, NULL),
    ('TXN006', 'Michael', 'Lee', 'michael.lee@example.com', NULL, NULL),
    ('TXN007', 'Sarah', 'Davis', 'sarah.davis@example.com', NULL, NULL),
    ('TXN008', 'David', 'Clark', 'david.clark@example.com', NULL, NULL),
    ('TXN009', 'Laura', 'Adams', 'laura.adams@example.com', NULL, NULL),
    ('TXN010', 'James', 'Taylor', 'james.taylor@example.com', NULL, NULL);


-- Insert corresponding MigrationStatus records (all 'New')
INSERT INTO MigrationStatus (CustomerId, MigrationStatus, UpdatedDate)
SELECT CustomerId, 'New', GETDATE()
FROM Customers_Source;