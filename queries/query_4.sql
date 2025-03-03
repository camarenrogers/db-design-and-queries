-- Fetch playlists created by a user

SELECT PlaylistID, Title, CreationDate, PrivacyStatus
FROM Playlist
-- Filter by user ID to show only their playlists
WHERE UserID = 101;
