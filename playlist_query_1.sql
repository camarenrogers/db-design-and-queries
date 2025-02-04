SELECT s.song_id, s.title, s.artist
FROM Songs s
JOIN Moods m ON u.user_id=?
WHERE m.mood='happy'
ORDER BY s.popularity DESC;