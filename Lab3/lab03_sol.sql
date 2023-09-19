/*
    Lab 03
    CSC 362 Database Systems
    Mia Tomillo
    Using previous labs & lab prompt as reference

*/

--Dropping if previous database exists
DROP DATABASE IF EXISTS movie_ratings;

--Creating new database
CREATE DATABASE movie_ratings;
--Selecting the database to use
USE movie_ratings;

--Table for movies and their info
CREATE TABLE Movies (
    PRIMARY KEY (MovieID),
    MovieID     INT AUTO_INCREMENT,
    MovieTitle  VARCHAR(50),
    ReleaseDate VARCHAR(50),
    Genre       VARCHAR(50)
);

--Table to hold information about consumers
CREATE TABLE Consumers (
    PRIMARY KEY             (ConsumerID),
    ConsumerID              INT AUTO_INCREMENT,
    consumer_FirstName      VARCHAR(50),
    consumer_LastName       VARCHAR(50),
    ConsumerAddress         VARCHAR(50),
    ConsumerCity            VARCHAR(50),
    ConsumerState           VARCHAR(50),
    ZIPCode                 INT
);

--Table to hold information on ratings
CREATE TABLE Ratings (
    MovieID     INT,
    ConsumerID  INT,
    WhenRated   VARCHAR(50),
    NumberStars INT
);
--Inserting into movie table
INSERT INTO Movies (MovieTitle, ReleaseDate, Genre)
VALUES  ('The Hunt for Red October',        '1990-03-02',  'Action, Adventure, Thriller'),
        ('Lady Bird',                       '2017-12-01',  'Comedy, Drama'),
        ('Inception',                       '2010-08-16',  'Action, Adventure, Science, Fiction'),
        ('Monty Python and the Holy Grail', '1975-04-03',   'Comedy');
--Inserting into consumer table
INSERT INTO Consumers (consumer_FirstName, consumer_LastName, ConsumerAddress, ConsumerCity, ConsumerState, ZIPCode)
VALUES  ('Toru',    'Okada',    '800 Glenridge Ave',    'Hobart',       'IN', '46343'),
        ('Kumiko',  'Okada',    '864 NW Bohemia St',    'Vincentown',   'NJ', '08088'),
        ('Noboru',  'Wataya',   '342 Joy Ridge St',     'Hermitage',    'TN', '37076'),
        ('May',     'Kasahara', '5 Kent Rd',            'East Haven',   'CT', '06512');
--Insert into rating table
INSERT INTO Ratings (MovieID, ConsumerID, WhenRated, NumberStars)
VALUES  ('1', '1', '2010-09-02 10:54:19', '4'),
        ('1', '3', '2012-08-05 15:00:01', '3'),
        ('1', '4', '2016-10-02 23:58:12', '1'),
        ('2', '3', '2017-03-27 00:12:48', '2'),
        ('2', '4', '2018-08-02 00:54:42', '4');
--Showing the table creation
SHOW CREATE TABLE Movies;
SHOW CREATE TABLE Consumers;
SHOW CREATE TABLE Ratings;
--View Tables
SELECT * FROM Movies;
SELECT * FROM Consumers;
SELECT * FROM Ratings;

--Natural Join for final table
  /* Generate a report */
    SELECT consumer_FirstName, consumer_LastName, MovieTitle, NumberStars
      FROM Movies
           NATURAL JOIN Ratings
           NATURAL JOIN Consumers;

/* The major deisgn flaw after the inital implementation is the fact that the leading 0's
    do not show up in the zipcodes for our Consumer address. This is because this field was 
    initialized as an integer. I had to change this to VARCHAR(50) for the zipcodes to 
    appear in their full form. In addition, I needed to add the genres to the final table. 
    Because in the orginial input the genres were emtered in as multiple values in a field, 
    they needed to be seperated. I created a seperate table to give an ID to each genre, 
    then another one to assign genres to movies.  */

--REDESIGNED TABLES--
--Comments are the same as above, unless where I add new comments to the new additions
DROP DATABASE IF EXISTS movie_ratings;

CREATE DATABASE movie_ratings;

USE movie_ratings;

CREATE TABLE Movies (
    PRIMARY KEY (MovieID),
    MovieID     INT AUTO_INCREMENT,
    MovieTitle  VARCHAR(50),
    ReleaseDate VARCHAR(50),
    Genre       VARCHAR(50)
);

CREATE TABLE Consumers (
    PRIMARY KEY             (ConsumerID),
    ConsumerID              INT AUTO_INCREMENT,
    consumer_FirstName      VARCHAR(50),
    consumer_LastName       VARCHAR(50),
    ConsumerAddress         VARCHAR(50),
    ConsumerCity            VARCHAR(50),
    ConsumerState           VARCHAR(50),
    ZIPCode                 VARCHAR(50) --Varchar(50) to show 0's--
);

CREATE TABLE Ratings (
    MovieID     INT,
    ConsumerID  INT,
    WhenRated   VARCHAR(50),
    NumberStars INT
);
--Assign each Genre a value
CREATE TABLE GenreID (
    PRIMARY KEY (GenreID),
    GenreID     INT AUTO_INCREMENT,
    Genre       VARCHAR(50)
);
--Assign genres to movies
CREATE TABLE Genre (
    GenreID     INT,
    MovieID     INT
);


INSERT INTO Movies (MovieTitle, ReleaseDate, Genre)
VALUES  ('The Hunt for Red October',        '1990-03-02',  'Action, Adventure, Thriller'),
        ('Lady Bird',                       '2017-12-01',  'Comedy, Drama'),
        ('Inception',                       '2010-08-16',  'Action, Adventure, Science, Fiction'),
        ('Monty Python and the Holy Grail', '1975-04-03',   'Comedy');

INSERT INTO Consumers (consumer_FirstName, consumer_LastName, ConsumerAddress, ConsumerCity, ConsumerState, ZIPCode)
VALUES  ('Toru',    'Okada',    '800 Glenridge Ave',    'Hobart',       'IN', '46343'),
        ('Kumiko',  'Okada',    '864 NW Bohemia St',    'Vincentown',   'NJ', '08088'),
        ('Noboru',  'Wataya',   '342 Joy Ridge St',     'Hermitage',    'TN', '37076'),
        ('May',     'Kasahara', '5 Kent Rd',            'East Haven',   'CT', '06512');

INSERT INTO Ratings (MovieID, ConsumerID, WhenRated, NumberStars)
VALUES  ('1', '1', '2010-09-02 10:54:19', '4'),
        ('1', '3', '2012-08-05 15:00:01', '3'),
        ('1', '4', '2016-10-02 23:58:12', '1'),
        ('2', '3', '2017-03-27 00:12:48', '2'),
        ('2', '4', '2018-08-02 00:54:42', '4');
    
INSERT INTO GenreID (GenreID, Genre)
VALUES  ('1', 'Action'),
        ('2', 'Adventure'),
        ('3','Thriller'),
        ('4','Comedy'),
        ('5','Drama'),
        ('6','Science'),
        ('7','Fiction');
--Assign the genres
INSERT INTO Genre (MovieID, GenreID)
VALUES  ('1','1'),
        ('1','2'),
        ('2','3'),
        ('2','4'),
        ('3','1'),
        ('3','2'),
        ('3','6'),
        ('3','7'),
        ('4','4');

SHOW CREATE TABLE Movies;
SHOW CREATE TABLE Consumers;
SHOW CREATE TABLE Ratings;
SHOW CREATE TABLE Genre;

SELECT * FROM Movies;
SELECT * FROM Consumers;
SELECT * FROM Ratings;
SELECT * FROM GenreID;

  /* Generate a report */
    SELECT consumer_FirstName, consumer_LastName, MovieTitle, NumberStars,Genre
      FROM Movies
           NATURAL JOIN Ratings
           NATURAL JOIN Genre
           NATURAL JOIN Consumers;
