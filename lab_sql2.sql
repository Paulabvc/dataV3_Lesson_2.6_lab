/* -- In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is 
Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. 
 Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
*/

SELECT last_name, COUNT(*)
FROM actor
GROUP BY last_name
HAVING COUNT(*)=1;

--  Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last 
-- name was present more than once
SELECT last_name, COUNT(*)
FROM actor
GROUP BY last_name
HAVING COUNT(*)>1;

-- Using the rental table, find out how many rentals were processed by each employee.
SELECT rental_id, COUNT(*) FROM rental
GROUP BY staff_id;


-- Using the film table, find out how many films were released each year.
SELECT release_year, COUNT(*) FROM film 
GROUP BY release_year;

-- Using the film table, find out for each rating how many films were there.
SELECT * FROM sakila.film;
SELECT  rating, COUNT(film_id) as n_movies_by_rating FROM sakila.film 
GROUP BY rating;

-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places

SELECT * FROM sakila.film;
SELECT  rating, round(AVG (length),2) as avg_movie FROM sakila.film 
GROUP BY rating;

-- Which kind of movies (rating) have a mean duration of more than two hours?  -- Not sure why is not showing PG where avg is more than 120 minutes
-- I donpt know why it is showing null but having pg13 with 120.44
SELECT  rating, round(AVG (length),2) as avg_movie FROM sakila.film 
WHERE 'avg_movie'>120
GROUP BY rating;

-- Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
SELECT  title,length,rating, row_number() OVER (
ORDER BY length DESC ) ranking
FROM sakila.film;



