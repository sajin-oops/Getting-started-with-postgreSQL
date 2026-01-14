SELECT * FROM genres;
SELECT * FROM movie_genres;
SELECT * FROM movies;
SELECT * FROM ratings;


--LIKE 
SELECT * FROM movies;

SELECT * FROM movies 
WHERE title LIKE 'Toy Story';

SELECT * FROM movies
WHERE director LIKE 'John Lasseter';

SELECT * FROM movies
WHERE director LIKE 'S%';

SELECT * FROM movies
WHERE director LIKE 'Peter Hewitt';
