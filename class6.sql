--1
SELECT last_name FROM actor a1 WHERE EXISTS 
    (SELECT a2.actor_id FROM actor a2 WHERE a1.last_name = a2.last_name AND a1.actor_id <> a2.actor_id);
--2
SELECT c.first_name FROM customer c, rental r WHERE c.customer_id = r.customer_id GROUP BY c.customer_id;
--3
SELECT c.first_name FROM customer c, rental r WHERE c.customer_id = r.customer_id 
    GROUP BY c.customer_id HAVING COUNT(r.rental_id) = 1;
--4
SELECT c.first_name FROM customer c, rental r WHERE c.customer_id = r.customer_id 
    GROUP BY c.customer_id HAVING COUNT(r.rental_id) > 1
--5
SELECT a.actor_id FROM actor a WHERE a.actor_id IN (SELECT f.actor_id FROM film_actor f WHERE f.film_id IN 
    (SELECT fm.film_id FROM film fm WHERE fm.title = 'BETRAYED REAR') 
    OR fm.title = 'CATCH AMISTAD');
--6
SELECT a.actor_id FROM actor a WHERE a.actor_id IN 
    (SELECT f.actor_id FROM film_actor f WHERE f.film_id IN 
        (SELECT fm.film_id FROM film fm WHERE fm.title = 'BETRAYED REAR' AND fm.title <> 'CATCH AMISTAD'));
--7
SELECT a.actor_id FROM actor a WHERE a.actor_id IN 
    (SELECT f.actor_id FROM film_actor f WHERE f.film_id IN 
        (SELECT fm.film_id FROM film fm WHERE fm.title = 'BETRAYED REAR')) 
    AND a.actor_id IN (SELECT f.actor_id FROM film_actor f WHERE f.film_id IN 
        (SELECT fm.film_id FROM film fm WHERE fm.title = 'CATCH AMISTAD'));
--8
SELECT a.actor_id FROM actor a WHERE a.actor_id NOT IN 
    (SELECT f.actor_id FROM film_actor f WHERE f.film_id IN 
        (SELECT fm.film_id FROM film fm WHERE fm.title = 'BETRAYED REAR')) 
    AND a.actor_id NOT IN (SELECT f.actor_id FROM film_actor f WHERE f.film_id IN 
        (SELECT fm.film_id FROM film fm WHERE fm.title = 'CATCH AMISTAD'));
