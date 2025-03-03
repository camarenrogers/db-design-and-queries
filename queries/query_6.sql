-- Find the most popular mood based on Listening data
-- Identify the most common mood based on user listening history

SELECT m.Name AS Mood, COUNT(*) AS MoodCount
FROM ListeningHistory lh
-- Join with Mood table to get mood names
JOIN Mood m ON lh.MoodID = m.MoodID
GROUP BY m.Name  -- Group by mood name
ORDER BY MoodCount DESC  -- Sort by most frequently listened mood
LIMIT 1;  -- Get only the most popular mood
