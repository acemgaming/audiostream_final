DROP TABLE TAGS;

DROP TABLE LIKED;

DROP TABLE DISLIKED;

DROP TABLE ACCOUNTS;

DROP TABLE SONGS;

DROP TABLE ALBUMS;

DROP TABLE GENRES;

DROP TABLE ARTISTS;

CREATE TABLE ARTISTS
(
	artistID INT AUTO_INCREMENT NOT NULL,
	artist VARCHAR(64),
	PRIMARY KEY(artistID)
);

CREATE TABLE ALBUMS
(
	albumID INT AUTO_INCREMENT NOT NULL,
	artistID INT,
	album VARCHAR(255),
	PRIMARY KEY(albumID),
	FOREIGN KEY(artistID) REFERENCES ARTISTS(artistID) ON DELETE CASCADE
);

CREATE TABLE GENRES
(
	genreID INT AUTO_INCREMENT NOT NULL,
	genre VARCHAR(64),
	PRIMARY KEY(genreID)
);

CREATE TABLE SONGS
(
	songID INT AUTO_INCREMENT NOT NULL,
	fileLocation VARCHAR(255),
	title VARCHAR(255) NOT NULL,
	albumID INT,
	year INT,
	genreID INT,
	duration INT,
	bpm DOUBLE,
	loudness DOUBLE,
	songKey VARCHAR(10),
	scale VARCHAR(20),
	chordsKey VARCHAR(10),
	chordsScale VARCHAR(20),
	chordsChangesRate DOUBLE,
	chordsNumberRate DOUBLE,
	danceability DOUBLE,
	bassiness DOUBLE,
	dynamicComplexity DOUBLE,
	zeroCrossingRate DOUBLE,
	intensity INT,
	PRIMARY KEY(songID),
	FOREIGN KEY(albumID) REFERENCES ALBUMS(albumID) ON DELETE CASCADE,
	FOREIGN KEY(genreID) REFERENCES GENRES(genreID) ON DELETE CASCADE
);

CREATE TABLE ACCOUNTS
(
	username VARCHAR(64) NOT NULL,
	password VARCHAR(64) NOT NULL,
	PRIMARY KEY(username)
);

CREATE TABLE LIKED
(
	songID INT NOT NULL,
	username VARCHAR(64) NOT NULL,
	CONSTRAINT LIKEDID PRIMARY KEY(songID, username),
	FOREIGN KEY(songID) REFERENCES SONGS(songID) ON DELETE CASCADE,
	FOREIGN KEY(username) REFERENCES ACCOUNTS(username) ON DELETE CASCADE
);

CREATE TABLE DISLIKED
(
	songID INT NOT NULL,
	username VARCHAR(64) NOT NULL,
	CONSTRAINT DISLIKEDID PRIMARY KEY(songID, username),
	FOREIGN KEY(songID) REFERENCES SONGS(songID) ON DELETE CASCADE,
	FOREIGN KEY(username) REFERENCES ACCOUNTS(username) ON DELETE CASCADE
);

CREATE TABLE TAGS
(
	tagID INT AUTO_INCREMENT NOT NULL,
	SONGID INT NOT NULL,
	username VARCHAR(64) NOT NULL,
	tag VARCHAR(64),
	PRIMARY KEY(tagID),
	FOREIGN KEY(songID) REFERENCES SONGS(songID) ON DELETE CASCADE,
	FOREIGN KEY(username) REFERENCES ACCOUNTS(username) ON DELETE CASCADE
);