-- 2- List all details of actors 

Select * from actor;

-- 3 -List all customer information from DB.

Select * from customer;

-- 4 -List different countries.

Select distinct country from country;

-- 5 -Display all active customers.

select customer_id, first_name, last_name from customer where active = 1;

-- 6 -List of all rental IDs for customer with ID 1.

SELECT r.rental_id FROM rental r WHERE r.customer_id = 1;
 
-- 7 - Display all the films whose rental duration is greater than 5 .

Select film_id, title from film where rental_duration > 5;

-- 8 - List the total number of films whose replacement cost is greater than $15 and less than $20.

Select count(film_id) total_number_of_films from film 
where replacement_cost > 15 and replacement_cost<20;

-- 9 - Display the count of unique first names of actors.

Select count(distinct first_name) count_of_unique_first_name from actor;

-- 10- Display the first 10 records from the customer table .

Select * from customer LIMIT 10;

-- 11 - Display the first 3 records from the customer table whose first name starts with ‘b’.

Select * from customer where first_name Like 'b%' LIMIT 3;

-- 12 -Display the names of the first 5 movies which are rated as ‘G’.

Select title from film where rating = 'G' LIMIT 5;

-- 13-Find all customers whose first name starts with "a".

Select customer_id, first_name, last_name from customer where first_name like 'a%';

-- 14- Find all customers whose first name ends with "a".

Select customer_id, first_name, last_name from customer where first_name like '%a';

-- 15- Display the list of first 4 cities which start and end with ‘a’ .

Select city from city where city like 'a%a' LIMIT 4;

-- 16- Find all customers whose first name have "NI" in any position.

Select * from customer where first_name like '%NI%';

-- 17- Find all customers whose first name have "r" in the second position .

Select * from customer where first_name like '_r%';

-- 18 - Find all customers whose first name starts with "a" and are at least 5 characters in length.

Select * from customer where first_name like 'a%' and length(first_name)>=5;

-- 19- Find all customers whose first name starts with "a" and ends with "o".

Select * from customer where first_name like 'a%o';

-- 20 - Get the films with pg and pg-13 rating using IN operator.

Select film_id, title, rating from film where rating IN('pg', 'pg-13');

-- 21 - Get the films with length between 50 to 100 using between operator.

Select film_id, title from film where length between 50 and 100;

-- 22 - Get the top 50 actors using limit operator.

Select actor_id, first_name, last_name from actor LIMIT 50;

-- 23 - Get the distinct film ids from inventory table

Select distinct film_id from inventory;