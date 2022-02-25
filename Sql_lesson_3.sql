--схема Ѕƒ: https://docs.google.com/document/d/1NVORWgdwlKepKq_b8SPRaSpraltxoMg2SIusTEN6mEQ/edit?usp=sharing

--task1
-- орабли: ƒл€ каждого класса определите число кораблей этого класса, потопленных в сражени€х. ¬ывести: класс и число потопленных кораблей.

select classes.class, COUNT(s.ship)
from classes
left join
(select  outcomes.ship, ships.class
from  outcomes 
left join ships ON ships.name = outcomes.ship
where  outcomes.result = 'sunk') 
as s on s.class = classes.class or s.ship = classes.class
GROUP BY classes.class

--task2
-- орабли: ƒл€ каждого класса определите год, когда был спущен на воду первый корабль этого класса. ≈сли год спуска на воду головного корабл€ неизвестен, определите минимальный год спуска на воду кораблей этого класса. ¬ывести: класс, год.

select classes.class, a.t
from classes
join 
(select class, min(launched) as t
from ships
group by class)
as a on classes.class = a.class



--task3
SELECT c.class, SUM(sh.sunked)
FROM classes c
  LEFT JOIN (
     SELECT t.name AS name, t.class AS class,
           CASE WHEN o.result = 'sunk' THEN 1 ELSE 0 END AS sunked
     FROM
     (
      SELECT name, class
      FROM ships
       UNION
      SELECT ship, ship
      FROM outcomes
     )
     AS t
    LEFT JOIN outcomes o ON t.name = o.ship
  ) sh ON sh.class = c.class
GROUP BY c.class
HAVING COUNT(DISTINCT sh.name) >= 3 AND SUM(sh.sunked) > 0



--task4
-- орабли: Ќайдите названи€ кораблей, имеющих наибольшее число орудий среди всех кораблей такого же водоизмещени€ (учесть корабли из таблицы Outcomes).
SELECT name
FROM (SELECT O.ship AS name, numGuns, displacement
FROM Outcomes O INNER JOIN
Classes C ON O.ship = C.class AND
O.ship NOT IN (SELECT name
FROM Ships
)
UNION
SELECT S.name AS name, numGuns, displacement
FROM Ships S INNER JOIN
Classes C ON S.class = C.class
) OS INNER JOIN
(SELECT MAX(numGuns) AS MaxNumGuns, displacement
FROM Outcomes O INNER JOIN
Classes C ON O.ship = C.class AND
O.ship NOT IN (SELECT name
FROM Ships
)
GROUP BY displacement
UNION
SELECT MAX(numGuns) AS MaxNumGuns, displacement
FROM Ships S INNER JOIN
Classes C ON S.class = C.class
GROUP BY displacement
) GD ON OS.numGuns = GD.MaxNumGuns AND
OS.displacement = GD.displacement