--2a
--1. Get list of tables 
SELECT table_name
FROM information_schema.tables
WHERE table_schema='public'
AND table_type='BASE TABLE';



--2. Get list of columns and data types
SELECT column_name, data_type
FROM information_schema.columns

--3. Get list of Schema, tables, columns.
SELECT table_schema, table_name, column_name
FROM information_schema.columns
ORDER BY table_schema, table_name

--4. Get list of constraints (Primary Key, Foreign Key, Check Constraints).
SELECT conname AS constraint_name, 
       conrelid::regclass AS table_name, 
       pg_get_constraintdef(c.oid) AS constraint_definition
FROM pg_constraint c
JOIN pg_namespace n ON n.oid = c.connamespace
WHERE contype IN ('p', 'f', 'c')
ORDER BY conrelid::regclass::text, contype DESC;


--5. What is difference between Primary Key, Foreign Key and Unique Contraints.
a primary key is used to uniquely identify records in a table,
while a foreign key is used to establish a relationship between tables.
A unique constraint is used to ensure that the values in a column or a combination of columns are unique.
--6. Get list of indexes for each tables.
SELECT tablename, indexname, indexdef
FROM pg_indexes
WHERE schemaname = 'public'
ORDER BY tablename, indexname;
--7. Understand table structures along with relationships, for each table look at data and see if they are in 1 Normal form,
--2nd Normal Form or 3rd Normal form. Format should be
--<Table> <Name> <Normal Form Reason>
actor - First normal form (1NF), Second normal form (2NF), and Third normal form (3NF).
1NF: Each column contains atomic values.
2NF: There is a primary key (actor_id) and all non-key columns depend on the primary key.
3NF: There are no transitive dependencies.


store - 1NF, 2NF, and 3NF.
1NF: Each column contains atomic values.
2NF: There is a primary key (store_id) and all non-key columns depend on the primary key.
3NF: There are no transitive dependencies.


payment - 1NF, 2NF, and 3NF.
1NF: Each column contains atomic values.
2NF: There is a primary key (payment_id) and all non-key columns depend on the primary key.
3NF: There are no transitive dependencies.


film - 1NF, 2NF, and 3NF.
1NF: Each column contains atomic values.
2NF: There is a primary key (film_id) and all non-key columns depend on the primary key.
3NF: There are no transitive dependencies.


payment_p2007_02 - 1NF, 2NF, and 3NF.
1NF: Each column contains atomic values.
2NF: There is a primary key (payment_id) and all non-key columns depend on the primary key.
3NF: There are no transitive dependencies.


payment_p2007_03 - 1NF, 2NF, and 3NF.
1NF: Each column contains atomic values.
2NF: There is a primary key (payment_id) and all non-key columns depend on the primary key.
3NF: There are no transitive dependencies.


payment_p2007_04 - 1NF, 2NF, and 3NF.
1NF: Each column contains atomic values.
2NF: There is a primary key (payment_id) and all non-key columns depend on the primary key.
3NF: There are no transitive dependencies.


payment_p2007_05 - 1NF, 2NF, and 3NF.
1NF: Each column contains atomic values.
2NF: There is a primary key (payment_id) and all non-key columns depend on the primary key.
3NF: There are no transitive dependencies.


payment_p2007_06 - 1NF, 2NF, and 3NF.
1NF: Each column contains atomic values.
2NF: There is a primary key (payment_id) and all non-key columns depend on the primary key.
3NF: There are no transitive dependencies.


payment_p2007_01 - 1NF, 2NF, and 3NF.
1NF: Each column contains atomic values.
2NF: There is a primary key (payment_id) and all non-key columns depend on the primary key.
3NF: There are no transitive dependencies.

address - 1NF, 2NF, and 3NF.
1NF: Each column contains atomic values.
2NF: There is a primary key (address_id) and all non-key columns depend on the primary key.
3NF: There are no transitive dependencies.


category - 1NF, 2NF, and 3NF.
1NF: Each column contains atomic values.
2NF: There is a primary key (category_id) and all non-key columns depend on the primary key.
3NF: There are no transitive dependencies.


city - 1NF, 2NF, and 3NF.
1NF: Each column contains atomic values.
2NF: There is a primary key (city_id) and all non-key columns depend on the primary key.
3NF: There are no transitive dependencies.


country - 1NF, 2NF, and 3NF.
1NF: Each column contains atomic values.
2NF: There is a primary key (country_id) and all non-key columns depend on the primary key.
3NF: There are no transitive dependencies.


customer - 1NF, 2NF, and 3NF.
1NF: Each column contains atomic values.
2NF: There is a primary key (customer_id) and all non-key columns depend on the primary key.
3NF: There are no transitive dependencies.


film_actor - 1NF, 2NF, and 3NF.
1NF: Each column contains atomic values.
2NF: There is a composite primary key (actor_id, film_id) and all non-key columns depend on the primary key.
3NF: There are no transitive dependencies.


film_category - 1NF, 2NF, and 3NF.
1NF: Each column contains atomic values.
2NF: There is a composite primary key (film_id, category_id) and all non-key columns depend on the primary key.
3NF: There are no transitive dependencies.


inventory - 1NF, 2NF, and 3NF.
1NF: Each column contains atomic values.
2NF: There is a primary key (inventory_id) and all non-key columns depend on the primary key.
3NF: There are no transitive dependencies.


language - 1NF, 2NF, and 3NF.
1NF: Each column contains atomic values.
2NF: There is a primary key (language_id) and all non-key columns depend on the primary key.
3NF: There are no transitive dependencies.


rental - 1NF, 2NF, and 3NF.
1NF: Each column contains atomic values.
2NF: There is a primary key (rental_id) and all non-key columns depend on the primary key.
3NF: There are no transitive dependencies.


staff - 1NF, 2NF, and 3NF.
1NF: Each column contains atomic values.
2NF: There is a primary key (staff_id) and all non-key columns depend on the primary key.
3NF: There are no transitive dependencies.


--8. Create Database diagram for tables in shakila using https://dbdiagram.io/home/ and send the screenshots.
--Attached in mail(Screenshots).


--9. Calculate size of each table and total database size.
SELECT
  pg_class.relname AS table,
  pg_size_pretty(pg_total_relation_size(pg_class.oid)) AS size
FROM pg_class
LEFT JOIN pg_namespace ON pg_namespace.oid = pg_class.relnamespace
WHERE pg_namespace.nspname = 'public'
AND pg_class.relkind = 'r'
ORDER BY pg_total_relation_size(pg_class.oid) DESC;

--total database size
SELECT pg_size_pretty(pg_database_size(current_database())) AS size;

--10. Get list of users and related permissions.
SELECT
    r.rolname AS user_name,
    string_agg(t.table_name || '.' || c.column_name, ', ') AS permissions
FROM
    pg_roles r
LEFT JOIN
    information_schema.role_table_grants rtg ON r.rolname = rtg.grantee
LEFT JOIN
    information_schema.columns c ON rtg.table_name = c.table_name
        AND rtg.table_schema = c.table_schema
LEFT JOIN
    information_schema.tables t ON c.table_name = t.table_name
        AND c.table_schema = t.table_schema
WHERE
    r.rolcanlogin = 'true' -- only get roles that can login
GROUP BY
    r.rolname;
	
	

--2b
--Join
--1. Get first_name , last_name for actors
SELECT first_name, last_name
FROM Actor;

--2. Get first_name, last_name only 5 rows.
SELECT first_name, last_name
FROM Actor
LIMIT 5;

--3. Get first_name, last_name of 5 actors who have been modified last
SELECT first_name, last_name
FROM Actor
ORDER BY last_update DESC
LIMIT 5;

--4. Get top 5 repeating last_names of actors.
SELECT last_name, COUNT(*) as count
FROM Actor
GROUP BY last_name
ORDER BY count DESC
LIMIT 5;

--5. Get top 6 repeating first_name of actors.
SELECT first_name, COUNT(*) as count
FROM Actor
GROUP BY first_name
ORDER BY count DESC
LIMIT 6;

--6. Get count of films in table
SELECT DISTINCT COUNT(*) FROM film;

--7. What is average movie length (use length column)
SELECT AVG(length) as avg_length
FROM film;



--8. Count of movies for each rating (use rating column)
SELECT rating, COUNT(*) as count
FROM film
GROUP BY rating;


--9. Get list of horror movies
SELECT *
FROM category
WHERE LOWER(name) LIKE '%horror%';


--10. Movies that contain CAT in title.
SELECT title
FROM film
WHERE LOWER(title) LIKE '%cat%';


--11. How many movie categories are there?
SELECT COUNT(DISTINCT name) AS num_categories
FROM category;

--12. Are category names repeating ?
SELECT DISTINCT name
FROM category
Select name from category
--as both distinct and non-distinct function have same no. of rows the category names arent repeating.


--13. how many countries and cities ?
SELECT COUNT(DISTINCT country) AS num_countries
FROM country;
SELECT COUNT(DISTINCT city) AS num_cities
FROM city;

--14. For each country get the list of cities.
SELECT c.country, string_agg(ct.city, ', ' ORDER BY ct.city ASC) AS cities
FROM country c
JOIN city ct ON c.country_id = ct.country_id
GROUP BY c.country;


--15. Get list of active customers;
SELECT cu.customer_id, cu.first_name, cu.last_name, COUNT(re.rental_id) AS num_rentals
FROM customer cu
JOIN rental re ON cu.customer_id = re.customer_id
GROUP BY cu.customer_id
HAVING COUNT(re.rental_id) > 0;


--16. Do any customer share same emailID
SELECT email, COUNT(*) AS num_customers
FROM customer
GROUP BY email
HAVING COUNT(*) > 1;
--No results given hence no customers with same email are present.

--17. List of customers with same lastname
SELECT last_name, COUNT(*) AS num_customers
FROM customer
GROUP BY last_name
HAVING COUNT(*) > 1;
--No results found 

--18. Total movies that are categoried
SELECT COUNT(DISTINCT film_id) AS num_movies_categorized
FROM film_category;


--19. Total rows in inventory
SELECT COUNT(*) AS num_rows
FROM inventory;

--2c



--1. Find actors who acted in film "Lost Bird"
SELECT actor.actor_id,f.film_id,first_name,last_name
FROM actor 
JOIN film_actor fa ON fa.actor_id = actor.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'LOST BIRD';


--for cross checking
SELECT * FROM public.film_actor
where film_id=533
ORDER BY actor_id ASC, film_id ASC 



--2. Find movies of "Sci-Fi" genre
select title from film f
join film_category fc on fc.film_id = f.film_id
where fc.category_id=14 --category id for sci fi movie is 14


--3. Find movies of actress first_name: "PENELOPE"	last_name:"GUINESS"
SELECT title
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor ON fa.actor_id = actor.actor_id
WHERE actor.first_name = 'PENELOPE' AND actor.last_name = 'GUINESS';



--4. list Genres, movies (in each Genre), actors in each movie
SELECT c.category_id, ARRAY_AGG(DISTINCT f.title) AS films, ARRAY_AGG(DISTINCT a.first_name) AS actors
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
GROUP BY c.category_id
ORDER BY c.category_id;
--in list format

SELECT c.name AS category_name, f.title AS film_title, a.First_name AS actor_name
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
GROUP BY c.name, f.title, a.first_name
ORDER BY f.title;
--in ungrouped format



--5. List films that are rented from inventory
SELECT f.film_id, f.title, f.release_year, f.description
FROM inventory i
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE r.return_date IS NULL
ORDER BY f.title;



--6. List genres corresponding movies rented by customer.
SELECT c.name AS genre, f.title AS film_title, cu.first_name || ' ' || cu.last_name AS name
FROM inventory i
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
JOIN customer cu ON r.customer_id = cu.customer_id
ORDER BY c.name, f.title;


--7. List 5 rows of customer which have renated "Horror" generes.
SELECT DISTINCT ON (c.customer_id) c.customer_id, c.first_name || ' ' || c.last_name AS customer_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c2 ON fc.category_id = c2.category_id
WHERE c2.name = 'Horror'
ORDER BY c.customer_id, r.rental_date
LIMIT 5;



--8. List 5 staff members who have given maximum movies on rent (best performers)
SELECT s.staff_id, CONCAT(s.first_name, ' ', s.last_name) AS staff_name, COUNT(r.rental_id) AS rental_count
FROM staff s
JOIN rental r ON s.staff_id = r.staff_id
GROUP BY s.staff_id
ORDER BY rental_count DESC
LIMIT 5;



--9. List top movies types Genre (by count) rented by customers.
SELECT c.name AS genre_name, COUNT(r.rental_id) AS rental_count
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY rental_count DESC
LIMIT 16;



--10. List top movies (by count) by Genre (by count) in the inventory.
SELECT c.name AS genre_name, f.title AS movie_title, COUNT(i.inventory_id) AS inventory_count
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
GROUP BY c.name, f.title
ORDER BY COUNT(i.inventory_id) DESC, c.name, f.title
LIMIT 10;



--11. List of actors who have not acted in any flim.
SELECT *
FROM actor
WHERE actor.actor_id NOT IN (
    SELECT DISTINCT actor_id
    FROM film_actor
);



--12. List of films that are not in inventory
SELECT film.film_id, film.title
FROM film
LEFT JOIN inventory ON film.film_id = inventory.film_id
WHERE inventory.inventory_id IS NULL;



--13. List of actors who are not in inventory
SELECT actor.actor_id, actor.first_name, actor.last_name
FROM actor
WHERE actor.actor_id NOT IN (
  SELECT DISTINCT film_actor.actor_id
  FROM inventory
  JOIN rental ON inventory.inventory_id = rental.inventory_id
  JOIN film ON inventory.film_id = film.film_id
  JOIN film_actor ON film.film_id = film_actor.film_id
);


--14. List of actors whose movies are not stores.
SELECT a.actor_id, a.first_name, a.last_name
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
WHERE fa.film_id IS NULL;



--15. List of staff who have not rented movies.
SELECT s.staff_id, s.first_name, s.last_name
FROM staff s
WHERE s.staff_id NOT IN (
  SELECT r.staff_id
  FROM rental r
)


--16. categories which do not have movies.
SELECT c.category_id, c.name
FROM category c
LEFT JOIN film_category fc ON c.category_id = fc.category_id
WHERE fc.film_id IS NULL;


--17. Actors who acted in all movie categories
SELECT a.actor_id, a.first_name, a.last_name
FROM actor a
WHERE NOT EXISTS (
    SELECT c.category_id
    FROM category c
    WHERE NOT EXISTS (
        SELECT fc.film_id
        FROM film_category fc
        JOIN film_actor fa ON fc.film_id = fa.film_id
        WHERE fc.category_id = c.category_id
        AND fa.actor_id = a.actor_id
    )
);




--18. Actors who did NOT act in all movie categories
SELECT a.actor_id, a.first_name, a.last_name
FROM actor a
WHERE a.actor_id NOT IN (
    SELECT fa.actor_id
    FROM film_actor fa
    JOIN film_category fc ON fa.film_id = fc.film_id
    GROUP BY fa.actor_id
    HAVING COUNT(DISTINCT fc.category_id) = (SELECT COUNT(*) FROM category)
)
ORDER BY a.last_name, a.first_name;





--19. List of stores with address, city, countries.
SELECT store.store_id, address.address, city.city, country.country
FROM store
JOIN address ON store.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id;


--20. List of stores that do not have inventory.
SELECT *
FROM store
WHERE store_id NOT IN (
    SELECT DISTINCT store_id
    FROM inventory
);




--21. List of customers who do not have movie rentals.
SELECT *
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
WHERE r.rental_id IS NULL;



--22. List of Customers in India with address.
SELECT c.first_name || ' ' || c.last_name AS customer_name, a.address, a.city_id, co.country
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
where country = 'India'
ORDER BY co.country, a.city_id, a.address;


--23. List of Customers with address all over the world.
SELECT c.first_name || ' ' || c.last_name AS customer_name, a.address, a.city_id, co.country
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
ORDER BY co.country, a.city_id, a.address;


--24. List of movies made in Japanese or Mandarin.
SELECT title, language.name AS language
FROM film
JOIN language ON film.language_id = language.language_id
WHERE language.name IN ('Japanese', 'Mandarin');




--25. List of languages with no movies.
SELECT name
FROM language
WHERE language_id NOT IN (
  SELECT DISTINCT language_id
  FROM film
  WHERE language_id IS NOT NULL
)


--2d

--1. Count of movies acted by actor with actor list in descending order (by count of movies acted).

SELECT a.actor_id, a.first_name || ' ' || a.last_name AS actor_name, COUNT(fa.film_id) AS movie_count
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY movie_count DESC;

--2. Which actor has highest "Average movie rating"
SELECT a.first_name || ' ' || a.last_name AS actor_name, AVG(f.rental_rate) AS avg_rental_rate
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
GROUP BY a.actor_id
ORDER BY avg_rental_rate DESC
LIMIT 1;


--3. Count of movies per language
SELECT language.name AS language_name, COUNT(film.language_id) AS movie_count
FROM language
LEFT JOIN film ON language.language_id = film.language_id
GROUP BY language.name
ORDER BY movie_count DESC;

--4. Movie collection by stores 
SELECT s.store_id, a.city_id, f.title
FROM store s
JOIN address a ON s.address_id = a.address_id
JOIN inventory i ON s.store_id = i.store_id
JOIN film f ON i.film_id = f.film_id
ORDER BY s.store_id, f.title;


--4.1 How many movies of same film are stored in each store
SELECT s.store_id, i.film_id, COUNT(*) AS num_movies
FROM store AS s
JOIN inventory AS i ON s.store_id = i.store_id
GROUP BY s.store_id, i.film_id;


--4.2 How many unique movies in each store.
SELECT 
  s.store_id, 
  COUNT(DISTINCT i.film_id) AS unique_movies_count
FROM 
  store AS s 
  JOIN inventory AS i ON s.store_id = i.store_id
GROUP BY 
  s.store_id;
  
--5. Average length of movies.
 SELECT AVG(length) AS average_length FROM film;
  
  
--6. Which language movies are longest 
SELECT f.language_id, l.name AS language, AVG(f.length) AS avg_length
FROM film AS f
JOIN language AS l ON f.language_id = l.language_id
GROUP BY f.language_id, l.name
ORDER BY avg_length DESC;



--7. Which language movies have highest rating
SELECT l.name AS language_name, f.rating
FROM film f
JOIN language l ON f.language_id = l.language_id
WHERE f.rating = (SELECT MAX(rating) FROM film)
order by f.rating
limit 1;



--8. Count of movies by category
SELECT c.name AS category, COUNT(*) AS movie_count
FROM film_category AS fc
JOIN category AS c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY movie_count DESC;

--9. Top 3 actors who worked in horror movies
SELECT a.actor_id, a.first_name || ' ' || a.last_name AS actor_name, COUNT(*) AS movie_count
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Horror'
GROUP BY a.actor_id
ORDER BY COUNT(*) DESC
LIMIT 3;

--10. Top 3 actors who acted in action or romantic movies.
SELECT a.first_name || ' ' || a.last_name AS actor_name, COUNT(*) AS movie_count
FROM actor AS a
INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id
INNER JOIN film AS f ON fa.film_id = f.film_id
INNER JOIN film_category AS fc ON f.film_id = fc.film_id
INNER JOIN category AS c ON fc.category_id = c.category_id
WHERE c.name IN ('Action', 'Romance')
GROUP BY a.actor_id
ORDER BY movie_count DESC
LIMIT 3;

--11. Count of movies rented by Country
SELECT co.country, COUNT(*) AS total_movies_rented
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
GROUP BY co.country
ORDER BY total_movies_rented DESC;


--12. Top 3 film renting customers in each city of every country.
WITH cte AS (
  SELECT
    co.country,
    ci.city,
    cu.customer_id,
    cu.first_name || ' ' || cu.last_name AS customer_name,
    COUNT(re.rental_id) AS rentals_count,
    ROW_NUMBER() OVER (PARTITION BY co.country, ci.city ORDER BY COUNT(re.rental_id) DESC) AS row_num
  FROM
    country co
    JOIN city ci ON co.country_id = ci.country_id
    JOIN address ad ON ci.city_id = ad.city_id
    JOIN customer cu ON ad.address_id = cu.address_id
    JOIN rental re ON cu.customer_id = re.customer_id
  GROUP BY
    co.country,
    ci.city,
    cu.customer_id,
    customer_name
)
SELECT
  country,
  city,
  customer_name,
  rentals_count
FROM
  cte
WHERE
  row_num <= 3
ORDER BY
  country,
  city,
  rentals_count DESC;
  


--13. Number of employees in each store
SELECT s.store_id, COUNT(*) AS num_employees
FROM staff st
JOIN store s ON st.store_id = s.store_id
GROUP BY s.store_id;



--14. Min, Max, average, 90 percentile of rental amount paid by customers in each country.
	Paraphrashing, which country provides more early opportunity.
SELECT 
  co.country, 
  MIN(p.amount) AS min_rental_amount, 
  MAX(p.amount) AS max_rental_amount, 
  AVG(p.amount) AS avg_rental_amount, 
  percentile_cont(0.9) WITHIN GROUP (ORDER BY p.amount) AS percentile_90
FROM 
  payment p 
  JOIN customer c ON p.customer_id = c.customer_id 
  JOIN address a ON c.address_id = a.address_id 
  JOIN city ci ON a.city_id = ci.city_id 
  JOIN country co ON ci.country_id = co.country_id 
GROUP BY 
  co.country;


--15. Which employee has rented move movies and what is earning amount per flim.
SELECT CONCAT(s.first_name, ' ', s.last_name) AS staff_name, COUNT(r.rental_id) AS num_rentals, SUM(p.amount) AS total_earning, AVG(p.amount) AS avg_earning_per_film
FROM staff s
JOIN rental r ON s.staff_id = r.staff_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY s.staff_id
ORDER BY total_earning DESC;






