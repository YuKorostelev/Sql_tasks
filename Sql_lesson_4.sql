--схема БД: https://docs.google.com/document/d/1NVORWgdwlKepKq_b8SPRaSpraltxoMg2SIusTEN6mEQ/edit?usp=sharing
--colab/jupyter: https://colab.research.google.com/drive/1j4XdGIU__NYPVpv74vQa9HUOAkxsgUez?usp=sharing


--task1  (lesson4)
-- Компьютерная фирма: Сделать view (название all_products_flag_300) для всех товаров (pc, printer, laptop) с флагом, если стоимость больше > 300. Во view три колонки: model, price, flag
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
-- Компьютерная фирма: Сделать view (название all_products_flag_avg_price) для всех товаров (pc, printer, laptop) с флагом, если стоимость больше cредней . Во view три колонки: model, price, flag
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
-- Компьютерная фирма: Вывести все принтеры производителя = 'A' со стоимостью выше средней по принтерам производителя = 'D' и 'C'. Вывести model

select *
from printer pr
join product p 
on p.model = pr.model




--task5 (lesson4)
-- Компьютерная фирма: Какая средняя цена среди продуктов производителя = 'A' (printer & laptop & pc)


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
-- Компьютерная фирма: Сделать view с количеством товаров (название count_products_by_makers) по каждому производителю. Во view: maker, count

select *
FROM product





--task7 (lesson4)
-- По предыдущему view (count_products_by_makers) сделать график в colab (X: maker, y: count)

--task8 (lesson4)
-- Компьютерная фирма: Сделать копию таблицы printer (название printer_updated) и удалить из нее все принтеры производителя 'D'

--task9 (lesson4)
-- Компьютерная фирма: Сделать на базе таблицы (printer_updated) view с дополнительной колонкой производителя (название printer_updated_with_makers)

--task10 (lesson4)
-- Корабли: Сделать view c количеством потопленных кораблей и классом корабля (название sunk_ships_by_classes). Во view: count, class (если значения класса нет/IS NULL, то заменить на 0)

--task11 (lesson4)
-- Корабли: По предыдущему view (sunk_ships_by_classes) сделать график в colab (X: class, Y: count)

--task12 (lesson4)
-- Корабли: Сделать копию таблицы classes (название classes_with_flag) и добавить в нее flag: если количество орудий больше или равно 9 - то 1, иначе 0

--task13 (lesson4)
-- Корабли: Сделать график в colab по таблице classes с количеством классов по странам (X: country, Y: count)

--task14 (lesson4)
-- Корабли: Вернуть количество кораблей, у которых название начинается с буквы "O" или "M".

select count(*)
from ships
where name like 'M%' or name like 'O%'


--task15 (lesson4)
-- Корабли: Вернуть количество кораблей, у которых название состоит из двух слов.

select count(*)
from ships 
where name like '% %'


--task13 (lesson3)
--Компьютерная фирма: Вывести список всех продуктов и производителя с указанием типа продукта (pc, printer, laptop). Вывести: model, maker, type

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
--Компьютерная фирма: При выводе всех значений из таблицы printer дополнительно вывести для тех, у кого цена вышей средней PC - "1", у остальных - "0"

select *, 
case when price > (select avg(price) from pc) 
then 1 
else 0
end flag
from printer




--task15 (lesson3)
--Корабли: Вывести список кораблей, у которых class отсутствует (IS NULL)

select name 
from ships 
where class is null


--task16 (lesson3)
--Корабли: Укажите сражения, которые произошли в годы, не совпадающие ни с одним из годов спуска кораблей на воду.



--task17 (lesson3)
--Корабли: Найдите сражения, в которых участвовали корабли класса Kongo из таблицы Ships.
select distinct battle 
from outcomes
where ship in 
(select name
from ships
where class = 'kongo')



