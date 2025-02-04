SELECT s.title, s.artist, l.listen_date
FROM Listening_History l
JOIN Songs s ON l.song_id = s.song_id
JOIN Moods m ON l.mood_id = m.mood_id
WHERE l.user_id = ? AND m.mood_name = ?