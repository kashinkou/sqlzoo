--#11
SELECT *
FROM nobel
WHERE winner LIKE 'peter gr_nberg';

--#12
SELECT *
FROM nobel
WHERE winner = 'EUGENE O''NEILL';

--#14
SELECT winner, subject
  FROM nobel
WHERE yr=1984
ORDER BY subject IN ('Physics','Chemistry'), subject, winner