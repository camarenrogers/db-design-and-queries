-- Count how many songs a user has listened to per genre
-- display the number of songs a user has listened to per genre

SELECT g.Name AS Genre, COUNT(lh.SongID) AS SongCount
FROM ListeningHistory lh
-- Join with Song table to match songs to genres
JOIN Song s ON lh.SongID = s.SongID
-- Join with Genre table to get genre names
JOIN Genre g ON s.GenreID = g.GenreID
-- Filter by user ID to analyze their listening habits
WHERE lh.UserID = 101
GROUP BY g.Name  -- Group by genre
ORDER BY SongCount DESC;  -- Show the most listened-to genres first
