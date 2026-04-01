CREATE TABLE Departments (
    Department_ID VARCHAR(10) PRIMARY KEY,
    Department_Name VARCHAR(100) NOT NULL,
    Department_Building VARCHAR(100)
);
CREATE TABLE Instructors (
    Instructor_ID VARCHAR(10) PRIMARY KEY,
    Instructor_Name VARCHAR(100) NOT NULL,
    Instructor_Email VARCHAR(100),
    Instructor_Office VARCHAR(50),
    Department_ID VARCHAR(10),
    FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);

CREATE TABLE Courses (
    Course_ID VARCHAR(10) PRIMARY KEY,
    Course_Name VARCHAR(100) NOT NULL,
    Course_Credits INT,
    Instructor_ID VARCHAR(10),
    FOREIGN KEY (Instructor_ID) REFERENCES Instructors(Instructor_ID)
);

CREATE TABLE Students_LW (
    Student_ID VARCHAR(10) PRIMARY KEY,
    Student_Name VARCHAR(100) NOT NULL,
    Student_Email VARCHAR(100),
    Student_Phone VARCHAR(20),
    Student_Address TEXT
);
CREATE TABLE Registrations (
    Registration_ID VARCHAR(10) PRIMARY KEY,
    Student_ID VARCHAR(10),
    Course_ID VARCHAR(10),
    Semester VARCHAR(20),
    Year INT,
    Grade VARCHAR(5),
    Registration_Date DATE,
    FOREIGN KEY (Student_ID) REFERENCES Students_LW(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

INSERT INTO Departments (Department_ID, Department_Name, Department_Building) VALUES
('DEPT01', 'Computer Science', 'Alan Turing Building'),
('DEPT02', 'Mathematics', 'Newton Building'),
('DEPT03', 'Business School', 'Management Building');

INSERT INTO Instructors (Instructor_ID, Instructor_Name, Instructor_Email, Instructor_Office, Department_ID) VALUES
('INS01', 'Dr Sarah Mitchell', 's.mitchell@uni.ac.uk', 'Room 201', 'DEPT01'),
('INS02', 'Dr James Chen', 'j.chen@uni.ac.uk', 'Room 205', 'DEPT01'),
('INS03', 'Prof David Williams', 'd.williams@uni.ac.uk', 'Room 112', 'DEPT02'),
('INS04', 'Dr Priya Sharma', 'p.sharma@uni.ac.uk', 'Room 305', 'DEPT03'),
('INS05', 'Dr Emily Roberts', 'e.roberts@uni.ac.uk', 'Room 115', 'DEPT02'),
('INS06', 'Prof Michael O''Brien', 'm.obrien@uni.ac.uk', 'Room 310', 'DEPT03');


INSERT INTO Courses (Course_ID, Course_Name, Course_Credits, Instructor_ID) VALUES
('CS101', 'Introduction to Python', 15, 'INS01'),
('CS102', 'Database Systems', 15, 'INS02'),
('CS201','Machine Learning',20,'INS01'),
('MA201', 'Statistics for Data Science', 20, 'INS03'),
('MA301','Advanced Calculus',20,'INS05'),
('BU201', 'Financial Modelling', 15, 'INS06'),
('BU101', 'Business Analytics', 15, 'INS04');

INSERT INTO Students_LW (Student_ID, Student_Name, Student_Email, Student_Phone, Student_Address) VALUES
('STU101', 'Emma Thompson', 'emma.t@uni.ac.uk', '07700 100001', '15 Oxford Road Manchester'),
('STU102', 'James Wilson', 'james.w@uni.ac.uk', '07700 100002', '42 High Street Leeds'),
('STU103', 'Aisha Patel', 'aisha.p@uni.ac.uk', '07700 100003', '8 Queen Street Birmingham'),
('STU104', 'David Chen', 'david.c@uni.ac.uk', '07700 100004', '22 Park Lane London'),
('STU105', 'Sophie Brown', 'sophie.b@uni.ac.uk', '07700 100005', '33 Castle Road Edinburgh'),
('STU106', 'Mohammed Ali', 'mohammed.a@uni.ac.uk', '07700 100006', '55 Bridge Street Glasgow');

INSERT INTO Registrations (Registration_ID, Student_ID, Course_ID, Semester, Year, Grade, Registration_Date) VALUES
('R001', 'STU101', 'CS101', 'Autumn', 2024, 'A', '2024-09-01'),
('R002', 'STU101', 'CS102', 'Autumn', 2024, 'B+', '2024-09-01'),
('R003', 'STU101', 'MA201', 'Autumn', 2024, 'A-', '2024-09-02'),
('R004', 'STU102', 'CS101', 'Autumn', 2024, 'B', '2024-09-01'),
('R005', 'STU102', 'BU101', 'Autumn', 2024, 'A', '2024-09-03'),
('R006', 'STU103', 'CS102', 'Autumn', 2024, 'A', '2024-09-01'),
('R007', 'STU103', 'MA201', 'Autumn', 2024, 'B+', '2024-09-02'),
('R008', 'STU103', 'BU101', 'Autumn', 2024, 'A-', '2024-09-03'),
('R009', 'STU104', 'CS101', 'Spring', 2024, 'A', '2024-01-15'),
('R010', 'STU104', 'CS201', 'Autumn', 2024, 'B+', '2024-09-01'),
('R011', 'STU105', 'MA201', 'Autumn', 2024, 'A', '2024-09-02'),
('R012', 'STU105', 'MA301', 'Autumn', 2024, 'B', '2024-09-02'),
('R013', 'STU106', 'BU101', 'Autumn', 2024, 'A-', '2024-09-03'),
('R014', 'STU106', 'BU201', 'Autumn', 2024, 'B+', '2024-09-03'),
('R015', 'STU101', 'CS201', 'Spring', 2025, 'B', '2025-01-10');

SELECT * from Departments;
SELECT * from Instructors;
SELECT * from Courses;
SELECT * from Students_LW;
SELECT * from Registrations;