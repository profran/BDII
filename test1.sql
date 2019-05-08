--1
SELECT
	f1.title,
	f1.`length`,
	actor.first_name,
	actor.last_name
FROM
	film f1
INNER JOIN film_actor on
	f1.film_id = film_actor.film_id
INNER JOIN actor on
	film_actor.actor_id = actor.actor_id
WHERE
	NOT EXISTS (
	SELECT
		f2.film_id
	FROM
		film f2,
		film_actor fa
	WHERE
		f1.`length` > f2.`length`
		AND f1.film_id <> f2.film_id);
--2
SELECT
	address.address,
	address.district,
	address.postal_code
FROM
	address
INNER JOIN city on
	address.city_id = city.city_id
INNER JOIN country on
	city.country_id = country.country_id
WHERE
	country.country LIKE '%a'
	AND city.city LIKE 'E%'
ORDER BY country.country, city.city;
--3
SELECT
	category.name,
	film.title,
	`language`.name,
	film.rental_rate
FROM
	film
INNER JOIN film_category ON
	film.film_id = film_category.film_id
INNER JOIN category ON
	film_category.category_id = category.category_id
INNER JOIN `language` ON
	film.language_id = `language`.language_id
WHERE
	category.name IN ('Comedy',
	'Children',
	'Animation')
	AND film.rental_rate < 3
ORDER BY
	category.name,
	film.rental_rate ASC,
	film.title;

