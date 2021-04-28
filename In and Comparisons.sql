#IN(), comparison operators, HAVING

Select
    c.name as category, count(r.rental_id) as num_rental

From
    rental r, inventory i, film f, film_category fc, category c

Where
    r.inventory_id = i.inventory_id
    and i.film_id = f.film_id
    and f.film_id = fc.film_id
    and fc.category_id = c.category_id
    and c.name in("Comedy","Sports","Family")
    
Group by 1
;

# comparison operators

=
>
<
>=
<=
<> not equal to
!= not equal to

#Limit results to only comedy:

Select
    c.name as category, count(r.rental_id) as num_rental

From
    rental r, inventory i, film f, film_category fc, category c

Where
    r.inventory_id = i.inventory_id
    and i.film_id = f.film_id
    and f.film_id = fc.film_id
    and fc.category_id = c.category_id
    and c.name = "Comedy"
    
Group by 1
;

#Give me everything bu comedy:

Select
    c.name as category, count(r.rental_id) as num_rental

From
    rental r, inventory i, film f, film_category fc, category c

Where
    r.inventory_id = i.inventory_id
    and i.film_id = f.film_id
    and f.film_id = fc.film_id
    and fc.category_id = c.category_id
    and c.name != "Comedy"
    
Group by 1
;

# Members who have rented at least 3 times

Select
    r.customer_id as customer, count(r.rental_id) as num_rentals

From
    rental r
    
Group by 1

Having
    count(r.rental_id) >= 3
;

# How much revenue from store 1 is from PG-13 and R-Rated movies

Select
    i.store_id as store, f.rating as rating, sum(p.amount) as store_revenue

From
    film f,
    payment p,
    inventory i,
    rental r

Where
    f.film_id = i.film_id
    and p.rental_id = r.rental_id
    and i.inventory_id = r.inventory_id
    and i.store_id = 1
    and f.rating in ('R','PG-13')
    
Group by 1,2
Order by 3 desc

;

# How much revenue from store 1 is from PG-13 and R-Rated movies
between 2 dates

Select
    i.store_id as store, f.rating as rating, sum(p.amount) as store_revenue

From
    film f,
    payment p,
    inventory i,
    rental r

Where
    f.film_id = i.film_id
    and p.rental_id = r.rental_id
    and i.inventory_id = r.inventory_id
    and i.store_id = 1
    and f.rating in ('R','PG-13')
    and r.rental_date between '2005-06-08' and '2005-07-19'
    
Group by 1,2
Order by 3 desc

;