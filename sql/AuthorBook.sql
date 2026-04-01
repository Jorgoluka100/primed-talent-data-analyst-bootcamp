-- 1. Create the Authors table
-- This must be created first because Books depends on it.
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100) NOT NULL
);

-- 2. Create the Books table
-- Includes a Foreign Key that links back to the Authors table.
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Optional: Sample data to test the relationships
INSERT INTO Authors (AuthorID, AuthorName) VALUES (1, 'J.K. Rowling');
INSERT INTO Authors (AuthorID, AuthorName) VALUES (2, 'George R.R. Martin');

INSERT INTO Books (BookID, Title, AuthorID) VALUES (101, 'Harry Potter', 1);
INSERT INTO Books (BookID, Title, AuthorID) VALUES (102, 'A Game of Thrones', 2);

SELECT * from Books;
select * from Authors;