-- This is a comment

--CRUD
--Create, Read, Update, Delete

--Creating Data
--INSERT 

--Reading Data
--SELECT

--Updating Data
--UPDATE

--Deleting Data
--DELETE

-- Get all columns from out actor table
SELECT * -- * menas get all columns
FROM film;-- use semicolon to seperate different commands


--Get specific columns from our tables

SELECT title, description, release_year
FROM film;

-- Conditional queries. WHERE clause
SELECT *
FROM film
WHERE rental_rate < 4;

-- Conditional Queries w/ string type
SELECT *
FROM actor
WHERE first_name = 'Nick'; --must use single quotes

-- Conditional query with LIKE
SELECT * 
FROM actor
WHERE first_name LIKE 'Ni%'; -- like is the same as = by default, but allows us to use things like % which means 'starts with Ni, but can have any ending'
-- % can be anywhere and will return if someone has character is anywhere in the string
-- "%" - wildcard, this allows you to have any number of any character in the place that the % is

SELECT *
FROM actor
WHERE first_name LIKE 'N%k';

SELECT *
FROM actor
WHERE first_name LIKE '___k'; -- This will find the variable in the certain position. So any name with k in the fourth position
-- '_' Placeholders, it allows any character but exactly ONE of that character

SELECT *
FROM actor
WHERE first_name LIKE 'K___%n'; -- this means at least three characters bc of underscores, but could be any amount bc of percent sign

-- Comparing operators
-- '=' Compares if things are equal
--'<' Compares if something is less than something else
--'>' Compares if something is greater than something else
-- '<>' Compares if something is not equal to something else
-- '<=' less than or equal to
-- '>=' Greater than or equal to

SELECT *
FROM payment
WHERE amount < 5.99;

SELECT *
FROM payment
WHERE amount > 2.99;

--Get all payments that are NOT 5.99
SELECT *
From payment
WHERE amount <> 5.99;

--Compound where clause
SELECT *
From payment
WHERE amount = 5.99 OR amount = 7.99 OR amount = 1.99;

-- Get all payments where amount is 5.99 or 7.99 and the payment was handled by staff #2
SELECT *
FROM payment
WHERE (amount = 5.99 OR amount = 7.99) AND staff_id = 2;

-- Exercise
-- Get all rentals handled by staff #1, where the customers id is greater than 400

SELECT *
FROM rental
WHERE staff_id = 1 AND customer_id > 400;

SELECT *
FROM payment
WHERE amount BETWEEN 2.99 AND 7.99; -- Between is inclusive

--ORDER 

-- Order payments from smallest to largest

SELECT *
FROM payment
ORDER BY amount; -- by default order is ascending

-- Order payments from largest to smallest
SELECT *
FROM payment
ORDER BY amount DESC; -- DESC is descending

--Query for data that shows customers who paid
--an amount NOT EQUAL to 0.00
-- Order the results in DESCENDING order

SELECT *
FROM payment
WHERE amount <> 0.00
ORDER BY amount DESC;

-- Aggregate Functions => SUM(), AVG(), COUNT(), MIN(), MAX()
-- Total payment amount
SELECT SUM(amount)
FROM payment;

-- Find the total payments handled by staff #1
SELECT SUM(amount)
FROM payment
WHERE staff_id = 1;

--You are customer 13, find the total amount you've spent on rentals over 4.99
SELECT SUM(amount)
FROM payment
WHERE customer_id = 13 AND amount > 4.99;

-- Find the average payment NOT including FREE rentals
SELECT AVG(amount)
FROM payment
WHERE amount > 0;

-- Find the minimum payment
SELECT MIN(amount)
FROM payment;

-- Find maximum payment
SELECT MAX(amount)
FROM payment;

-- Find how many records are in the payment table
SELECT COUNT(amount)
FROM payment;

-- Select the amount of 5.99 payments
SELECT COUNT(*)
FROM payment
WHERE amount = 5.99;

-- Column Alias
SELECT SUM(amount) AS total_sum -- renames the column
FROM payment;


-- Get all unique first names ot actors
SELECT DISTINCT first_name
FROM actor
ORDER BY first_name;

-- How many unique first names of actors are there
SELECT COUNT(DISTINCT first_name)
FROM actor;

-- GROUP BY clause
-- Is used with aggregate function

-- Find the total payments handled by each staff member
SELECT staff_id, SUM(amount)-- two things seperated by commas will return multiple columns
FROM payment
GROUP BY staff_id;

--Find the amount of rentals rented at each payment rate
SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount;

-- What is the most common payment rental?
SELECT amount, COUNT(amount) AS rental_count
FROM payment
GROUP BY amount
ORDER BY rental_count DESC
LIMIT 1;

--HAVING clause
-- Is the same idea as the where clase, but it's for GROUP Bys

--Find the most common payment below 4.99
SELECT amount, COUNT(amount) AS rental_count
FROM payment
WHERE amount < 4.99
GROUP BY amount
ORDER BY rental_count DESC;

SELECT staff_id, SUM(amount)
FROM payment
WHERE staff_id < 2
GROUP BY staff_id;

-- Find the most common payment below 4.99
SELECT amount, COUNT(amount) AS rental_count
FROM payment
GROUP BY amount
HAVING COUNT(amount) > 1000
ORDER BY rental_count DESC;


SELECT rating, SUM(replacement_cost)
FROM film
GROUP BY rating
HAVING SUM(replacement_cost) > 3600
ORDER BY rating DESC;
