-- Stores product inventory information
CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY,         -- Unique product identifier
    ProductName VARCHAR(100) NOT NULL,    -- Product name
    StockQuantity INT NOT NULL DEFAULT 0, -- Current stock level
    UnitPrice NUMERIC(10,2)               -- Price per unit
);
INSERT INTO Products (ProductName, StockQuantity, UnitPrice) VALUES
('Laptop', 10, 1200.00),
('Monitor', 25, 300.00),
('Keyboard', 50, 40.00),
('Mouse', 75, 25.00);
SELECT * FROM Products;
UPDATE Products SET ProductID = 1 WHERE ProductName = 'Laptop';
UPDATE Products SET ProductID = 2 WHERE ProductName = 'Monitor';
UPDATE Products SET ProductID = 3 WHERE ProductName = 'Keyboard';
UPDATE Products SET ProductID = 4 WHERE ProductName = 'Mouse';

BEGIN;

-- Increase stock for each product
UPDATE Products
SET StockQuantity = StockQuantity + 5
WHERE ProductID = 1;  -- Laptop

UPDATE Products
SET StockQuantity = StockQuantity + 10
WHERE ProductID = 2;  -- Monitor

UPDATE Products
SET StockQuantity = StockQuantity + 20
WHERE ProductID = 3;  -- Keyboard

COMMIT;
BEGIN;

UPDATE Products SET StockQuantity = StockQuantity + 5 WHERE ProductID = 1;
UPDATE Products SET StockQuantity = StockQuantity + 10 WHERE ProductID = 999; -- Invalid ID ❌

ROLLBACK;

-- Customers table (for reference)
CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE NOT NULL,
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO Customers (CustomerID,FirstName, LastName, Email) VALUES
(101,'John', 'Doe', 'john.doe@email.com'),
(102,'Jane', 'Smith', 'jane.smith@email.com'),
(103,'Michael', 'Brown', 'michael.brown@email.com'),
(104,'Emily', 'Davis', 'emily.davis@email.com'),
(105,'Chris', 'Wilson', 'chris.wilson@email.com');
SELECT * FROM Customers;

-- Stored procedure to add a new customer if email does not already exist
CREATE OR REPLACE PROCEDURE sp_AddNewCustomer(
    P_CustomerID INT,
    p_FirstName VARCHAR,
    p_LastName VARCHAR,
    p_Email VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Check if customer with the given email already exists
    IF EXISTS (
        SELECT 1
        FROM Customers
        WHERE Email = p_Email
    ) THEN
        -- Email already exists, do not insert
        RAISE NOTICE 'Customer with email % already exists.', p_Email;
    ELSE
        -- Insert new customer
        INSERT INTO Customers (CustomerID,FirstName, LastName, Email)
        VALUES (P_CustomerID,p_FirstName, p_LastName, p_Email);

        RAISE NOTICE 'New customer added successfully.';
    END IF;
END;
$$;
CALL sp_AddNewCustomer(106,'Alice', 'Brown', 'alice.brown@email.com');