SELECT *
FROM employee_salary
WHERE first_name = 'Leslie'
;

SELECT *
FROM employee_salary
WHERE salary >= 50000
;

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01' 
;

-- AND OR NOT --
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'male'
;

-- LIKE Statement--
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a%'
;