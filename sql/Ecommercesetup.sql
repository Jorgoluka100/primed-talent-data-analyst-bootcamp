-- Create Categories Table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(255) UNIQUE,
    Address TEXT
);

-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(255),
    Price DECIMAL(10, 2),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID VARCHAR(50) PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create OrderItems Table
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID VARCHAR(50),
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert Products (Linked to Categories)
INSERT INTO Products (ProductID, Name, Price, CategoryID) VALUES 
(501, 'Laptop', 999.99, 1),
(502, 'Coffee Maker', 49.50, 2),
(503, 'SQL Basics Guide', 29.99, 3),
(504, 'Smartphone', 699.00, 1);

-- Insert Orders (Linked to Customers)
INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES 
('ORD-001', 101, '2023-10-01'),
('ORD-002', 102, '2023-10-02'),
('ORD-003', 101, '2023-10-03');

-- Insert OrderItems (Links Orders to Products)
INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity) VALUES 
(1, 'ORD-001', 501, 1), -- Alice bought a Laptop
(2, 'ORD-001', 503, 2), -- Alice also bought 2 SQL books
(3, 'ORD-002', 502, 1), -- Bob bought a Coffee Maker
(4, 'ORD-003', 504, 1); -- Alice bought a Smartphone 

-- Insert Categories
INSERT INTO Categories (CategoryID, CategoryName) VALUES 
(1, 'Electronics'),
(2, 'Home Appliances'),
(3, 'Books');

-- Insert Customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Address) VALUES 
(101, 'Alice', 'Smith', 'alice.s@example.com', '123 Maple St, Springfield'),
(102, 'Bob', 'Johnson', 'bjohnson@example.com', '456 Oak Ave, Metropolis'),
(103, 'Charlie', 'Davis', 'charlie.d@example.com', '789 Pine Rd, Gotham');

select * from Customers;
select * from Categories;
select * from OrderItems;
select * from Orders;
select * from Products;