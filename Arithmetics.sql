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

#revenue per video title

Select
	f.title as "Film Title", count(r.rental_id) as "Number of Rentals", f.rental_rate as "Rental Price", count(r.rental_id) * f.rental_rate as Revenue
From
	film f,
	rental r, 
	inventory i
where
    f.film_id = i.film_id
    and
    i.inventory_id = r.inventory_id
Group by 1
Order by 4 desc
;

#What customer brings the highest revenue

Select
	p.customer_id,sum(p.amount)
	
From
	payment p
	
Group by 1
Order by 2 desc
;

#What store has brought the most revenue

Select
	ss.store,sum(ss.total_sales)
	
From
	sales_by_store ss
	
Group by 1
Order by 2 desc
;

Select
	i.store_id as "Store ID",sum(p.amount) as Revenue
	
From
	inventory i, payment p, rental r

Where
    p.rental_id = r.rental_id
    and r.inventory_id = i.inventory_id
	
Group by 1
Order by 2 desc
;