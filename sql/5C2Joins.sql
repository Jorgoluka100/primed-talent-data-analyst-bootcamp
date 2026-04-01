CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductName TEXT NOT NULL,
    CustomerName TEXT NOT NULL,
    Category text NOT NULL,
    SaleAmount REAL NOT NULL,
    SalesRep TEXT NOT NULL
   );
   INSERT INTO Sales (SaleID, ProductName, CustomerName, Category, SaleAmount, SalesRep) VALUES 
(1, 'Logitech MX Master 3', 'Global Industries', 'Peripherals', 99.99, 'Sarah Jenkins'),
(2, 'Dell UltraSharp 27', 'Tech Solutions Inc', 'Monitors', 450.50, 'Michael Chen'),
(3, 'Office Chair Ergo v2', 'Creative Studios', 'Furniture', 299.00, 'Sarah Jenkins'),
(4, 'MacBook Pro 14', 'Individual Buyer', 'Laptops', 1999.99, 'Michael Chen'),
(5, 'USB-C Hub 10-in-1', 'Global Industries', 'Accessories', 55.25, 'Emma Rodriguez');

select * from Sales;
SELECT Category, count(*) as ProductCount from Sales GROUP BY Category;
update Sales set Category="Furniture" where SaleID=2;
SELECT CustomerName, sum(SaleAmount) as TotalSales from Sales
group BY CustomerName;

select SalesRep, avg(SaleAmount) as AverageSale from Sales GROUP by SalesRep;
select SalesRep, avg(SaleAmount) as AverageSale from Sales GROUP by SalesRep order by AverageSale DESC;


