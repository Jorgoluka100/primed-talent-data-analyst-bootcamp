
 CREATE TABLE ProjectData (
    RecordID       INTEGER PRIMARY KEY AUTOINCREMENT,
    ClientName     TEXT,
    ClientCity     TEXT,
    ClientState    TEXT,
    ProjectName    TEXT,
    ProjectStart   DATE,
    ProjectEnd     DATE,
    TaskList       TEXT,   -- multiple tasks stored as comma-separated values
    AssignedEmployees TEXT -- multiple employees stored as comma-separated values
);

INSERT INTO ProjectData (ClientName, ClientCity, ClientState, ProjectName, ProjectStart, ProjectEnd, TaskList, AssignedEmployees)
VALUES
('Acme Corp', 'New York', 'NY', 'Website Redesign', '2025-01-15', '2025-03-30',
'Design Homepage, Develop Backend, Test Deployment',
'Alice Johnson, Robert Miller, Sophia Brown'),
 
('Bright Solutions', 'Chicago', 'IL', 'Mobile App Development', '2025-02-01', NULL,
'UI Design, API Integration, Beta Testing',
'David Wilson, Emily Clark, John Smith'),
 
('West Coast Tech', 'San Francisco', 'CA', 'Cloud Migration', '2025-03-01', '2025-06-15',
'Migrate Database, Configure Servers, Security Audit',
'Michael Lee, Sarah Davis, Daniel Harris');

select * from ProjectData;

CREATE TABLE ProjectData_1NF (
    RecordID       INTEGER,
    ClientName     TEXT,
    ClientCity     TEXT,
    ClientState    TEXT,
    ProjectName    TEXT,
    ProjectStart   DATE,
    ProjectEnd     DATE,
    TaskName       TEXT,
    AssignedEmployee TEXT
);

INSERT INTO ProjectData_1NF
VALUES
(1, 'Acme Corp', 'New York', 'NY', 'Website Redesign', '2025-01-15', '2025-03-30', 'Design Homepage', 'Alice Johnson'),
(1, 'Acme Corp', 'New York', 'NY', 'Website Redesign', '2025-01-15', '2025-03-30', 'Develop Backend', 'Robert Miller'),
(1, 'Acme Corp', 'New York', 'NY', 'Website Redesign', '2025-01-15', '2025-03-30', 'Test Deployment', 'Sophia Brown'),
(2, 'Bright Solutions', 'Chicago', 'IL', 'Mobile App Development', '2025-02-01', NULL, 'UI Design', 'David Wilson'),
(2, 'Bright Solutions', 'Chicago', 'IL', 'Mobile App Development', '2025-02-01', NULL, 'API Integration', 'Emily Clark'),
(2, 'Bright Solutions', 'Chicago', 'IL', 'Mobile App Development', '2025-02-01', NULL, 'Beta Testing', 'John Smith'),
(3, 'West Coast Tech', 'San Francisco', 'CA', 'Cloud Migration', '2025-03-01', '2025-06-15', 'Migrate Database', 'Michael Lee'),
(3, 'West Coast Tech', 'San Francisco', 'CA', 'Cloud Migration', '2025-03-01', '2025-06-15', 'Configure Servers', 'Sarah Davis'),
(3, 'West Coast Tech', 'San Francisco', 'CA', 'Cloud Migration', '2025-03-01', '2025-06-15', 'Security Audit', 'Daniel Harris');

SELECT * FROM ProjectData_1NF;

CREATE TABLE Clients (
    ClientID     INTEGER PRIMARY KEY AUTOINCREMENT,
    ClientName   TEXT NOT NULL,
    ContactEmail TEXT UNIQUE NOT NULL,
    City         TEXT NOT NULL,
    State        TEXT NOT NULL
);

 CREATE TABLE Projects (
    ProjectID   INTEGER PRIMARY KEY AUTOINCREMENT,
    ProjectName TEXT NOT NULL,
    StartDate   DATE NOT NULL,
    EndDate     DATE,
    ClientID    INTEGER NOT NULL,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

 
CREATE TABLE Tasks (
    TaskID     INTEGER PRIMARY KEY AUTOINCREMENT,
    TaskName   TEXT NOT NULL,
    AssignedTo TEXT NOT NULL,
    DueDate    DATE,
    Status     TEXT CHECK(Status IN ('Pending','In Progress','Completed')) DEFAULT 'Pending',
    ProjectID  INTEGER NOT NULL,
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);


INSERT into Clients VALUES(1, 'Acme Corp','acmegroup@gmail.com','New York','NY');
INSERT into Clients VALUES(2, 'Bright Solutions','BrightSolutions@gmail.com','Chicago','IL');
INSERT into Clients VALUES(3, 'West Coast Tech','WestCoastTech@gmail.com','San Francisco','CA');

select * from Clients;

INSERT into Projects VALUES (1, 'Website Redesign','2025-01-15','2025-03-30',1);
INSERT into Projects VALUES (2, 'Mobile App Development','2025-02-01','',3);
INSERT into Projects VALUES (3, 'Cloud Migration','2025-03-01','2025-06-15',2);

SELECT * from Projects;


INSERT into Tasks values(1,'Design Homepage','Alice Johnson','2025-03-30','In Progress',1);
INSERT into Tasks values(2,'Develop Backend','Robert Miller','2025-03-30','In Progress',1);  
INSERT into Tasks values(3,'Test Deployment','Sophia Brown','2025-03-30','In Progress',1); 
INSERT into Tasks values(4,'UI Design','David Wilson','2025-05-25','Pending',2); 
INSERT into Tasks values(5,'API Integration','Emily Clark','2025-05-25','Pending',2); 
INSERT into Tasks values(6,'Beta Testing','John Smith','2025-05-25','Pending',2); 
INSERT into Tasks values(7,'Migrate Database','Michael Lee','2025-06-15','Completed',3); 
INSERT into Tasks values(8,'Configure Servers','Sarah Davis','2025-06-15','Completed',3); 
INSERT into Tasks values(9,'Security Audit','Daniel Harris','2025-06-15','Completed',3);

SELECT * from Tasks;

DELETE FROM Tasks WHERE ProjectID = 3;

select * from ProjectData;
SELECT * FROM ProjectData_1NF;
select * from Clients;
SELECT * from Projects;
select * from Tasks;
