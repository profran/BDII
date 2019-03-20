DROP DATABASE IF EXISTS imdb;

CREATE DATABASE imdb;

USE imdb;

CREATE TABLE IF NOT EXISTS film (
    film_id int(11) UNIQUE NOT NULL AUTO_INCREMENT,
    title VARCHAR(20) NOT NULL,
    description VARCHAR(200),
    release_date DATE NOT NULL,
    CONSTRAINT film_id_pk PRIMARY KEY (film_id)
);

CREATE TABLE IF NOT EXISTS actor (
    actor_id int(11) UNIQUE NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR(15)
    CONSTRAINT actor_id_pk PRIMARY KEY (actor_id)
);

CREATE TABLE IF NOT EXISTS film_actor (
    actor_id int(11) NOT NULL,
    film_id int(11) NOT NULL
);

ALTER TABLE film ADD last_update TIMESTAMP;
ALTER TABLE actor ADD last_update TIMESTAMP;

ALTER TABLE ADD CONSTRAINT actor_id_fk FOREIGN KEY actor_id REFERENCES actor(actor_id);
ALTER TABLE ADD CONSTRAINT film_id_fk FOREIGN KEY film_id REFERENCES film(film_id);

INSERT INTO actor (first_name, last_name) VALUES ('Johnny', 'Sins');
INSERT INTO actor (first_name, last_name) VALUES ('Airi', 'Akisuki');

INSERT INTO film_actor (actor_id, film_id) VALUES (1, 1);
