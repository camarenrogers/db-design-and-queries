# db-design-and-queries
Optimizing Data Flow and Operations: A 3NF Approach to Spotify's Database Design 

I aimed to design a logical model based on ER modeling to support a new feature for Spotify. The goal was to develop a relational database structure that could efficiently store and manage data related to users, songs, moods, and playlists while ensuring the model is normalized to Third Normal Form (3NF) for optimal data integrity and query performance. This relational database design for tracking listening habits and matching music with moods provides a comprehensive and organized structure for a music streaming platform. The entities and relationships are carefully modeled to ensure that data is efficiently stored and queried. 

The database is structured around several key entities that represent the core aspects of the platform’s functionality. These entities include Users, Songs, Artists, Albums, Genres, Moods, Playlists, and Listening History. Each of these entities is related to one another in various ways, and the relationships between them enable the tracking of users' listening behaviors and their emotional states. 

 

    Users: The central entity in this model is the Users table, which stores information about each user, such as their username. Each user is uniquely identified by a user_id. 

    Songs: The Songs table represents the songs available on the platform. Each song is uniquely identified by a song_id, and includes attributes like the song's title, the artist(s) who performed it, the album it belongs to, its release date, genre, and length. 

    Artists: The Artists table holds information about the artists performing the songs. It contains the artist's artist_id and their name, as well as country the artist is from and which genre the artist belongs to. 

    Albums: The Albums table captures information about the albums that the songs belong to. Each album is identified by an album_id and is associated with an artist through the artist_id. 

    Genres: Music is categorized into various genres, and the Genres table stores these classifications. The genre_id is a unique identifier for each genre, with the genre name stored as an attribute. 

    Moods: The Moods table allows users to associate specific moods with their listening habits. Each mood is uniquely identified by a mood_id and includes a mood name, such as "Happy," "Sad," or "Relaxed." This allows users to tailor their music listening experience based on their emotional state. 

    Listening History: The Listening_History table tracks the songs that users have listened to, including the date and time of listening. It also allows users to associate their listening habits with specific moods, as each record in the table can reference a mood_id. This is important for building recommendations and understanding listening patterns. 

    Playlist: Users can create and manage playlists, which are stored in the Playlist table. Each playlist has a unique playlist_id and is associated with a specific user. Playlists can contain multiple songs, and the relationship between playlists and songs is represented in the Playlist_Songs table. 

    Playlist_Songs: This is a junction table that captures the many-to-many relationship between playlists and songs. Each entry in the table associates a playlist_id with a song_id, allowing multiple songs to belong to a playlist and multiple playlists to contain the same song. 
