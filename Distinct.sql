#How many distinct renters per month

Select
    left(r.rental_date,7) as month,
    count(r.rental_id) as total_rentals,
    count(distinct r.customer_id) as unique_renters,
    count(r.rental_id)/count(distinct r.customer_id) as avg_num_rentals_per_renter
From
    rental r

group by 1

#How many distinct films per month

Select
    left(r.rental_date,7) as month,
    count(r.rental_id) as total_rentals,
    count(distinct i.film_id) as unique_films_rented,
    count(r.rental_id)/count(distinct i.film_id) as rentals_per_film
From
    rental r,
    inventory i

Where
    r.inventory_id = i.inventory_id

group by 
    1