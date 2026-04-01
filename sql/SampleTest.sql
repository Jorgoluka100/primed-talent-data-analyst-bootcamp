create TABLE Products1 (
ProductID INT PRIMARY KEY,
Name text,
price real
);

--DROP TABLE Products;
ALTER table Products1 ADD COLUMN Stock INTEGER;
INSERT into Products1 VALUES(1, 'Karthica',12.50,3);
SELECT * FROM Products1;
INSERT into Products1 VALUES(2, 'Laptop',999.00,32),
(3,'Smartphone',756.00,26),
(4,'Tablet',450.00,53);

UPDATE Products1 set Price=price*1.1 where ProductID=1;
UPDATE Products1 set Name='Charger' where ProductID=1;
DELETE from Products1 where ProductID=1;

--- TCL commands
BEGIN TRANSACTION;
update Products1 set Stock=Stock-50 where ProductID=2;
update Products1 set Stock=Stock+50 where ProductID=3;
COMMIT;

CREATE TABLE Customer (
CustomerID Integer PRIMARY KEY,
Name TEXT,
Age INT
);
Insert into Customer VALUES
(1,'Alice',30),
(2,'Bob',25),
(3,'Charlie',35);
SELECT * From Customer;
SELECT Name,Age from Customer where Age>=30;
SELECT Name,Age from Customer where Age>=30 and Name like 'A%';
SELECT Name,Age from Customer where not Age<30;
SELECT Name,Age from Customer where Age>30 or Name like 'B%';
SELECT Name,Age from Customer ORDER by Age DESC LIMIT 2;
SELECT Name,Age from Customer ORDER by Name DESC LIMIT 2;
