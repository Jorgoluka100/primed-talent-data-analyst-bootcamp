-- Create a table to store customer information
CREATE TABLE customers_1 (
    -- Unique identifier for each customer
    customer_id INTEGER PRIMARY KEY,
    -- Customer full name
    name TEXT,
    -- Email address
    email TEXT,
    -- Date when the customer signed up
    -- Stored as TEXT in ISO format (YYYY-MM-DD)
    signup_date TEXT
); 
-- Insert older customers
INSERT INTO customers_1 VALUES (1, 'Rahul', 'rahul@mail.com', '2024-01-05');
INSERT INTO customers_1 VALUES (2, 'Neha', 'neha@mail.com', '2024-03-10'); 
-- Insert recent customers
INSERT INTO customers_1 VALUES (3, 'Amit', 'amit@mail.com', '2025-01-02');
INSERT INTO customers_1 VALUES (4, 'Pooja', 'pooja@mail.com', '2025-01-04');
INSERT INTO customers_1 VALUES (5, 'Suresh', 'suresh@mail.com', '2025-01-05');
INSERT INTO customers_1 VALUES (6, 'Anita', 'anita@mail.com', '2025-01-06');
INSERT INTO customers_1 VALUES (7, 'Karan', 'karan@mail.com', '2025-01-07');

select * from customers_1;
 --needs a list of the 5 most recent customers
select * from customers_1 order by signup_date desc limit 5;
--sorting the customers table by signup_date in descending order and then using a LIMIT 5 The query would be SELECT * FROM customers ORDER BY signup_date DESC LIMIT 5
a list of all customers from "New York" or "NYC."
select * from customers_1 where name like 'a%';

-- Create a table to store customer details
CREATE TABLE customers_2 (
    -- Unique customer identifier
    customer_id INTEGER PRIMARY KEY,
    -- Customer name
    name TEXT,
    -- City where the customer lives
    city TEXT,
    -- Customer email
    email TEXT
);

 
-- Insert customers with different city spellings

INSERT INTO customers_2 VALUES (1, 'Rahul', 'New York', 'rahul@mail.com');
INSERT INTO customers_2 VALUES (2, 'Neha', 'NYC', 'neha@mail.com');
INSERT INTO customers_2 VALUES (3, 'Amit', 'Los Angeles', 'amit@mail.com');
INSERT INTO customers_2 VALUES (4, 'Pooja', 'New York', 'pooja@mail.com');
INSERT INTO customers_2 VALUES (5, 'Suresh', 'NYC', 'suresh@mail.com');

a list of all customers from "New York" or "NYC."
select * from customers_2 where city in ('New York', 'NYC');


 