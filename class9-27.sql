USE movie_ratings;

SELECT movie_title      --Show all movie titles in DB
FROM movies;

SELECT movie_title, movie_rating    --Show all (anon) star ratings for each movie title
FROM movies
    NATURAL JOIN ratings;


SELECT movie_title, rating      --Same as above
FROM movies 
    INNER JOIN ratings
    USING(movie_id);

SELECT movie_title, rating      --Same as above
FROM movies 
    INNER JOIN ratings
    ON movies.movie_id = ratings.movie_id;      --on clause important if alias--


SELECT consumer_first_name, consumer_last_name, movie_title     --SHow all consumers, movie titles rated if any
FROM consumers
    LEFT OUTER JOIN ratings
    USING (consumer_id)
    LEFT OUTER JOIN movies
    USING (movie_id);   