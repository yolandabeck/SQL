~Working with multiple tables
#customer id, name(first and last), mailing address

Select
	customer.customer_id,customer.first_name,customer.last_name,address.address
From
	customer, address
where
	customer.address_id = address.address_id
#

Select
	customer.customer_id,customer.first_name,customer.last_name,address.address
From
	customer, address
where
	customer.address_id = address.address_id
#

#film name, category, language

Select
	film.title,
	category.name as category,
	language.name as language
From
	film, 
	language, 
	film_category, 
	category
where
    film.film_id = film_category.film_id
    and
    category.category_id = film_category.film_id
    and
    film.language_id = language.language_id
;

#film name, category, language

Select
	film.title,
	category.name as category,
	language.name as language
From
	film, 
	language, 
	film_category, 
	category
where
    film.film_id = film_category.film_id
    and
    category.category_id = film_category.film_id
    and
    film.language_id = language.language_id
;


#film name, category, language
#nicknames

Select
	f.title,
	c.name as category,
	l.name as language
From
	film f, 
	language l, 
	film_category fc, 
	category c
where
    f.film_id = fc.film_id
    and
    c.category_id = fc.film_id
    and
    f.language_id = l.language_id
;


#How many times a movie has been rented out

Select
	f.title, count(r.rental_id)
From
	film f,
	rental r, 
	inventory i
where
    f.film_id = i.film_id
    and
    i.inventory_id = r.inventory_id
Group by 1

;

#revenue per video title

Select
	f.title as "Film Title", count(r.rental_id), f.rental_rate, count(r.rental_id) * f.rental_rate as Revenue
From
	film f,
	rental r, 
	inventory i
where
    f.film_id = i.film_id
    and
    i.inventory_id = r.inventory_id
Group by 1

;