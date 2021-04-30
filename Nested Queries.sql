# Rentals per customer

Select
    r.customer_id, count(distinct r.rental_id) as num_rentals

From
    rental r

Group by 1

;
#How many users have rented 20 or more titles

Select

    sum(p.amount)

From
    (Select
    r.customer_id, count(distinct r.rental_id) as num_rentals

    From
    rental r

    Group by 1
    ) as rpc,

    payment p

Where
rpc.customer_id = p.customer_id
and rpc.num_rentals > 20
;

Select

    rpc.num_rentals, 
    count(distinct rpc.customer_id) as num_customers,
    sum(p.amount) as total_rev

From
    (Select
    r.customer_id, 
    count(distinct r.rental_id) as num_rentals

    From
    rental r

    Group by 
        1
    ) as rpc,

    payment p

Where
rpc.customer_id = p.customer_id
and rpc.num_rentals > 20

Group by
    1
;

