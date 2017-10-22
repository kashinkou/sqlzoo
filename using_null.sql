--#6
-- Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher LEFT JOIN dept
  ON teacher.dept = dept.id;

--#10
-- Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.
SELECT name, CASE WHEN dept in (1,2) THEN 'Sci' 
               WHEN dept = 3 THEN 'Art'
               ELSE 'None' END
FROM teacher;
