CREATE TABLE User ( 
    UserID INT PRIMARY KEY, 
    Name VARCHAR(255) NOT NULL, 
    Email VARCHAR(255) UNIQUE NOT NULL, 
    SubscriptionID INT, 
    Country VARCHAR(100), 
    DateOfBirth DATE, 
    AccountStatus ENUM('Active', 'Inactive') DEFAULT 'Active', 
    FOREIGN KEY (SubscriptionID) REFERENCES Subscription(SubscriptionID) 
        ON DELETE SET NULL 
        ON UPDATE CASCADE 
); 
CREATE TABLE Artist ( 
    ArtistID INT PRIMARY KEY, 
    Name VARCHAR(255) NOT NULL, 
    GenreID INT, 
    Country VARCHAR(100), 
    VerifiedStatus BOOLEAN DEFAULT FALSE, 
    FOREIGN KEY (GenreID) REFERENCES Genre(GenreID) 
        ON DELETE SET NULL 
        ON UPDATE CASCADE 
); 
CREATE TABLE Genre ( 
    GenreID INT PRIMARY KEY, 
    GenreName VARCHAR(100) UNIQUE NOT NULL 
); 
CREATE TABLE Content ( 
    ContentID INT PRIMARY KEY, 
    Title VARCHAR(255) NOT NULL, 
    ContentType ENUM('Song', 'Podcast', 'Album') NOT NULL, 
    ReleaseDate DATE, 
    Duration TIME, 
    Language VARCHAR(50), 
    Metadata JSON, 
    ArtistID INT, 
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID) 
        ON DELETE SET NULL 
        ON UPDATE CASCADE 
); 
CREATE TABLE Playlist ( 
    PlaylistID INT PRIMARY KEY, 
    Name VARCHAR(255) NOT NULL, 
    CreatorType ENUM('User', 'Curator', 'Algorithm') NOT NULL, 
    CreationDate DATE DEFAULT CURRENT_DATE, 
    UserID INT, 
    FOREIGN KEY (UserID) REFERENCES User(UserID) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE 
); 
CREATE TABLE Playlist_Content ( 
    PlaylistID INT, 
    ContentID INT, 
    PRIMARY KEY (PlaylistID, ContentID), 
    FOREIGN KEY (PlaylistID) REFERENCES Playlist(PlaylistID) 
        ON DELETE CASCADE, 
    FOREIGN KEY (ContentID) REFERENCES Content(ContentID) 
        ON DELETE CASCADE 
); 
CREATE TABLE Advertiser ( 
    AdvertiserID INT PRIMARY KEY, 
    CompanyName VARCHAR(255) NOT NULL UNIQUE, 
    Budget DECIMAL(10, 2) NOT NULL 
); 
CREATE TABLE Advertisement ( 
    AdID INT PRIMARY KEY, 
    ContentType ENUM('Audio', 'Video') NOT NULL, 
    StartDate DATE NOT NULL, 
    EndDate DATE NOT NULL, 
    Impressions INT DEFAULT 0, 
    EngagementMetrics JSON, 
    AdvertiserID INT, 
    TargetAudience JSON, 
    FOREIGN KEY (AdvertiserID) REFERENCES Advertiser(AdvertiserID) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE 
); 
CREATE TABLE User_Content ( 
    UserID INT, 
    ContentID INT, 
    InteractionType ENUM('Stream', 'Like', 'Share') NOT NULL, 
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    PRIMARY KEY (UserID, ContentID, InteractionType), 
    FOREIGN KEY (UserID) REFERENCES User(UserID) 
        ON DELETE CASCADE, 
    FOREIGN KEY (ContentID) REFERENCES Content(ContentID) 
        ON DELETE CASCADE 
); 
CREATE TABLE Subscription ( 
    SubscriptionID INT PRIMARY KEY, 
    Type ENUM('Free', 'Premium', 'Family') NOT NULL, 
    MonthlyFee DECIMAL(10, 2), 
    RenewalDate DATE NOT NULL 
); 
CREATE TABLE SystemLog ( 
    LogID INT PRIMARY KEY, 
    EventType ENUM('Error', 'Update', 'UserAction') NOT NULL, 
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    UserID INT, 
    ContentID INT, 
    FOREIGN KEY (UserID) REFERENCES User(UserID) 
        ON DELETE SET NULL, 
    FOREIGN KEY (ContentID) REFERENCES Content(ContentID) 
        ON DELETE SET NULL 
); 
