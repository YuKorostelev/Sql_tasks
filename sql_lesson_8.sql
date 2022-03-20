--task1  (lesson8)
-- oracle: https://leetcode.com/problems/department-top-three-salaries/

--task2  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/17

SELECT fm.member_name, fm.status, SUM(p.amount*p.unit_price) as costs
FROM FamilyMembers as fm
JOIN Payments as p ON p.family_member = fm.member_id
WHERE YEAR(p.date) = 2005
GROUP BY fm.member_id, fm.member_name, fm.status

--task3  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/13

select name
from Passenger
GROUP BY name 
having COUNT(name) > 1

--task4  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/38

select count(*) as Count
from student 
where first_name = 'Anna'


--task5  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/35

select COUNT(classroom) as count 
from Schedule
where date like '2019-09-02%'
--task6  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/38

select count(*) as Count
from student 
where first_name = 'Anna'

--task7  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/32

SELECT FLOOR(avg(YEAR(CURRENT_DATE) - YEAR(birthday))) AS age
FROM FamilyMembers

--task8  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/27

--task9  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/37

SELECT min(timestampdiff(YEAR ,birthday, current_date)) as year
from Student

--task10  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/44

select max(TIMESTAMPDIFF(year, birthday, current_date)) as max_year
FROM Student
JOIN Student_in_class
on Student_in_class.student = Student.id
join Class
on Student_in_class.class = class.id
where class.name like '10%'

--task11 (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/20
SELECT status,
         member_name,
        (amount * unit_price) AS costs
FROM FamilyMembers
INNER JOIN Payments
    ON Payments.family_member=FamilyMembers.member_id
INNER JOIN Goods
    ON Payments.good=Goods.good_id
INNER JOIN GoodTypes
    ON GoodTypes.good_type_id=Goods.type
WHERE good_type_name="entertainment"

--task12  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/55

--task13  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/45

--task14  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/43

SELECT last_name
from Teacher
join Schedule
on Schedule.teacher = Teacher.id
JOIN Subject
on Schedule.subject = Subject.id
where Subject.name = 'Physical culture'
ORDER BY Teacher.last_name

--task15  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/63

select CONCAT(last_name,'.', LEFT(first_name,1),'.', LEFT(middle_name,1), '.') as name
from Student
ORDER BY last_name, first_name
