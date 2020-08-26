-- Create a new file named group_by_exercises.sql

-- In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.

-- 7 unique titles
SELECT count(distinct title)
FROM titles; 

-- Write a query to to find a list of all unique last names of current or previous employees that start and end with 'E' using GROUP BY.

SELECT last_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E'
GROUP BY last_name;

-- Write a query to to find all unique combinations of first and last names of previous employees whose last names start and end with 'E'.

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E'
GROUP BY first_name, last_name;

-- rite a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.

SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';

-- Add a COUNT() to your results (the query above) and use ORDER BY to make it easier to find employees whose unusual name is shared with others.

SELECT last_name, COUNT(*)
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name
ORDER BY COUNT(*);

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.

SELECT COUNT(*) as Gender_Count, gender
FROM employees
WHERE first_name in ('Irena', 'Vidya', 'Maya')
GROUP BY gender
ORDER BY COUNT(*) DESC;

-- Using youre query that generates a username for all of the current and previous employees, generate a count employees for each unique username. 

SELECT 
	CONCAT(LOWER(SUBSTR(first_name, 1, 1)), LOWER(SUBSTR(last_name, 1, 4)) , "_", SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2)) as USERNAME, 
	COUNT(*)
FROM employees
GROUP BY USERNAME
HAVING COUNT(*) > 1;


-- Are there any duplicate usernames? 

-- Yes there are depulicates since I was able to find results even after adding a condition that would only display a username if it was a duplicate. ie. HAVING COUNT(*) > 1

-- BONUS: How many duplicate usernames are there?

-- 13251 as shown in the details section below the results