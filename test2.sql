--1
SELECT
	customer.first_name,
	customer.last_name,
	SUM(payment.amount) as amt,
	COUNT(payment.payment_id)
FROM
	payment
INNER JOIN customer
		USING(customer_id)
GROUP BY
	customer.customer_id
HAVING
	amt > 100
	AND amt < 150;

--2
SELECT
	country,
	name,
	COUNT(rental_id)
FROM
	rental
INNER JOIN customer
		USING(customer_id)
INNER JOIN address
		USING(address_id)
INNER JOIN city
		USING(city_id)
INNER JOIN country
		USING(country_id)
INNER JOIN inventory
		USING(inventory_id)
INNER JOIN film
		USING(film_id)
INNER JOIN film_category
		USING(film_id)
INNER JOIN category
		USING(category_id)
GROUP BY
	country_id,
	category_id;

--3
SELECT
	COUNT(rental.rental_id),
	film.rating
FROM
	rental
INNER JOIN inventory
		USING(inventory_id)
INNER JOIN film
		USING(film_id)
WHERE
	rental.return_date IS NULL
GROUP BY
	film.rating;

--4
SELECT
	actor.actor_id,
	actor.first_name,
	actor.last_name,
	COUNT(actor_id),
	customer.first_name,
	customer.last_name,
	customer.customer_id
FROM
	actor
INNER JOIN film_actor
		USING(actor_id)
RIGHT JOIN customer
		USING (last_name)
GROUP BY
	actor.actor_id,
	customer.customer_id
ORDER BY
	actor.last_name;