-- CREATE TABLE Posts(
--     PostID INT PRIMARY KEY,
--     Title TEXT,
--     Content TEXT,
--     PublishDate DATE
-- );

-- CREATE TABLE Comments(
--     CommentID INT PRIMARY KEY,
--     PostID INT,
--     AuthorName TEXT,
--     CommentText TEXT,
--     FOREIGN KEY(PostID) REFERENCES Posts(PostID)
-- );

INSERT INTO Posts VALUES (1, 'BlackBeauty', 'Storybook', 10-01-2025);
select * from Posts;