-- Retieve a User's Listening History with Mood
-- Show a user's listening history, including the song, artist, mood, and device used.

SELECT lh.ListenDateTime, s.Title AS Song, a.Name AS Artist, m.Name AS Mood, lh.Device
FROM ListeningHistory lh
-- Join with Song table to get song details
JOIN Song s ON lh.SongID = s.SongID
-- Join with Artist table to get artist details
JOIN Artist a ON s.ArtistID = a.ArtistID
-- Join with Mood table to see which mood the user was in when listening
JOIN Mood m ON lh.MoodID = m.MoodID
-- Filter by user ID to get their personal history
WHERE lh.UserID = 101
ORDER BY lh.ListenDateTime DESC;  -- Show latest listening history first
