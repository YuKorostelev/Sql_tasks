--����� ��: https://docs.google.com/document/d/1NVORWgdwlKepKq_b8SPRaSpraltxoMg2SIusTEN6mEQ/edit?usp=sharing
--colab/jupyter: https://colab.research.google.com/drive/1j4XdGIU__NYPVpv74vQa9HUOAkxsgUez?usp=sharing

-- ������� 1: ������� name, class �� ��������, ���������� ����� 1920
select name,class 
from ships 
where launched > 1920


-- ������� 2: ������� name, class �� ��������, ���������� ����� 1920, �� �� ������� 1942
--
select name,class 
from ships 
where launched > 1920 and launched <= 1942



-- ������� 3: ����� ���������� �������� � ������ ������. ������� ���������� � class
--
select count(*), class
from ships
group by class


-- ������� 4: ��� ������� ��������, ������ ������ ������� �� ����� 16, ������� ����� � ������. (������� classes)
--

select country, class
from classes 
where bore >= 16



-- ������� 5: ������� �������, ����������� � ��������� � �������� ��������� (������� Outcomes, North Atlantic). �����: ship.
--
select ship
from outcomes
where battle = 'North Atlantic' and result = 'sunk'



-- ������� 6: ������� �������� (ship) ���������� ������������ �������
--

select ship
from outcomes, battles 
where result = 'sunk'
order by ship desc
limit 1

-- ������� 7: ������� �������� ������� (ship) � ����� (class) ���������� ������������ �������


-- ������� 8: ������� ��� ����������� �������, � ������� ������ ������ �� ����� 16, � ������� ���������. �����: ship, class

select ship, class
from outcomes, classes
where bore >= 16 and result = 'sunk'


-- ������� 9: ������� ��� ������ ��������, ���������� ��� (������� classes, country = 'USA'). �����: class

select class
from classes 
where country = 'USA'

-- ������� 10: ������� ��� �������, ���������� ��� (������� classes & ships, country = 'USA'). �����: name, class

select name, classes.class
from classes
join ships 
on classes.class = ships.class
where country = 'USA'




