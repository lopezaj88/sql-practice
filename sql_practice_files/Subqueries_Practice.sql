-- SUBQUERIES

SELECT *
FROM employee_demographics
WHERE employee_id IN 
		(SELECT employee_id
			FROM employee_salary
            WHERE dept_id = 1)
-- Can only have one column in the subquery
;

SELECT first_name 
,salary
,(SELECT AVG(salary) FROM employee_salary)
FROM employee_salary
;

SELECT AVG(max_age)
FROM
(
SELECT gender
,AVG(age) AS avg_age
,MAX(age) AS max_age
,MIN(age) AS min_age
,COUNT(age) AS count_age
FROM employee_demographics
GROUP BY gender
) AS Agg_table
;