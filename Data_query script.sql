select cu.customer_id,cu.active,cu.create_date,cu.last_update,r.rental_date, r.return_date, p.amount, cat.name as category, l.name as language from customer cu
inner join rental r on cu.customer_id = r.customer_id
inner join payment p on cu.customer_id = p.customer_id
inner join inventory i on i.inventory_id = r.inventory_id
inner join film on i.film_id = film.film_id
inner join film_category fact on film.film_id = fact.film_id
inner join category cat on fact.category_id = cat.category_id
inner join language as l on l.language_id = film.language_id



select cu.customer_id, cu.active, r.customer_id, r.rental_date, r.return_date from customer cu
join rental r on r.customer_id = cu.customer_id



create table film_category_language as
select f.film_id, f.title, f.rental_duration, f.rental_rate, f.length, f.replacement_cost, f.rating, cat.name as category, l.name as language from film f
join film_category fact on fact.film_id = f.film_id
join category cat on cat.category_id = fact.category_id
join language l on l.language_id = f.language_id

-- not using this one
select * from film_actor f
join film_category_language fct on fct.film_id = f.film_id 
join actor a on f.actor_id = a.actor_id
--  not using this one

--Inventory
Create table fcl_inventory as 
Select i.inventory_id, fcl.film_id, fcl.title, fcl.rental_duration, fcl.rental_rate, fcl.length, fcl.replacement_cost, fcl.rating, fcl.category,fcl.language, i.store_id
from inventory i
join film_category_language fcl on i.film_id = fcl.film_id 

select * from customer

--Rental

create table fcl_inventory_rental_cu as 
select  i.inventory_id, i.film_id, i.title, i.rental_duration, i.rental_rate, i.length,i.replacement_cost, i.rating, i.category, i.language,  i.store_id, r.rental_id, r.rental_date, r.customer_id, r.return_date, p.amount, cu.active
from rental r
join fcl_inventory i on i.inventory_id = r.inventory_id
join payment p on r.rental_id = p.rental_id
join customer as cu on p.customer_id = cu.customer_id

--payment
select * from payment

