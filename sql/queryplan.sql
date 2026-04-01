CREATE TABLE Employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary NUMERIC(10,2),
    hire_date DATE,
    status VARCHAR(20)  -- e.g., Active, On Leave, Resigned
);

-- Sample Data
INSERT INTO Employees (first_name, last_name, department, salary, hire_date, status) VALUES
('John', 'Doe', 'Sales', 55000, '2020-01-15', 'Active'),
('Jane', 'Smith', 'Sales', 65000, '2019-06-10', 'Active'),
('Mike', 'Brown', 'HR', 50000, '2021-03-12', 'Active'),
('Emily', 'Davis', 'IT', 72000, '2018-11-05', 'On Leave'),
('Chris', 'Wilson', 'Sales', 75000, '2022-01-20', 'Active'),
('Sara', 'Johnson', 'Finance', 68000, '2017-08-15', 'Resigned');

CREATE TABLE Departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE
);

-- Sample Data
INSERT INTO Departments (department_name) VALUES
('Sales'),
('HR'),
('IT'),
('Finance'),
('Marketing');

CREATE TABLE Projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100),
    department_id INT REFERENCES Departments(department_id),
    budget NUMERIC(12,2),
    start_date DATE,
    end_date DATE
);

-- Sample Data
INSERT INTO Projects (project_name, department_id, budget, start_date, end_date) VALUES
('Website Redesign', 4, 50000, '2025-01-01', '2025-06-30'),
('CRM Implementation', 1, 75000, '2025-03-01', '2025-09-30'),
('Employee Onboarding', 2, 20000, '2025-02-15', '2025-05-31'),
('Cybersecurity Upgrade', 3, 120000, '2025-01-15', '2025-12-31');

CREATE TABLE Sales (
    sale_id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES Employees(employee_id),
    sale_amount NUMERIC(10,2),
    sale_date DATE,
    region VARCHAR(50)
);

-- Sample Data
INSERT INTO Sales (employee_id, sale_amount, sale_date, region) VALUES
(1, 1500, '2026-01-01', 'North America'),
(2, 2300, '2026-01-03', 'Europe'),
(5, 5000, '2026-01-05', 'North America'),
(1, 1200, '2026-01-07', 'Asia'),
(2, 3100, '2026-01-10', 'Europe');

SELECT * FROM SALES;
SELECT * FROM PROJECTS;
SELECT * FROM Departments;
SELECT * FROM Employees;
-- Query to find all active employees in the Sales department with salary greater than 60000
SELECT *
FROM Employees
WHERE department = 'Sales'
  AND salary > 60000
  AND status = 'Active';
-- Query to find total sales by region for the month of January 2026
SELECT region, SUM(sale_amount) AS total_sales
FROM Sales
WHERE sale_date BETWEEN '2026-01-01' AND '2026-01-31';
GROUP BY region;
END;
    GROUP BY r.region_name, c.name
    ORDER BY r.region_name, c.name;
END; $$;        
-- Query to find the top 3 highest budget projects in the IT department
SELECT *
FROM Projects
WHERE department_id = (SELECT department_id FROM Departments WHERE department_name = 'IT')
ORDER BY budget DESC
LIMIT 3;
-- Query to find employees hired after January 1, 2020
SELECT *
FROM Employees
WHERE hire_date > '2020-01-01';
-- Query to find average salary by department
SELECT department, AVG(salary) AS average_salary
FROM Employees
GROUP BY department;
-- Query to find all projects that are currently ongoing (based on current date)
SELECT *
FROM Projects
WHERE start_date <= CURRENT_DATE AND end_date >= CURRENT_DATE;
-- Query to find employees who are currently on leave
SELECT *
FROM Employees
WHERE status = 'On Leave';
-- Query to find total sales made by each employee
SELECT employee_id, SUM(sale_amount) AS total_sales
FROM Sales
GROUP BY employee_id;




