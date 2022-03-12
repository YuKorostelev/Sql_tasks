--task1  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/the-report/problem

SELECT CASE 
	WHEN Grades.Grade < 8 THEN 'NULL' 
	ELSE Students.Name 
	END 
, Grades.Grade, Students.Marks 
FROM Students, Grades 
WHERE Students.Marks >= Grades.Min_mark AND Students.Marks <= Grades.Max_mark 
ORDER BY Grades.Grade DESC, Students.Name;

--task2  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/occupations/problem

SELECT min(Doctor), min(Professor), min(Singer), min(Actor)
FROM
( Select
ROW_NUMBER() OVER (PARTITION BY Occupation order by Name) rn, 
CASE 
WHEN Occupation = 'Doctor' then Name
end as Doctor,
CASE 
WHEN Occupation = 'Professor' then Name
end as Professor,
CASE 
WHEN Occupation = 'Singer' then Name
end as Singer,
CASE 
WHEN Occupation = 'Actor' then Name
end as Actor
from OCCUPATIONS
order by Name) a
group by rn
order by rn;

--task3  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/weather-observation-station-9/problem

--task4  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/weather-observation-station-10/problem

--task5  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/weather-observation-station-11/problem

--task6  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/weather-observation-station-12/problem

--task7  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/salary-of-employees/problem
SELECT name 
FROM Employee 
WHERE salary > 2000 AND months < 10 
ORDER BY employee_id;

--task8  (lesson9)
-- oracle: https://www.hackerrank.com/challenges/the-report/problem
