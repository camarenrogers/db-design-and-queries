# db-design-and-queries
Optimizing Data Flow and Operations: A 3NF Approach to Spotify's Database Design 

Project Overview:

This project focuses on designing a relational database for Spotify using Entity-Relationship (ER) modeling, ensuring Third Normal Form (3NF) for efficient data management. The goal is to support a new feature that tracks user listening habits and links music to moods while maintaining data integrity and optimized query performance.

Database Design

The database is structured around key entities:

    Users  – Tracks user information and interactions.
    Songs  – Stores song details, including metadata.
    Artists & Albums  – Captures artist discography and relationships.
    Genres & Moods  – Classifies music styles and emotional contexts.
    Playlists  – Organizes user-curated song collections.
    Listening History  – Records user playback activity for insights.

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
Features & Benefits

✅ Normalized to 3NF – Eliminates redundancy, improves consistency.

✅ Efficient Querying – Optimized for fast and scalable data retrieval.

✅ Enhanced Music Discovery – Enables mood-based song recommendations.

The relational design is normalized to ensure data integrity and reduce redundancy. Normalization ensures that the database structure avoids anomalies during data insertion, update, or deletion. The design is normalized to 3NF, which entails: 

    1NF (First Normal Form): All attributes in the database are atomic, meaning that each value in a table column is indivisible. For example, the Users table stores user information in discrete columns, with no repeating groups of attributes. 

    2NF (Second Normal Form): The design eliminates partial dependencies, ensuring that all non-key attributes are fully functionally dependent on the primary key. For instance, the Songs table ensures that each song’s details, such as title, artist, and album, depend entirely on the song_id. 

    3NF (Third Normal Form): The design eliminates transitive dependencies, ensuring that non-key attributes depend only on the primary key and not on other non-key attributes. For example, the Moods table ensures that the mood name is directly dependent on the mood_id, with no indirect dependency through another attribute. 

Keys and Constraints 

To ensure the integrity and uniqueness of the data, the database design incorporates several keys and constraints: 

    Primary Keys (PK): Every table has a primary key (e.g., user_id, song_id, playlist_id) that uniquely identifies each record. These primary keys ensure that each record in a table is distinct. 

    Foreign Keys (FK): Foreign keys are used to establish relationships between tables. For instance, the user_id in the Listening_History table references the Users table, while the song_id in the Playlist_Songs table references the Songs table. These foreign key relationships ensure referential integrity, meaning that every foreign key value must correspond to an existing record in the referenced table. 

    Unique Constraints: Certain fields, such as username in the Users table, are required to be unique to avoid duplicates. 

## Tech Stack 
- **Database:** PostgreSQL  
- **Query Language:** SQL (Joins, Aggregations, Indexing)  
- **Data Visualization:** Matplotlib & Seaborn  
- **Tools:** Git, DBeaver, pgAdmin  
