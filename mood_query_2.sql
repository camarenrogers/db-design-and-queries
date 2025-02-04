SELECT s.title, s.artist
FROM Playlist_Songs ps
JOIN Songs s ON ps.song_id = s.song_id
WHERE ps.playlist_id = ?;