--����� ��: https://docs.google.com/document/d/1NVORWgdwlKepKq_b8SPRaSpraltxoMg2SIusTEN6mEQ/edit?usp=sharing

--task1
--�������: ��� ������� ������ ���������� ����� �������� ����� ������, ����������� � ���������. �������: ����� � ����� ����������� ��������.

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
--�������: ��� ������� ������ ���������� ���, ����� ��� ������ �� ���� ������ ������� ����� ������. ���� ��� ������ �� ���� ��������� ������� ����������, ���������� ����������� ��� ������ �� ���� �������� ����� ������. �������: �����, ���.

select classes.class, a.t
from classes
join 
(select class, min(launched) as t
from ships
group by class)
as a on classes.class = a.class



--task3
--�������: ��� �������, ������� ������ � ���� ����������� �������� � �� ����� 3 �������� � ���� ������, ������� ��� ������ � ����� ����������� ��������.



--task4
--�������: ������� �������� ��������, ������� ���������� ����� ������ ����� ���� �������� ������ �� ������������� (������ ������� �� ������� Outcomes).



