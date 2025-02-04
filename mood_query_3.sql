SELECT u.username
FROM Users u
JOIN User_Mood_Preference ump ON u.user_id = ump.user_id
JOIN Moods m ON ump.mood_id = mmood_id
