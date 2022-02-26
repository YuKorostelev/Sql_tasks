--����� ��: https://docs.google.com/document/d/1NVORWgdwlKepKq_b8SPRaSpraltxoMg2SIusTEN6mEQ/edit?usp=sharing
--colab/jupyter: https://colab.research.google.com/drive/1j4XdGIU__NYPVpv74vQa9HUOAkxsgUez?usp=sharing


--task1  (lesson4)
-- ������������ �����: ������� view (�������� all_products_flag_300) ��� ���� ������� (pc, printer, laptop) � ������, ���� ��������� ������ > 300. �� view ��� �������: model, price, flag
create view all_products_flag_300 as 
select model, price,
case when price > 300 
then 1
else 0 
end flag
  from 
  (
    select model, price 
    from pc 
    union all 
    select model, price 
    from printer
    union all 
    select model, price 
    from laptop  
  ) t1 

select * 
from all_products_flag_300


--task2  (lesson4)
-- ������������ �����: ������� view (�������� all_products_flag_avg_price) ��� ���� ������� (pc, printer, laptop) � ������, ���� ��������� ������ c������ . �� view ��� �������: model, price, flag
create view  all_products_flag_avg_price as 
with all_prices as (
  select model, price 
  from pc 
union all 
  select model, price 
  from printer 
union all 
  select model, price 
  from laptop  
) 
select *,
case when price > (select avg(price) from all_prices)
then 1
else 0
end flag
from all_prices

select *
from all_products_flag_avg_price



--task3  (lesson4)
-- ������������ �����: ������� ��� �������� ������������� = 'A' �� ���������� ���� ������� �� ��������� ������������� = 'D' � 'C'. ������� model

select pr.model
from printer pr
join product p 
on p.model = pr.model
where price > (select avg(price) from printer where maker = 'A')


--task5 (lesson4)
-- ������������ �����: ����� ������� ���� ����� ��������� ������������� = 'A' (printer & laptop & pc)


select maker, type, avg(price) as avg 
from (
    select maker, product.type, price 
    from pc  
    join product 
    on pc.model = product.model 
  union all 
    select maker, product.type, price 
    from product  
    join printer 
    on printer.model = product.model 
  union all 
    select maker, product.type, price 
    from product  
    join laptop 
    on laptop.model = product.model 
) a 
where maker = 'A'
group by maker, type


--task6 (lesson4)
-- ������������ �����: ������� view � ����������� ������� (�������� count_products_by_makers) �� ������� �������������. �� view: maker, count
create view count_products_by_makers as
select count(model), p.maker
from product p 
group by p.maker

select *
from count_products_by_makers


--task7 (lesson4)
-- �� ����������� view (count_products_by_makers) ������� ������ � colab (X: maker, y: count)



--task8 (lesson4)
-- ������������ �����: ������� ����� ������� printer (�������� printer_updated) � ������� �� ��� ��� �������� ������������� 'D'
create table printer_updated as
select pr.model, pr.code, pr.color, pr.type, pr.price, p.maker
from printer pr
join product p 
on pr.model = p.model

select *
from printer_updated

delete from printer_updated
where maker = 'D'

--task9 (lesson4)
-- ������������ �����: ������� �� ���� ������� (printer_updated) view � �������������� �������� ������������� (�������� printer_updated_with_makers)

--task10 (lesson4)
-- �������: ������� view c ����������� ����������� �������� � ������� ������� (�������� sunk_ships_by_classes). �� view: count, class (���� �������� ������ ���/IS NULL, �� �������� �� 0)

--task11 (lesson4)
-- �������: �� ����������� view (sunk_ships_by_classes) ������� ������ � colab (X: class, Y: count)

--task12 (lesson4)
-- �������: ������� ����� ������� classes (�������� classes_with_flag) � �������� � ��� flag: ���� ���������� ������ ������ ��� ����� 9 - �� 1, ����� 0

create table classes_with_flag as
select *,
case when numguns >= 9
then 1
else 0 
end flag 
from classes

select *
from classes_with_flag




--task13 (lesson4)
-- �������: ������� ������ � colab �� ������� classes � ����������� ������� �� ������� (X: country, Y: count)

--task14 (lesson4)
-- �������: ������� ���������� ��������, � ������� �������� ���������� � ����� "O" ��� "M".

select count(*)
from ships
where name like 'M%' or name like 'O%'


--task15 (lesson4)
-- �������: ������� ���������� ��������, � ������� �������� ������� �� ���� ����.

select count(*)
from ships 
where name like '% %'


--task13 (lesson3)
--������������ �����: ������� ������ ���� ��������� � ������������� � ��������� ���� �������� (pc, printer, laptop). �������: model, maker, type

with all_products as(
select model,type
from pc 
union all
select model, type
from printer
union all
select model, maker, type
from laptop)
select model,type 
from all_products 


--task14 (lesson3)
--������������ �����: ��� ������ ���� �������� �� ������� printer ������������� ������� ��� ���, � ���� ���� ����� ������� PC - "1", � ��������� - "0"

select *, 
case when price > (select avg(price) from pc) 
then 1 
else 0
end flag
from printer




--task15 (lesson3)
--�������: ������� ������ ��������, � ������� class ����������� (IS NULL)

select name 
from ships 
where class is null


--task16 (lesson3)
--�������: ������� ��������, ������� ��������� � ����, �� ����������� �� � ����� �� ����� ������ �������� �� ����.



--task17 (lesson3)
--�������: ������� ��������, � ������� ����������� ������� ������ Kongo �� ������� Ships.

select distinct battle 
from outcomes
where ship in 
(select name
from ships
where class = 'kongo')



