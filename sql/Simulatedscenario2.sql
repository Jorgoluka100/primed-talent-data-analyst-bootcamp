-- Create a table to store employee details
CREATE TABLE employees1 (
    -- Unique identifier for each employee
    employee_id INTEGER PRIMARY KEY,
    -- Employee name
    name TEXT,
    -- Department in which the employee works
    department TEXT,
    -- Monthly salary of the employee
    salary REAL
);

 
-- Insert employees into IT department
INSERT INTO employees1 VALUES (1, 'Amit', 'IT', 70000);
INSERT INTO employees1 VALUES (2, 'Neha', 'IT', 80000); 
-- Insert employees into HR department
INSERT INTO employees1 VALUES (3, 'Rahul', 'HR', 50000);
INSERT INTO employees1 VALUES (4, 'Pooja', 'HR', 55000); 
-- Insert employees into Finance department
INSERT INTO employees1 VALUES (5, 'Suresh', 'Finance', 90000);
INSERT INTO employees1 VALUES (6, 'Anita', 'Finance', 95000);

select * from employees1;   
 --to know which department has the highest average salary
SELECT department, AVG(salary) as average_salary
FROM employees1 
GROUP BY department
ORDER BY average_salary DESC
LIMIT 1;
--to know total salary expenditure for each department
SELECT department, SUM(salary) as total_expenditure
FROM employees1
GROUP BY department;
--to know number of employees in each department
SELECT department, COUNT(*) as employee_count
FROM employees1
GROUP BY department;
--to know highest paid employee in each department
SELECT department, name, MAX(salary) as highest_salary
FROM employees1
GROUP BY department, name
HAVING salary = MAX(salary);
--to know lowest paid employee in each department
SELECT department, name, MIN(salary) as lowest_salary
FROM employees1
GROUP BY department, name
HAVING salary = MIN(salary);
--to know overall highest paid employee
SELECT name, department, salary
FROM employees1
WHERE salary = (SELECT MAX(salary) FROM employees1);
--to know overall lowest paid employee
SELECT name, department, salary
FROM employees1
WHERE salary = (SELECT MIN(salary) FROM employees1);    


 