#LEFT(), MIN(), MAX()

#How many rentals per month

Select
	left(r.rental_date,7),count(r.rental_id)
	
From
	rental r
	
Group by 1
Order by 2 desc
;
#How many rentals per month

Select
	left(r.rental_date,7) as Month,count(r.rental_id) as Rent#
	
From
	rental r
	
Group by 1
Order by 2 desc
;

#How many rentals per month

Select
	left(r.rental_date,7) as Month,count(r.rental_id) as Rent#
	
From
	rental r
	
Group by 1
;

#Earliest and latest rental dates

Select
	f.title as Title,MAX(r.rental_date) as "Last Rental Date", MIN(r.rental_date) as "Earliest Rental Date"
	
From
	rental r, inventory i, film f

Where
    r.inventory_id = i.inventory_id
    and i.film_id = f.film_id
	
Group by
    f.film_id
    
;

#Every cutomer's last rental date

Select
	concat(c.first_name," ",last_name) as Name,c.email as email, MAX(r.rental_date) as "Last Rental Date"
	
From
	rental r, customer c

Where
    c.customer_id = r.customer_id
	
Group by
    c.customer_id
    
;

#Revenue per month

Select
	left(r.rental_date,7) as Month,count(r.rental_id) as "Number of Rentals", f.rental_rate as "Rental Price", count(r.rental_id) * f.rental_rate as Revenue
	
From
	rental r,
	film f,
	inventory i
	
Where
    f.film_id = i.film_id
    and
    i.inventory_id = r.inventory_id
Group by 1
;

#Revenue per month

Select
	left(p.payment_date,7) as Month,sum(p.amount) as "Month Revenue"
	
From
	payment p
	
Group by 1