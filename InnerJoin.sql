SELECT * FROM movies;

SELECT * FROM ratings;

SELECT * FROM movie_genres;

SELECT * FROM genres;


SELECT 
movies.title,
movies.release_year,
ratings.rating
FROM movies
INNER JOIN ratings
ON movies.movie_id = ratings.movie_id;