--#4
SELECT name, population
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada')
  AND population < (SELECT population FROM world WHERE name = 'Poland');

--#5
SELECT name, 
  CONCAT(ROUND(100 * population/(select population from world where name = 'Germany')), '%')
FROM world
WHERE continent = 'Europe';

--#6
SELECT name
FROM world
WHERE gdp > ALL(SELECT gdp FROM world WHERE continent = 'Europe' and gdp > 0);

--#7
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0);

--#8
SELECT continent, name
FROM world x
WHERE name <= ALL
  (SELECT name FROM world y
   WHERE y.continent = x.continent);

--#9
SELECT name, continent, population
FROM world x
where 25000000 >= ALL
  (SELECT population FROM world y
   WHERE x.continent = y.continent
   AND y.population > 0); 

--#10
SELECT name, continent
FROM world x
WHERE population > ALL
  (SELECT population * 3 FROM world y
   WHERE x.continent = y.continent
   AND x.name <> y.name
   AND y.population > 0);
