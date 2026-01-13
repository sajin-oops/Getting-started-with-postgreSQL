SELECT * FROM movies;

SELECT title,release_year 
FROM movies;

SELECT * FROM movies 
WHERE release_year > 1995;

SELECT title,director
FROM movies 
WHERE director = 'John Schlesinger';

SELECT title,director
FROM movies 
WHERE director = 'Peter Hyams';


SELECT director
FROM movies
WHERE director>2;