-- 03_schema_normalisation.sql
-- PostgreSQL
-- A small normalisation example with explicit keys and a many-to-many assignment table.

DROP TABLE IF EXISTS portfolio_task_assignments;
DROP TABLE IF EXISTS portfolio_tasks;
DROP TABLE IF EXISTS portfolio_projects;
DROP TABLE IF EXISTS portfolio_employees;
DROP TABLE IF EXISTS portfolio_clients;

CREATE TABLE portfolio_clients (
    client_id      integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    client_name    text NOT NULL UNIQUE,
    city           text NOT NULL,
    region         text NOT NULL
);

CREATE TABLE portfolio_projects (
    project_id     integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    client_id      integer NOT NULL REFERENCES portfolio_clients(client_id),
    project_name   text NOT NULL,
    start_date     date NOT NULL,
    end_date       date,
    CHECK (end_date IS NULL OR end_date >= start_date),
    UNIQUE (client_id, project_name)
);

CREATE TABLE portfolio_tasks (
    task_id        integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    project_id     integer NOT NULL REFERENCES portfolio_projects(project_id) ON DELETE CASCADE,
    task_name      text NOT NULL,
    due_date       date,
    status         text NOT NULL DEFAULT 'Pending'
                   CHECK (status IN ('Pending', 'In Progress', 'Completed')),
    UNIQUE (project_id, task_name)
);

CREATE TABLE portfolio_employees (
    employee_id    integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employee_name  text NOT NULL UNIQUE
);

CREATE TABLE portfolio_task_assignments (
    task_id        integer NOT NULL REFERENCES portfolio_tasks(task_id) ON DELETE CASCADE,
    employee_id    integer NOT NULL REFERENCES portfolio_employees(employee_id),
    PRIMARY KEY (task_id, employee_id)
);

INSERT INTO portfolio_clients (client_name, city, region) VALUES
    ('Acme Corp', 'New York', 'NY'),
    ('Bright Solutions', 'Chicago', 'IL'),
    ('West Coast Tech', 'San Francisco', 'CA');

INSERT INTO portfolio_projects (client_id, project_name, start_date, end_date)
SELECT client_id, 'Website Redesign', DATE '2026-01-15', DATE '2026-03-30'
FROM portfolio_clients WHERE client_name = 'Acme Corp';

INSERT INTO portfolio_projects (client_id, project_name, start_date, end_date)
SELECT client_id, 'Mobile App Development', DATE '2026-02-01', NULL
FROM portfolio_clients WHERE client_name = 'Bright Solutions';

INSERT INTO portfolio_tasks (project_id, task_name, due_date, status)
SELECT project_id, 'Design Homepage', DATE '2026-02-15', 'In Progress'
FROM portfolio_projects WHERE project_name = 'Website Redesign';

INSERT INTO portfolio_tasks (project_id, task_name, due_date, status)
SELECT project_id, 'API Integration', DATE '2026-04-15', 'Pending'
FROM portfolio_projects WHERE project_name = 'Mobile App Development';

INSERT INTO portfolio_employees (employee_name) VALUES
    ('Alice Johnson'),
    ('Emily Clark');

INSERT INTO portfolio_task_assignments (task_id, employee_id)
SELECT t.task_id, e.employee_id
FROM portfolio_tasks t
JOIN portfolio_projects p ON p.project_id = t.project_id
CROSS JOIN portfolio_employees e
WHERE (t.task_name = 'Design Homepage' AND e.employee_name = 'Alice Johnson')
   OR (t.task_name = 'API Integration' AND e.employee_name = 'Emily Clark');

SELECT
    c.client_name,
    p.project_name,
    t.task_name,
    t.status,
    e.employee_name
FROM portfolio_clients c
JOIN portfolio_projects p ON p.client_id = c.client_id
JOIN portfolio_tasks t ON t.project_id = p.project_id
LEFT JOIN portfolio_task_assignments a ON a.task_id = t.task_id
LEFT JOIN portfolio_employees e ON e.employee_id = a.employee_id
ORDER BY c.client_name, p.project_name, t.task_name, e.employee_name;
