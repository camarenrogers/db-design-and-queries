-- Suggest songs based on user's listening mood
-- Recommend songs based on the user's most frequent listening moods

SELECT DISTINCT s.SongID, s.Title, a.Name AS Artist, m.Name AS Mood
FROM Song s
-- Join with SongMood to match songs with moods
JOIN SongMood sm ON s.SongID = sm.SongID
JOIN Mood m ON sm.MoodID = m.MoodID
-- Join with ListeningHistory to find songs that match moods the user often listens to
JOIN ListeningHistory lh ON lh.MoodID = m.MoodID
JOIN Artist a ON s.ArtistID = a.ArtistID
-- Filter by user ID to personalize recommendations
WHERE lh.UserID = 101
ORDER BY RAND()  -- Randomize the results for variety
LIMIT 10;  -- Limit recommendations to 10 songs
