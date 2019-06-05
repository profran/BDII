--1
SELECT
	*
FROM
	film
LEFT JOIN inventory ON
	film.film_id = inventory.film_id
WHERE
	inventory.inventory_id IS NULL;

--2
SELECT
	*
FROM
	inventory
LEFT JOIN rental ON
	inventory.inventory_id = rental.inventory_id
WHERE
	rental.inventory_id IS NULL;


--3
SELECT
	customer.first_name,
	customer.last_name,
	customer.store_id,
	film.title,
	rental.rental_date,
	rental.return_date
FROM
	customer
INNER JOIN rental ON
	customer.customer_id = rental.customer_id
INNER JOIN inventory ON
	rental.inventory_id = inventory.inventory_id
INNER JOIN film ON
	inventory.film_id = film.film_id
WHERE
	rental.return_date IS NOT NULL
ORDER BY
	customer.customer_id;

--4
SELECT
	city.city,
	country.country,
	staff.first_name,
	SUM(payment.amount)
FROM
	payment
INNER JOIN customer ON
	payment.customer_id = customer.customer_id
INNER JOIN store ON
	customer.store_id = store.store_id
INNER JOIN staff ON
	store.store_id = staff.store_id
INNER JOIN address ON
	store.address_id = address.address_id
INNER JOIN city ON
	address.city_id = city.city_id
INNER JOIN country ON
	city.country_id = country.country_id
GROUP BY
	customer.store_id, staff.staff_id;
--5
SELECT
	CONCAT_WS(" ", a.first_name, a.last_name) as "Name",
	COUNT(fa.actor_id) as cnt
FROM
	film_actor fa
INNER JOIN actor a
		USING (actor_id)
GROUP BY
	fa.actor_id
ORDER BY
	cnt DESC
LIMIT 1;