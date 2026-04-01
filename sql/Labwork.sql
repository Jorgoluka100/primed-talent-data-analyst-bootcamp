-- Create a table to store artist information
CREATE TABLE Artists (
    artist_id INTEGER PRIMARY KEY,   -- Unique identifier for each artist
    artist_name TEXT NOT NULL         -- Name of the artist
);
 
-- Create a table to store music genres
CREATE TABLE Genres (
    genre_id INTEGER PRIMARY KEY,     -- Unique identifier for each genre
    genre_name TEXT NOT NULL           -- Name of the genre (Rock, Pop, Jazz, etc.)
);
 
-- Create a table to store albums
CREATE TABLE Albums (
    album_id INTEGER PRIMARY KEY,     -- Unique identifier for each album
    album_title TEXT NOT NULL,         -- Name of the album
    artist_id INTEGER,                 -- Artist who created the album
    release_year INTEGER,              -- Year the album was released
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);
 
-- Create a table to store individual songs
CREATE TABLE Songs (
    song_id INTEGER PRIMARY KEY,       -- Unique identifier for each song
    song_title TEXT NOT NULL,           -- Name of the song
    duration_seconds INTEGER,           -- Length of the song in seconds
    album_id INTEGER,                   -- Album the song belongs to
    genre_id INTEGER,                   -- Genre of the song
    FOREIGN KEY (album_id) REFERENCES Albums(album_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);
 
INSERT INTO Artists (artist_name) VALUES
('Coldplay'),
('Imagine Dragons'),
('Adele');
 
INSERT INTO Genres (genre_name) VALUES
('Rock'),
('Pop'),
('Alternative');
 
INSERT INTO Albums (album_title, artist_id, release_year) VALUES
('Parachutes', 1, 2000),
('Evolve', 2, 2017),
('25', 3, 2015);
 
INSERT INTO Songs (song_title, duration_seconds, album_id, genre_id) VALUES
('Yellow', 270, 1, 1),
('Clocks', 307, 1, 3),
('Believer', 204, 2, 1),
('Thunder', 187, 2, 3),
('Hello', 295, 3, 2),
('Send My Love', 223, 3, 2);

select * from Songs;
select * from Albums;
select * from Genres;
select * from Artists;

SELECT artist_name FROM Artists;
SELECT COUNT(*) AS total_artists FROM Artists;
SELECT genre_name FROM Genres;
-- Count the number of songs in each genre
SELECT
    g.genre_name,
    COUNT(s.song_id) AS total_songs
FROM Genres g
LEFT JOIN Songs s
    ON g.genre_id = s.genre_id
GROUP BY g.genre_name
ORDER BY total_songs DESC;
-- List all albums along with their corresponding artist names
SELECT
    al.album_title,
    ar.artist_name
FROM Albums al
JOIN Artists ar
    ON al.artist_id = ar.artist_id
ORDER BY ar.artist_name, al.album_title;

-- Create a table to store artist information
CREATE TABLE Artists (
    artist_id INTEGER PRIMARY KEY,   -- Unique identifier for each artist
    artist_name TEXT NOT NULL         -- Name of the artist
);
 
-- Create a table to store music genres
CREATE TABLE Genres (
    genre_id INTEGER PRIMARY KEY,     -- Unique identifier for each genre
    genre_name TEXT NOT NULL           -- Name of the genre (Rock, Pop, Jazz, etc.)
);
 
-- Create a table to store albums
CREATE TABLE Albums (
    album_id INTEGER PRIMARY KEY,     -- Unique identifier for each album
    album_title TEXT NOT NULL,         -- Name of the album
    artist_id INTEGER,                 -- Artist who created the album
    release_year INTEGER,              -- Year the album was released
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);
 
-- Create a table to store individual songs
CREATE TABLE Songs (
    song_id INTEGER PRIMARY KEY,       -- Unique identifier for each song
    song_title TEXT NOT NULL,           -- Name of the song
    duration_seconds INTEGER,           -- Length of the song in seconds
    album_id INTEGER,                   -- Album the song belongs to
    genre_id INTEGER,                   -- Genre of the song
    FOREIGN KEY (album_id) REFERENCES Albums(album_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);
 
INSERT INTO Artists (artist_name) VALUES
('Coldplay'),
('Imagine Dragons'),
('Adele');
 
INSERT INTO Genres (genre_name) VALUES
('Rock'),
('Pop'),
('Alternative');
 
INSERT INTO Albums (album_title, artist_id, release_year) VALUES
('Parachutes', 1, 2000),
('Evolve', 2, 2017),
('25', 3, 2015);
 
INSERT INTO Songs (song_title, duration_seconds, album_id, genre_id) VALUES
('Yellow', 270, 1, 1),
('Clocks', 307, 1, 3),
('Believer', 204, 2, 1),
('Thunder', 187, 2, 3),
('Hello', 295, 3, 2),
('Send My Love', 223, 3, 2);
 
--names of all artists
SELECT artist_name FROM Artists;
 
--titles of all albums released after 2010 with comments for each line
SELECT album_title FROM Albums WHERE release_year > 2010;
 
--how  many artists are in the database
SELECT COUNT(*) AS artist_count FROM Artists;
 
--retrieve all genres available in the database
SELECT genre_name FROM Genres;
 
-- Join Songs with Genres to group songs by genre
SELECT g.genre_name, COUNT(s.song_id) AS song_count
FROM Songs s
JOIN Genres g ON s.genre_id = g.genre_id
GROUP BY g.genre_name;    
 
-- Convert duration from seconds to minutes
SELECT song_title, duration_seconds / 60.0 AS duration_minutes
FROM Songs;
 
-- Find the longest song in the database
SELECT song_title, duration_seconds AS duration_seconds
FROM Songs
ORDER BY duration_seconds DESC
LIMIT 1;    
 
-- List all albums along with their respective artist names
SELECT a.album_title, ar.artist_name
FROM Albums a
JOIN Artists ar ON a.artist_id = ar.artist_id
ORDER BY ar.artist_name;
 
-- Find the average duration of songs in each genre
SELECT g.genre_name, AVG(s.duration_seconds) AS average_duration
FROM Songs s
JOIN Genres g ON s.genre_id = g.genre_id
GROUP BY g.genre_name;
 
