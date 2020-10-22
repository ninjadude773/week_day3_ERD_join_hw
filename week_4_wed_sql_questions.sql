
--1. List all customers who live in Texas (use JOINs)
SELECT customer.address_id,district,customer.first_name,customer.last_name
FROM customer
INNER JOIN address
ON address.address_id = customer.address_id
WHERE district = 'Texas'


--2. Get all payments above $6.99 with the Customer's Full Name

SELECT amount, first_name, last_name
FROM payment
INNER JOIN customer
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

-- INNER JOIN customer_id
-- ON customer.customer_id = payment.customer_id;




--3. Show all customers names who have made payments over $175(use subqueries) 
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);


--4. List all customers that live in Nepal (use the city table) Multi Join
SELECT first_name, last_name, city
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
WHERE city = 'Nepal'



--5. Which staff member had the most transactions? 
SELECT first_name, last_name,amount
FROM payment
INNER JOIN staff
ON staff.staff_id = payment.staff_id





--6. How many movies of each rating are there? 
SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating;





--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name, last_name
FROM CUSTOMER
WHERE customer.customer_id IN(
		SELECT customer_id
		FROM payment
		WHERE amount > 6.99
);



--8.How many free rentals did our stores give away?
--Needed to find payments that had missing values

SELECT COUNT(rental.rental_id) free_rentals
FROM rental
LEFT JOIN payment
ON payment.rental_id = rental.rental_id
WHERE payment IS NULL;
