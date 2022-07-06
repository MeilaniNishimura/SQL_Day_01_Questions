--  How many actors are there with the last name 'Wahlberg'?
SELECT last_name, COUNT (last_name)
FROM actor
WHERE last_name = 'Wahlberg'
GROUP BY last_name;

-- How many payments were made between 3.99 and 5.99?
SELECT COUNT(payment)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;


-- What film does the store have the most of? (search in inventory)
SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

-- How many customers have the last name 'Williams'?
SELECT last_name, COUNT (last_name)
FROM customer
WHERE last_name = 'Williams'
GROUP BY last_name;

-- What store employee (get the id) sold the most rentals?
SELECT staff_id, COUNT(rental)
FROM rental
GROUP BY staff_id;

-- How many different district names are there?
SELECT COUNT(DISTINCT district)
FROM address;

-- What film has the most actors in it?
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC
LIMIT 1;


-- From store_id 1, how many customers have a last name ending with 'es'?(use customer table)
SELECT COUNT(last_name), store_id
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es'
GROUP BY store_id;

-- How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT amount, COUNT(amount)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(amount) > 250;


-- Within the film table, how many rating catergories are there? And what rating has the most movies total?
SELECT DISTINCT rating, COUNT(film)
FROM film
GROUP BY rating
ORDER BY COUNT(film) DESC;






