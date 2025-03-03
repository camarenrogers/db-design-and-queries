-- Recommend songs to a user based on their playlists
-- Suggest songs that match the genres and artists from the user's playlists

SELECT DISTINCT s.SongID, s.Title, a.Name AS Artist, g.Name AS Genre
FROM PlaylistSong ps
JOIN Song s ON ps.SongID = s.SongID
JOIN Artist a ON s.ArtistID = a.ArtistID
JOIN Genre g ON s.GenreID = g.GenreID
-- Find songs that belong to any playlist the user has created
WHERE ps.PlaylistID IN (SELECT PlaylistID FROM Playlist WHERE UserID = 101)
ORDER BY RAND()  -- Shuffle the recommendations
LIMIT 5;  -- Show 5 recommended songs
