--#11
-- Which were the busiest years for 'John Travolta', show the year and the number 
-- of movies he made each year for any year in which he made more than 2 movies.
SELECT yr,COUNT(title) 
FROM movie 
  JOIN casting ON movie.id=movieid
  JOIN actor   ON actorid=actor.id
where name='John Travolta'
GROUP BY yr
HAVING COUNT(title) > 2;

--#12
-- List the film title and the leading actor for all of the films 'Julie Andrews' played in.

-- Did you get "Little Miss Marker twice"?
-- Julie Andrews starred in the 1980 remake of Little Miss Marker and not the original(1934).

-- Title is not a unique field, create a table of IDs in your subquery
SELECT title, name
FROM movie JOIN casting ON id = movieid
JOIN actor ON actorid = actor.id
WHERE movieid IN (
  SELECT movie.id 
  FROM movie JOIN casting ON movie.id = movieid
  JOIN actor ON actorid = actor.id
  WHERE name='Julie Andrews')
AND ord = 1;

--#13
-- Obtain a list, in alphabetical order, of actors who've had at least 30 starring roles.
SELECT name
FROM actor JOIN casting ON actor.id = actorid
WHERE ord = 1
GROUP BY name
HAVING count(name) >= 30
ORDER BY name;

--#14
-- List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT title, COUNT(title) n_actors
FROM movie JOIN casting ON (movie.id = movieid AND yr = 1978)
GROUP BY title
ORDER BY n_actors DESC, title;

--#15
-- List all the people who have worked with 'Art Garfunkel'.
SELECT name
FROM actor JOIN casting ON actor.id = actorid
WHERE movieid IN
  (SELECT movie.id
   FROM movie JOIN casting ON movie.id = movieid
                         JOIN actor ON (actorid = actor.id AND name = 'Art Garfunkel'))
AND name <> 'Art Garfunkel';





