-- List the first 10 distinct last name sorted in descending order.

-- used distinct and order by to find unique employee last names and limit results to 10
SELECT DISTINCT last_name FROM employees
order by last_name desc
limit 10;

-- Find all previous or current employees hired in the 90s and born on Christmas. Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records. Write a comment in your code that lists the five names of the employees returned.

-- Khun, Elvis, Sachar, Moto, Ulf
SELECT first_name, last_name
FROM employees
WHERE birth_date LIKE '%12-25'
	AND (
		hire_date BETWEEN '1990-01-01' and '1999-12-31')
ORDER BY hire_date DESC
limit 5;

-- Try to think of your results as batches, sets, or pages. The first five results are your first page. The five after that would be your second page, etc. Update the query to find the tenth page of results.

-- Used offset to remove 45 results and limit to only show the 5 results after the 45 were skipped
SELECT first_name, last_name
FROM employees
WHERE birth_date LIKE '%12-25'
	AND (
		hire_date BETWEEN '1990-01-01' and '1999-12-31')
ORDER BY hire_date DESC
limit 5 offset 45;
