CREATE TABLE Professor (
    ProfessorID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Department VARCHAR(100) NOT NULL
);
CREATE TABLE Student_1 (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Program VARCHAR(100) NOT NULL
);
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT NOT NULL,
    Schedule VARCHAR(50) NOT NULL,
    ProfessorID INT NOT NULL,
    CONSTRAINT fk_course_professor
        FOREIGN KEY (ProfessorID)
        REFERENCES Professor(ProfessorID)
        ON DELETE RESTRICT
);
CREATE TABLE Registration (
    RegistrationID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    Semester VARCHAR(20) NOT NULL,
    RegistrationDate DATE NOT NULL,
    CONSTRAINT fk_registration_student
        FOREIGN KEY (StudentID)
        REFERENCES Student(StudentID)
        ON DELETE CASCADE,
    CONSTRAINT fk_registration_course
        FOREIGN KEY (CourseID)
        REFERENCES Course(CourseID)
        ON DELETE CASCADE,
    CONSTRAINT uq_student_course
        UNIQUE (StudentID, CourseID, Semester)
);


INSERT INTO Professor (ProfessorID, Name, Email, Department) VALUES
(1, 'Dr. Alice Smith', 'alice.smith@university.edu', 'Computer Science'),
(2, 'Dr. John Brown', 'john.brown@university.edu', 'Information Systems');

INSERT INTO Student_1 (StudentID, Name, Email, Program) VALUES
(101, 'Emma Johnson', 'emma.johnson@student.edu', 'BSc Computer Science'),
(102, 'Liam Williams', 'liam.williams@student.edu', 'BSc Information Technology');
INSERT INTO Course (CourseID, CourseName, Credits, Schedule, ProfessorID) VALUES
(1001, 'Database Systems', 3, 'Mon 10:00–12:00', 1),
(1002, 'Software Engineering', 4, 'Wed 14:00–17:00', 2);
INSERT INTO Registration (RegistrationID, StudentID, CourseID, Semester, RegistrationDate) VALUES
(5001, 101, 1001, 'Fall 2025', '2025-08-20'),
(5002, 101, 1002, 'Fall 2025', '2025-08-21'),
(5003, 102, 1001, 'Fall 2025', '2025-08-22');

select * from Professor;
select * from Student_1;
select * from Course;
select * from Registration;


