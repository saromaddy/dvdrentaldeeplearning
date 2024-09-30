select cu.customer_id,cu.active,cu.create_date,cu.last_update,r.rental_date, r.return_date, p.amount, cat.name as category, l.name as language from customer cu
inner join rental r on cu.customer_id = r.customer_id
inner join payment p on cu.customer_id = p.customer_id
inner join inventory i on i.inventory_id = r.inventory_id
inner join film on i.film_id = film.film_id
inner join film_category fact on film.film_id = fact.film_id
inner join category cat on fact.category_id = cat.category_id
inner join language as l on l.language_id = film.language_id