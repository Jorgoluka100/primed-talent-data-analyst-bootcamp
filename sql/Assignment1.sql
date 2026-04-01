-- Table: Customers
CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    JoinDate DATE
);

-- Table: Products
CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(100),
    Price NUMERIC(10,2),
    Category VARCHAR(50)
);

-- Table: Orders
CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INT REFERENCES Customers(CustomerID),
    OrderDate DATE,
    TotalAmount NUMERIC(10,2)
);

-- Table: OrderDetails
CREATE TABLE OrderDetails (
    OrderDetailID SERIAL PRIMARY KEY,
    OrderID INT REFERENCES Orders(OrderID),
    ProductID INT REFERENCES Products(ProductID),
    Quantity INT,
    UnitPrice NUMERIC(10,2)
);
INSERT INTO Customers (FirstName, LastName, Email, JoinDate) VALUES
('John', 'Doe', 'john.doe@example.com', '2025-11-15'),
('Jane', 'Smith', 'jane.smith@example.com', '2025-12-01'),
('Mike', 'Brown', 'mike.brown@example.com', '2026-01-05'),
('Emily', 'Davis', 'emily.davis@example.com', '2026-01-10'),
('Chris', 'Wilson', 'chris.wilson@example.com', '2025-10-20'),
('Sara', 'Johnson', 'sara.johnson@example.com', '2025-09-15');
INSERT INTO Products (ProductName, Price, Category) VALUES
('Laptop', 1200.00, 'Electronics'),
('Monitor', 300.00, 'Electronics'),
('Desk Chair', 150.00, 'Office Supplies'),
('Notebook', 5.00, 'Office Supplies'),
('Headphones', 50.00, 'Electronics'),
('Water Bottle', 10.00, 'Accessories'),
('Backpack', 45.00, 'Accessories');
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2026-01-01', 1500.00),
(2, '2026-01-03', 2300.00),
(3, '2026-01-05', 1200.00),
(1, '2026-01-07', 300.00),
(4, '2026-01-10', 200.00),
(5, '2025-12-20', 750.00);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 1200.00), -- John bought 1 Laptop
(1, 2, 1, 300.00),  -- John bought 1 Monitor
(2, 1, 2, 1200.00), -- Jane bought 2 Laptops
(2, 5, 1, 50.00),   -- Jane bought 1 Headphones
(3, 2, 1, 300.00),  -- Mike bought 1 Monitor
(3, 4, 180, 5.00),  -- Mike bought 180 Notebooks
(4, 6, 20, 10.00),  -- Emily bought 20 Water Bottles
(5, 3, 5, 150.00),  -- Chris bought 5 Desk Chairs
(6, 7, 2, 45.00);   -- Sara bought 2 Backpacks
---List all customers who have placed an order in the last 30 days
SELECT DISTINCT c.*
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= date('now', '-60 days')
ORDER BY c.LastName;

select * from Customers;
select * from Orders;

SELECT * FROM Products WHERE Price > 50;



-- List customers with no orders
SELECT c.CustomerID, c.FirstName, c.LastName, c.Email
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL
ORDER BY c.LastName, c.FirstName;

-- Calculate total revenue for each product
SELECT p.ProductName, SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY TotalRevenue DESC;

-- Identify the top 5 customers based on total spending
SELECT c.CustomerID, c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSpent DESC
LIMIT 5;

-- List all products that have never been sold
SELECT p.ProductID, p.ProductName
FROM Products p
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
WHERE od.ProductID IS NULL
ORDER BY p.ProductName;

-- Retrieve orders placed between two specific dates
SELECT o.OrderID, c.FirstName, c.LastName, o.OrderDate, o.TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.OrderDate BETWEEN '2026-01-01' AND '2026-01-31'
ORDER BY o.OrderDate;

-- Calculate average order value for each customer
SELECT c.CustomerID, c.FirstName, c.LastName, AVG(o.TotalAmount) AS AvgOrderValue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY AvgOrderValue DESC;