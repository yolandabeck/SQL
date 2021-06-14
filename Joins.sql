Select
	c.customer_id,c.first_name,c.last_name,a.address
From
	customer c, address a
where
	c.address_id = a.address_id
;

Select
	c.customer_id,
	c.first_name,
	c.last_name,
	a.address_id
From
	c.address_id 
	join a.address_id on c.address_id = a.address_id
;

#Left join

Select
	c.customer_id,
	c.first_name,
	c.last_name,
	a.address_id
From
	c.address_id 
	left join a.address_id on c.address_id = a.address_id
;