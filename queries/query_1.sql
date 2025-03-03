-- Get songs by a specific mood
-- Retrieve all songs that match a givem mood (e.g., "Chill)
SELECT s.SongID, s.Title, a.Name AS Artist, g.Name AS Genre
FROM Song s
-- Join with the Artist table to get artist details
JOIN Artist a ON s.ArtistID = a.ArtistID
-- Join with the Genre table to get genre details
JOIN Genre g ON s.GenreID = g.GenreID
-- Join with the SongMood table to filter by mood
JOIN SongMood sm ON s.SongID = sm.SongID
JOIN Mood m ON sm.MoodID = m.MoodID
-- Filter songs that match the desired mood
WHERE m.Name = 'Chill';

