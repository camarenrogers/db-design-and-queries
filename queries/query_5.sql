-- Get all songs in a specific playlist
-- Show all songs in a given playlist, including song title, artist, and genre

SELECT s.SongID, s.Title, a.Name AS Artist, g.Name AS Genre
FROM PlaylistSong ps
-- Join with Song table to get song details
JOIN Song s ON ps.SongID = s.SongID
-- Join with Artist table to get artist information
JOIN Artist a ON s.ArtistID = a.ArtistID
-- Join with Genre table to categorize songs
JOIN Genre g ON s.GenreID = g.GenreID
-- Filter by the specific playlist
WHERE ps.PlaylistID = 20;
