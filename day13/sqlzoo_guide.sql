-- SELECT
-- ************************************************
SELECT population FROM world
  WHERE name = 'Germany'

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark')

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

SELECT name, population FROM world
  WHERE name LIKE "Al%"

SELECT name FROM world
 WHERE name LIKE '%a' OR name LIKE '%l'

SELECT name,length(name)
FROM world
WHERE length(name)=5 and region='Europe'

SELECT name, area*2 FROM world WHERE population = 64000

SELECT name, area, population
  FROM world
 WHERE area > 50000 AND population < 10000000

SELECT name, population/area
  FROM world
 WHERE name IN ('China', 'Nigeria', 'France', 'Australia')

SELECT name, continent, population FROM world

SELECT name FROM world
WHERE population >=200000000

SELECT name, GDP/population FROM world
WHERE population >=200000000

SELECT name, population/1000000 FROM world
WHERE continent = 'South America'

SELECT name, population FROM world
WHERE name IN ('France', 'Germany', 'Italy')

SELECT name FROM world
WHERE name LIKE 'United%'

SELECT name, population, area FROM world
WHERE area>3000000 OR population>250000000

SELECT name, population, area FROM world
WHERE area>3000000 XOR population>250000000

SELECT name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2) FROM world
WHERE continent = 'South America'

SELECT name, ROUND(GDP/population,-3) FROM world
WHERE gdp>=1000000000000

SELECT name, capital 
 FROM world
 WHERE LENGTH(name)=LENGTH(capital)

SELECT name, capital
FROM world
WHERE  LEFT(name,1) = LEFT(capital,1) AND name <> capital

SELECT name
  FROM world
WHERE 	 name LIKE '%A%'
  AND    name LIKE '%E%'
  AND    name LIKE '%I%'
  AND    name LIKE '%O%'
  AND    name LIKE '%U%'
  AND    name NOT LIKE '% %'

SELECT name
  FROM world
 WHERE name LIKE 'U%'

 SELECT population
  FROM world
 WHERE name = 'United Kingdom'

 SELECT yr, subject, winner
  FROM nobel
 WHERE yr =1950

 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

 SELECT yr, subject
  FROM nobel
 WHERE winner = 'Albert Einstein'

 SELECT winner
  FROM nobel
 WHERE subject = 'Peace' and yr >=2000

 SELECT yr, subject, winner
  FROM nobel
 WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989

 SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

 SELECT winner FROM nobel
 WHERE winner LIKE  'John %'

 SELECT * FROM nobel
 WHERE (yr =1980 AND subject = 'Physics') OR (yr=1984 AND subject = 'Chemistry')

 SELECT * FROM nobel
WHERE yr=1980 AND subject<>'Chemistry' AND subject <>'Medicine'

SELECT * FROM nobel
WHERE (subject='Medicine' AND yr<1910) OR (subject='Literature' AND yr>=2004)

SELECT * FROM nobel
WHERE winner = 'PETER GRÜNBERG'

SELECT * FROM nobel
WHERE winner = 'EUGENE O''NEILL'

SELECT winner, yr, subject FROM nobel
WHERE winner LIKE 'SIr%' ORDER BY yr DESC, winner ASC

SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry') ASC, subject ASC, winner ASC

 SELECT winner FROM nobel
 WHERE winner LIKE 'C%' AND winner LIKE '%n'

 SELECT COUNT(subject) FROM nobel
 WHERE subject = 'Chemistry'
   AND yr BETWEEN 1950 and 1960

#Useful Pick the code that shows the amount of years where no Medicine awards were given
SELECT COUNT(DISTINCT yr) FROM nobel
 WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')

#Useful Select the code which would show the year when neither a Physics or Chemistry award was given
SELECT yr FROM nobel
 WHERE yr NOT IN(SELECT yr 
                   FROM nobel
                 WHERE subject IN ('Chemistry','Physics'))

#Useful Select the code which shows the years when a Medicine award was given but no Peace or Literature award was
SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')

 SELECT subject, COUNT(subject) 
   FROM nobel 
  WHERE yr ='1960' 
  GROUP BY subject

  SELECT name FROM world WHERE continent = 
(SELECT continent 
FROM world WHERE name = 'Brazil')

SELECT name, continent FROM world
WHERE continent IN
  (SELECT continent 
     FROM world WHERE name='Brazil'
                   OR name='Mexico')
-- Show the population of China as a multiple of the population of the United Kingdom
SELECT
 population/(SELECT population FROM world
             WHERE name='United Kingdom')
  FROM world
WHERE name = 'China'

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

SELECT name FROM world
WHERE gdp/population>
(SELECT gdp/population FROM world
WHERE name = 'United Kingdom')
AND continent = 'Europe'

SELECT name, continent FROM world
WHERE continent IN 
(SELECT continent FROM world
WHERE name = 'Argentina' OR name ='Australia') ORDER BY name ASC

SELECT name, population FROM world
WHERE population>(SELECT population FROM world WHERE name = 'Canada')
AND population <(SELECT population FROM world WHERE name = 'Poland')

SELECT name, CONCAT(ROUND(population/(SELECT population FROM world WHERE name = 'Germany')*100,0),'%') FROM world
WHERE (continent = 'Europe')

SELECT name
  FROM world
 WHERE gdp > ALL(SELECT gdp
                           FROM world
                          WHERE gdp>0 AND continent = 'Europe')

-- Find the largest country (by area) in each continent, show the continent, the name and the area:
 SELECT continent, name, population FROM world x
  WHERE population >= ALL
    (SELECT population FROM world y
        WHERE y.continent=x.continent
          AND population>0)

-- List each continent and the name of the country that comes first alphabetically.
SELECT continent, name FROM world x
  WHERE name <= ALL
    (SELECT name FROM world y
        WHERE y.continent=x.continent)

-- Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
SELECT name, continent, population FROM world
WHERE continent IN
(SELECT continent FROM world x
  WHERE 25000000 >= ALL
    (SELECT population FROM world y
        WHERE y.continent=x.continent ))

-- Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
SELECT name, continent FROM world x
  WHERE population >= ALL
    (SELECT 3*population FROM world y
        WHERE y.continent=x.continent AND y.name<>x.name)

-- Select the code that shows the name, region and population of the smallest country in each region
 SELECT region, name, population FROM bbc x WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0)

-- Select the code that shows the countries belonging to regions with all populations over 50000
SELECT name,region,population FROM bbc x WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0)

-- Select the code that shows the countries with a less than a third of the population of the countries around it
SELECT name, region FROM bbc x
 WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name)

 -- Select the result that would be obtained from the following code:
 SELECT name FROM bbc
 WHERE population >
       (SELECT population
          FROM bbc
         WHERE name='United Kingdom')
   AND region IN
       (SELECT region
          FROM bbc
         WHERE name = 'United Kingdom')
-- Table-D
-- France
-- Germany
-- Russia
-- Turkey

-- Useful Select the code that would show the countries with a greater GDP than any country in Africa (some countries may have NULL gdp values).
SELECT name FROM bbc
 WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa')

-- Select the code that shows the countries with population smaller than Russia but bigger than Denmark
SELECT name FROM bbc
 WHERE population < (SELECT population FROM bbc WHERE name='Russia')
   AND population > (SELECT population FROM bbc WHERE name='Denmark')

 -- >Select the result that would be obtained from the following code:
 SELECT name FROM bbc
 WHERE population > ALL
       (SELECT MAX(population)
          FROM bbc
         WHERE region = 'Europe')
   AND region = 'South Asia'
-- Table-B
-- Bangladesh
-- India
-- Pakistan



-- SUM AND COUNT
-- ************************************************
-- This tutorial is about aggregate functions such as COUNT, SUM and AVG. An aggregate function takes many values and delivers just one value. For example the function SUM would aggregate the values 2, 4 and 5 to deliver the single value 11.
-- Show the total population of the world.
SELECT SUM(population)
FROM world

-- List all the continents - just once each.
SELECT DISTINCT continent
FROM world

-- Give the total GDP of Africa
SELECT SUM(gdp)
FROM world WHERE continent = 'Africa'

-- How many countries have an area of at least 1000000
SELECT COUNT(name)
FROM world WHERE area>=1000000

-- What is the total population of ('Estonia', 'Latvia', 'Lithuania')
SELECT SUM(population)
FROm world WHERE name in ('Estonia', 'Latvia', 'Lithuania')

-- Useful Using GROUP BY and HAVING.
--------------------
-- For each continent show the number of countries:
SELECT continent, COUNT(name)
  FROM world
 GROUP BY continent

-- For each continent show the total population:
SELECT continent, SUM(population)
  FROM world
 GROUP BY continent

-- WHERE and GROUP BY. The WHERE filter takes place before the aggregating function. For each relevant continent show the number of countries that has a population of at least 200000000.
SELECT continent, COUNT(name)
  FROM world
 WHERE population>200000000
 GROUP BY continent

 -- GROUP BY and HAVING. The HAVING clause is tested after the GROUP BY. You can test the aggregated values with a HAVING clause. Show the total population of those continents with a total population of at least half a billion
 SELECT continent, SUM(population)
  FROM world
 GROUP BY continent
HAVING SUM(population)>500000000
--------------------

-- For each continent show the continent and number of countries.
SELECT continent, COUNT(name)
FROM world
GROUP BY continent

-- For each continent show the continent and number of countries with populations of at least 10 million.
SELECT continent, COUNT(name)
FROM world
WHERE population>10000000
GROUP BY continent

-- List the continents that have a total population of at least 100 million.
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population)>100000000

-- Select the statement that shows the sum of population of all countries in 'Europe'
 SELECT SUM(population) FROM bbc WHERE region = 'Europe'

-- Select the statement that shows the number of countries with population smaller than 150000
 SELECT COUNT(name) FROM bbc WHERE population < 150000

 -- Select the list of core SQL aggregate functions
 AVG(), COUNT(), MAX(), MIN(), SUM()

 -- Select the result that would be obtained from the following code:
  SELECT region, SUM(area)
   FROM bbc 
  WHERE SUM(area) > 15000000 
  GROUP BY region
No result due to invalid use of the GROUP BY function

-- Select the statement that shows the average population of 'Poland', 'Germany' and 'Denmark'
SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')

-- Select the statement that shows the medium population density of each region
 SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region

-- Useful Select the statement that shows the name and population density of the country with the largest population
 SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)

 -- Pick the result that would be obtained from the following code:
  SELECT region, SUM(area) 
   FROM bbc 
  GROUP BY region 
  HAVING SUM(area)<= 20000000



-- The JOIN operation
-- *********************************
-- The first example shows the goal scored by a player with the last name 'Bender'. The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtime
SELECT * FROM goal 
  WHERE player LIKE  '%Bender'

-- Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

-- From the previous query you can see that Lars Bender's scored a goal in game 1012. Now we want to know what teams were playing in that match.
-- Notice in the that the column matchid in the goal table corresponds to the id column in the game table. We can look up information about game 1012 by finding that row in the game table.
-- Show id, stadium, team1, team2 for just game 1012
SELECT id,stadium,team1,team2
  FROM game WHERE id = 1012

-- Modify it to show the player, teamid, stadium and mdate and for every German goal.
SELECT player,teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid) AND teamid = 'GER'

-- Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid) AND player LIKE 'Mario%'

-- Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (teamid = id)
 WHERE gtime<=10

-- List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT mdate, teamname
  FROM game JOIN eteam ON (team1 = eteam.id)
 WHERE coach = 'Fernando Santos'

-- List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT player
FROM game JOIN goal ON (id = matchid)
WHERE stadium = 'National Stadium, Warsaw'

-- The example query shows all goals scored in the Germany-Greece quarterfinal.
SELECT player, gtime
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' AND team2='GRE')

-- Instead show the name of all players who scored a goal against Germany.
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' OR team2='GER') AND teamid <>'GER'

-- Show teamname and the total number of goals scored.
-- COUNT and GROUP BY
SELECT teamname, COUNT(teamid)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname
 ORDER BY teamname

-- Show the stadium and the number of goals scored in each stadium.
SELECT stadium, COUNT(matchid)
  FROM  goal JOIN game ON id=matchid
 GROUP BY stadium

-- Useful For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT matchid,mdate, COUNT(teamid)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')

 -- For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
 SELECT matchid,mdate, COUNT(teamid)
  FROM game JOIN goal ON matchid = id 
 WHERE (teamid = 'GER')
GROUP by matchid,mdate

-- List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.
-- Notice in the query given every goal is listed. If it was a team1 goal then a 1 appears in score1, otherwise there is a 0. You could SUM this column to get a count of the goals scored by team1. Sort your result by mdate, matchid, team1 and team2.
SELECT mdate,
team1, 
SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
team2,
SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game JOIN goal ON (id=matchid)
GROUP BY mdate, matchid, team1, team2
ORDER BY mdate, matchid, team1, team2
GROUP by matchid,mdate

-- CASE
SELECT name, population,CASE 
            WHEN population<1000000 
            THEN 'small'
            WHEN population<10000000 
            THEN 'medium'
            ELSE 'large'
       END
  FROM bbc

-- Select the code which shows players, their team and the amount of goals they scored against Greece(GRE).
SELECT player, teamid, COUNT(*)
  FROM game JOIN goal ON matchid = id
 WHERE (team1 = "GRE" OR team2 = "GRE")
   AND teamid != 'GRE'
 GROUP BY player, teamid

-- Select the result that would be obtained from this code:
SELECT DISTINCT teamid, mdate
  FROM goal JOIN game on (matchid=id)
 WHERE mdate = '9 June 2012'
 -- DEN  9 June 2012
-- GER 9 June 2012

-- Select the code which would show the player and their team for those who have scored against Poland(POL) in National Stadium, Warsaw
 SELECT DISTINCT player, teamid 
   FROM game JOIN goal ON matchid = id 
  WHERE stadium = 'National Stadium, Warsaw' 
 AND (team1 = 'POL' OR team2 = 'POL')
   AND teamid != 'POL'

-- Select the code which shows the player, their team and the time they scored, for players who have played in Stadion Miejski (Wroclaw) but not against Italy
SELECT DISTINCT player, teamid, gtime
  FROM game JOIN goal ON matchid = id
 WHERE stadium = 'Stadion Miejski (Wroclaw)'
   AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'))

-- Select the result that would be obtained from this code:
SELECT teamname, COUNT(*)
  FROM eteam JOIN goal ON teamid = id
 GROUP BY teamname
HAVING COUNT(*) < 3
-- Netherlands 2
-- Poland  2
-- Republic of Ireland 1
-- Ukraine 2


-- More JOIN operations
-- *******************************
SELECT id, title, yr
FROM movie
WHERE title like '%Star Trek%'
ORDER BY yr

-- Obtain the cast list for 'Casablanca'.
SELECT DISTINCT actor.name
FROM (movie JOIN casting ON movieid = (SELECT movie.id FROM movie WHERE title = 'Casablanca')) JOIN actor ON actor.id = actorid
-- OR
SELECT DISTINCT actor.name
FROM actor
WHERE actor.id IN  (SELECT actorid FROM casting WHERE movieid = 11768)

-- Obtain the cast list for the film 'Alien'
SELECT DISTINCT actor.name
FROM actor
WHERE actor.id IN  (SELECT actorid FROM casting WHERE movieid = (SELECT movie.id FROM movie WHERE title = 'Alien'))

-- List the films in which 'Harrison Ford' has appeared
SELECT title
FROM movie JOIN casting ON movie.id = casting.movieid
WHERE  casting.actorid = (SELECT actor.id FROM actor WHERE name ='Harrison Ford')

-- List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
SELECT title
FROM movie JOIN casting ON movie.id = casting.movieid
WHERE  casting.actorid = (SELECT actor.id FROM actor WHERE name ='Harrison Ford') AND ord<>1

-- List the films together with the leading star for all 1962 films.
SELECT movie.title,actor.name
FROM actor JOIN (movie JOIN casting ON movie.id = casting.movieid) ON actor.id = casting.actorid
WHERE  ord = 1 AND yr =1962

-- Which were the busiest years for 'John Travolta', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
where name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 where name='John Travolta'
 GROUP BY yr) AS t
)

-- List the film title and the leading actor for all of the films 'Julie Andrews' played in.
-- SELECT movieid FROM casting
-- WHERE actorid IN (
--   SELECT id FROM actor
--   WHERE name='Julie Andrews')
SELECT title, name FROM movie JOIN
(SELECT name,movieid FROM actor JOIN
(SELECT movieid,actorid FROM casting
WHERE movieid IN 
   (SELECT movieid FROM casting JOIN movie ON movie.id = casting.movieid
   WHERE actorid IN 
      (SELECT id FROM actor WHERE name='Julie Andrews')) AND ord=1) AS K on actorid=actor.id) AS L on movie.id = movieid
-- OR
SELECT title, name 
FROM (movie JOIN casting ON movie.id = movieid)
                       JOIN actor ON actorid = actor.id
WHERE movieid IN 
      (SELECT movieid FROM casting WHERE actorid IN (SELECT id FROM actor WHERE name='Julie Andrews'))
AND ord=1

-- Obtain a list, in alphabetical order, of actors who've had at least 30 starring roles.
SELECT DISTINCT name
FROM casting JOIN actor ON 
(id=actorid AND (SELECT COUNT(ord) FROM casting WHERE actor.id = actorid AND ord=1)>=30)
ORDER BY name
-- OR
SELECT name FROM (actor JOIN casting ON actorid = actor.id)
WHERE ord = 1
GROUP BY name HAVING count(ord) >= 30
ORDER BY name ASC

-- List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT title,COUNT(actorid) FROM (movie JOIN casting ON id=movieid)
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title ASC

-- List all the people who have worked with 'Art Garfunkel'.
SELECT DISTINCT name FROM casting JOIN actor ON id=actorid
WHERE movieid IN (SELECT movieid FROM casting WHERE actorid = (SELECT id FROM actor WHERE name = 'Art Garfunkel')) AND name <>'Art Garfunkel'

-- Select the statement which lists the unfortunate directors of the movies which have caused financial loses (gross < budget)
SELECT name
  FROM actor INNER JOIN movie ON actor.id = director
 WHERE gross < budget

-- Select the correct example of JOINing three tables
SELECT *
  FROM actor JOIN casting ON actor.id = actorid
  JOIN movie ON movie.id = movieid

-- Useful, replaced COUNT with 2. Select the statement that shows the list of actors called 'John' by order of number of movies in which they acted
SELECT name, COUNT(movieid)
  FROM casting JOIN actor ON actorid=actor.id
 WHERE name LIKE 'John %'
 GROUP BY name ORDER BY 2 DESC

-- Crocodile" Dundee
-- Crocodile Dundee in Los Angeles
-- Flipper
-- Lightning Jack
 SELECT title 
   FROM movie JOIN casting ON (movieid=movie.id)
              JOIN actor   ON (actorid=actor.id)
  WHERE name='Paul Hogan' AND ord = 1

-- Select the statement that lists all the actors that starred in movies directed by Ridley Scott who has id 351
SELECT name
  FROM movie JOIN casting ON movie.id = movieid
  JOIN actor ON actor.id = actorid
WHERE ord = 1 AND director = 351

-- There are two sensible ways to connect movie and actor. They are:
-- link the director column in movies with the primary key in actor
-- connect the primary keys of movie and actor via the casting table

-- Amazingly useful to skip all the JOINs
 SELECT title, yr 
   FROM movie, casting, actor 
  WHERE name='Robert De Niro' AND movieid=movie.id AND actorid=actor.id AND ord = 3
-- A Bronx Tale  1993
-- Bang the Drum Slowly  1973
-- Limitless 2011



-- Using NULL
-- *******************************
-- The SELECT statement returns results from a table. With a WHERE clause only some rows are returned. This example shows the year that Athens hosted the Olympic games.
SELECT code, name FROM party
  WHERE leader IS NULL

-- List the teachers who have NULL for their department.
-- Why we cannot use =
SELECT name
FROM teacher
WHERE dept IS NULL

-- Note the INNER JOIN misses the teachers with no department and the departments with no teacher.
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

-- Use a different JOIN so that all teachers are listed.
SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

-- Use a different JOIN so that all departments are listed.
SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)

-- Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266'
SELECT name, COALESCE(mobile,'07986 444 2266')
FROM teacher

-- Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher LEFT JOIN dept
ON teacher.dept= dept.id

-- Use COUNT to show the number of teachers and the number of mobile phones.
SELECT COUNT(teacher.name), COUNT(mobile)
FROM teacher LEFT JOIN dept
ON teacher.dept= dept.id

-- Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.
SELECT dept.name, COUNT(teacher.name)
FROM teacher RIGHT JOIN dept
ON teacher.dept= dept.id
GROUP BY dept.name

-- Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.
SELECT teacher.name, CASE
WHEN (teacher.dept = 1 OR teacher.dept = 2)
THEN 'Sci'
ELSE 'Art'
END
FROM teacher LEFT JOIN dept
ON teacher.dept= dept.id

-- Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.
SELECT teacher.name, CASE
WHEN (teacher.dept = 1 OR teacher.dept = 2)
THEN 'Sci'
WHEN (teacher.dept = 3)
THEN 'Art'
ELSE 'None'
END
FROM teacher LEFT JOIN dept
ON teacher.dept= dept.id

-- Select the code which uses a JOIN correctly.
 SELECT teacher.name, dept.name FROM teacher LEFT OUTER JOIN dept ON (teacher.dept > dept.id)

 -- Select the correct statement that shows the name of department which employs Cutflower -
 SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower'

 -- Select out of following the code which uses a JOIN to show a list of all the departments and number of employed teachers
 SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name

-- Using SELECT name, dept, COALESCE(dept, 0) AS result FROM teacher on teacher table will:
display 0 in result column for all teachers without department

SELECT name,
       CASE WHEN phone = 2752 THEN 'two'
            WHEN phone = 2753 THEN 'three'
            WHEN phone = 2754 THEN 'four'
            END AS digit
  FROM teacher
-- 'four' for Throd

 SELECT name, 
      CASE 
       WHEN dept 
        IN (1) 
        THEN 'Computing' 
       ELSE 'Other' 
      END 
  FROM teacher
-- Shrivell  Computing
-- Throd Computing
-- Splint  Computing
-- Spiregrain  Other
-- Cutflower Other
-- Deadyawn  Other

-- Self join
-- *******************************
-- How many stops are in the database.
SELECT COUNT(id)
FROM stops

-- Find the id value for the stop 'Craiglockhart'
SELECT id
FROM stops
WHERE name = 'Craiglockhart'

-- Give the id and the name for the stops on the '4' 'LRT' service.
SELECT stops.id, stops.name
FROM stops, route
WHERE route.stop = stops.id AND route.num = '4' AND company ='LRT'

-- The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53). Run the query and notice the two services that link these stops have a count of 2. Add a HAVING clause to restrict the output to these two routes.
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num HAVING COUNT(*)=2

-- Execute the self join shown and observe that b.stop gives all the places you can get to from Craiglockhart, without changing routes. Change the query so that it shows the services from Craiglockhart to London Road.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=(SELECT id FROM stops WHERE name='London Road')

-- The query shown is similar to the previous one, however by joining two copies of the stops table we can refer to stops by name rather than by number. Change the query so that the services between 'Craiglockhart' and 'London Road' are shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross'
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops AS stopa ON (a.stop=stopa.id)
  JOIN stops AS stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road'

-- Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
 (a.company=b.company AND a.num = b.num)
  JOIN stops AS stopa ON (a.stop=stopa.id)
  JOIN stops AS stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket' AND stopb.name = 'Leith'
-- OR
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b
ON (a.company = b.company AND a.num = b.num)
JOIN stops stopa ON (a.stop = stopa.id)
JOIN stops stopb ON (b.stop = stopb.id)
WHERE stopa.id = 115 AND stopb.id =137

-- Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'
select DISTINCT a.company, a.num
FROM route a JOIN route b
ON (a.num = b.num AND a.company = b.company)
JOIN stops stopa ON stopa.id = a.stop
JOIN stops stopb ON stopb.id = b.stop
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross'

-- Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered by the LRT company. Include the company and bus no. of the relevant services.
SELECT DISTINCT stopb.name, a.company, a.num
FROM route a JOIN route b
ON (a.num = b.num AND a.company = b.company)
JOIN stops stopa ON stopa.id = a.stop
JOIN stops stopb ON stopb.id = b.stop
WHERE stopa.name = 'Craiglockhart'

-- Find the routes involving two buses that can go from Craiglockhart to Sighthill.
-- Show the bus no. and company for the first bus, the name of the stop for the transfer,
-- and the bus no. and company for the second bus.
-- Hint
-- Self-join twice to find buses that visit Craiglockhart and Sighthill, then join those on matching stops.
SELECT DISTINCT a.num, a.company, stopb.name ,  c.num,  c.company
FROM route a JOIN route b
ON (a.company = b.company AND a.num = b.num)
JOIN ( route c JOIN route d ON (c.company = d.company AND c.num= d.num))
JOIN stops stopa ON (a.stop = stopa.id)
JOIN stops stopb ON (b.stop = stopb.id)
JOIN stops stopc ON (c.stop = stopc.id)
JOIN stops stopd ON (d.stop = stopd.id)
WHERE  stopa.name = 'Craiglockhart' AND stopd.name = 'Sighthill'
            AND  stopb.name = stopc.name
ORDER BY LENGTH(a.num), b.num, stopb.id, LENGTH(c.num), d.num

-- Select the code that would show it is possible to get from Craiglockhart to Haymarket
SELECT DISTINCT a.name, b.name
  FROM stops a JOIN route z ON a.id=z.stop
  JOIN route y ON y.num = z.num
  JOIN stops b ON y.stop=b.id
 WHERE a.name='Craiglockhart' AND b.name ='Haymarket'

 -- Select the code that shows the stops that are on route.num '2A' which can be reached with one bus from Haymarket?
 SELECT S2.id, S2.name, R2.company, R2.num
  FROM stops S1, stops S2, route R1, route R2
 WHERE S1.name='Haymarket' AND S1.id=R1.stop
   AND R1.company=R2.company AND R1.num=R2.num
   AND R2.stop=S2.id AND R2.num='2A'

-- Select the code that shows the services available from Tollcross?
SELECT a.company, a.num, stopa.name, stopb.name
  FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
 WHERE stopa.name='Tollcross'


 
