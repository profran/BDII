--1
SELECT country.country, COUNT(country) FROM country 
    INNER JOIN city ON country.country_id = city.country_id 
    GROUP BY country, country.country_id 
    ORDER BY country.country, country.country_id;
--2
SELECT country.country, COUNT(country) FROM country 
    INNER JOIN city ON country.country_id = city.country_id 
    GROUP BY country HAVING COUNT(country) > 10 
    ORDER BY COUNT(country) DESC;
--3
SELECT c1.customer_id, 
	(SELECT COUNT(*) FROM rental WHERE rental.customer_id = c1.customer_id) AS total_rental,
	(SELECT SUM(payment.amount) FROM rental 
		INNER JOIN payment ON rental.rental_id = payment.rental_id 
			WHERE rental.customer_id = c1.customer_id) AS total_spent
FROM customer c1 ORDER BY suma DESC;
--4
SELECT ct.name, 
	(SELECT AVG(film.`length`) FROM film 
		INNER JOIN film_category ON film.film_id = film_category.film_id 
		    WHERE film_category.category_id = ct.category_id) AS avg_len 
FROM category ct ORDER BY avg_len DESC;
--5
SELECT film.rating, SUM(payment.amount) AS amnt 
	FROM payment INNER JOIN rental ON payment.rental_id = rental.rental_id 
		INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id 
			INNER JOIN film ON inventory.film_id = film.film_id 
GROUP BY film.rating ORDER BY amnt DESC;
