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
-- орабли: ƒл€ классов, имеющих потери в виде потопленных кораблей и не менее 3 кораблей в базе данных, вывести им€ класса и число потопленных кораблей.



--task4
-- орабли: Ќайдите названи€ кораблей, имеющих наибольшее число орудий среди всех кораблей такого же водоизмещени€ (учесть корабли из таблицы Outcomes).



