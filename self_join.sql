--#5
-- Execute the self join shown and observe that b.stop gives all the places you can get to from 
-- Craiglockhart, without changing routes. Change the query so that it shows the services from 
-- Craiglockhart to London Road.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149;

--#6
-- The query shown is similar to the previous one, however by joining two copies of the stops table 
-- we can refer to stops by name rather than by number. Change the query so that the services between 
-- 'Craiglockhart' and 'London Road' are shown. If you are tired of these places try 'Fairmilehead' 
-- against 'Tollcross'
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
  AND stopb.name='London Road';

--#7
-- Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=115 AND b.stop = 137
GROUP BY company, num;

--#8
-- Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'
SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
  AND stopb.name='Tollcross';

--#9
-- Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, 
-- including 'Craiglockhart' itself, offered by the LRT company. Include the company and bus no. 
-- of the relevant services.
SELECT stopb.name, a.company, a.num
FROM route a JOIN route b ON
  (a.company = b.company AND a.num=b.num)
JOIN stops stopa ON a.stop=stopa.id
JOIN stops stopb ON b.stop=stopb.id
WHERE stopa.name='Craiglockhart'
AND a.company='LRT'
GROUP BY name, company, num
ORDER BY company, num, name;

--#10
-- Find the routes involving two buses that can go from Craiglockhart to Sighthill.
-- Show the bus no. and company for the first bus, the name of the stop for the transfer,
-- and the bus no. and company for the second bus.
SELECT DISTINCT a.num, a.company, stopb.name, c.num, c.company
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN route c ON (b.stop=c.stop)
  JOIN route d ON (c.company=d.company AND c.num=d.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
  JOIN stops stopd ON (d.stop=stopd.id)
WHERE stopa.name='Craiglockhart'
  AND stopd.name='Sighthill'
ORDER BY LENGTH(a.num), a.num, a.company, b.pos, c.num;
