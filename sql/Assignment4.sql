-- Table to store movie information
CREATE TABLE Movies (
    MovieID SERIAL PRIMARY KEY,          -- Unique ID for each movie
    Title VARCHAR(150) NOT NULL,          -- Movie title
    ReleaseYear INT,                     -- Year the movie was released
    Genre VARCHAR(50),                   -- Movie genre
    Rating NUMERIC(3,1)                  -- IMDb-style rating
);
-- Table to store actor information
CREATE TABLE Actors (
    ActorID SERIAL PRIMARY KEY,          -- Unique ID for each actor
    FirstName VARCHAR(50) NOT NULL,       -- Actor first name
    LastName VARCHAR(50) NOT NULL,        -- Actor last name
    BirthDate DATE                       -- Actor date of birth
);
-- Linking table to represent many-to-many relationship
-- between Movies and Actors
CREATE TABLE MovieActors (
    MovieID INT NOT NULL,
    ActorID INT NOT NULL,
    RoleName VARCHAR(100),               -- Character played by the actor

    -- Composite primary key ensures uniqueness
    PRIMARY KEY (MovieID, ActorID),

    -- Foreign key constraints
    CONSTRAINT fk_movie
        FOREIGN KEY (MovieID)
        REFERENCES Movies(MovieID)
        ON DELETE CASCADE,

    CONSTRAINT fk_actor
        FOREIGN KEY (ActorID)
        REFERENCES Actors(ActorID)
        ON DELETE CASCADE
);
INSERT INTO Movies (Title, ReleaseYear, Genre, Rating) VALUES
('Inception', 2010, 'Sci-Fi', 8.8),
('The Dark Knight', 2008, 'Action', 9.0),
('Interstellar', 2014, 'Sci-Fi', 8.6),
('Titanic', 1997, 'Romance', 7.9);
INSERT INTO Actors (FirstName, LastName, BirthDate) VALUES
('Leonardo', 'DiCaprio', '1974-11-11'),
('Christian', 'Bale', '1974-01-30'),
('Matthew', 'McConaughey', '1969-11-04'),
('Kate', 'Winslet', '1975-10-05'),
('Joseph', 'Gordon-Levitt', '1981-02-17');
INSERT INTO MovieActors (MovieID, ActorID, RoleName) VALUES
(1, 1, 'Dom Cobb'),              -- Inception - DiCaprio
(1, 5, 'Arthur'),                -- Inception - Gordon-Levitt
(2, 2, 'Bruce Wayne'),           -- The Dark Knight - Bale
(3, 3, 'Cooper'),                -- Interstellar - McConaughey
(4, 1, 'Jack Dawson'),           -- Titanic - DiCaprio
(4, 4, 'Rose DeWitt Bukater');   -- Titanic - Winslet
 

UPDATE Movies SET MovieID = 1 WHERE Title = 'Inception';
UPDATE Movies SET MovieID = 2 WHERE Title = 'The Dark Knight';
UPDATE Movies SET MovieID = 3 WHERE Title = 'Interstellar';
UPDATE Movies SET MovieID = 4 WHERE Title = 'Titanic';
UPDATE Movies SET MovieID = 5 WHERE Title = 'The Prestige';

-- ⚠️ Risky: Updating primary key values
UPDATE Actors SET ActorID = 1 WHERE LastName = 'DiCaprio';
UPDATE Actors SET ActorID = 2 WHERE LastName = 'Bale';
UPDATE Actors SET ActorID = 3 WHERE LastName = 'McConaughey';
UPDATE Actors SET ActorID = 4 WHERE LastName = 'Winslet';
UPDATE Actors SET ActorID = 5 WHERE LastName = 'Gordon-Levitt';


SELECT m.Title, a.FirstName, a.LastName, ma.RoleName
FROM Movies m
JOIN MovieActors ma ON m.MovieID = ma.MovieID
JOIN Actors a ON ma.ActorID = a.ActorID
ORDER BY m.Title;

SELECT a.FirstName, a.LastName, m.Title
FROM Actors a
JOIN MovieActors ma ON a.ActorID = ma.ActorID
JOIN Movies m ON ma.MovieID = m.MovieID
ORDER BY a.LastName;
--query to list all movies released after the year 2010
SELECT Title, ReleaseYear
FROM Movies 
WHERE ReleaseYear > 2010
ORDER BY ReleaseYear;

--a query to find all actors who have appeared in the movie 'Inception'.
SELECT a.FirstName, a.LastName
FROM Actors a
JOIN MovieActors ma ON a.ActorID = ma.ActorID
JOIN Movies m ON ma.MovieID = m.MovieID
WHERE m.Title = 'Inception';

select * from Movies;
select * from Actors;
select * from MovieActors;

--a query to find the top 10 actors who have appeared in the most movies
SELECT a.FirstName, a.LastName, COUNT(ma.MovieID) AS MovieCount
FROM Actors a  
JOIN MovieActors ma ON a.ActorID = ma.ActorID
GROUP BY a.ActorID
ORDER BY MovieCount DESC
LIMIT 10;

--a query to find the average number of actors per movie
SELECT AVG(ActorCount) AS AvgActorsPerMovie
FROM (
    SELECT COUNT(ma.ActorID) AS ActorCount
    FROM Movies m
    LEFT JOIN MovieActors ma ON m.MovieID = ma.MovieID
    GROUP BY m.MovieID
) AS MovieActorCounts;
--Create a view called MovieCast that lists the movie title and the full name of every actor in it.
CREATE VIEW MovieCast AS
SELECT m.Title AS MovieTitle,
         a.FirstName || ' ' || a.LastName AS ActorFullName  
FROM Movies m
JOIN MovieActors ma ON m.MovieID = ma.MovieID
JOIN Actors a ON ma.ActorID = a.ActorID
ORDER BY m.Title, a.LastName;

call MovieCast();
SELECT * FROM MovieCast;
