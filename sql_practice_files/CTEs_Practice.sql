-- CTEs (Common Table Expressions)

With CTE_Example as
(
Select gender
,avg(salary) as avg_sal
,max(salary) as max_sal
,min(salary) as min_sal
,count(salary) as count_sal

From employee_demographics as dem
Join employee_salary as sal
	On dem.employee_id = sal.employee_id
Group By gender
)
Select avg(avg_sal)
From CTE_Example
;

-- More Complex
With CTE_Example as
(
Select employee_id
,gender
,birth_date

From employee_demographics
Where birth_date > '1985-01-01'

),

CTE_Example2 as
(
Select employee_id
,salary

From employee_salary
Where salary > 50000
)
Select *
From CTE_Example
Join CTE_Example2
	On CTE_Example.employee_id = CTE_Example2.employee_id
;

-- Some cleanup that removes aliases
With CTE_Example(gender, avg_sal, max_sal, min_sal, count_sal) as
(
Select gender
,avg(salary)
,max(salary)
,min(salary)
,count(salary)

From employee_demographics as dem
Join employee_salary as sal
	On dem.employee_id = sal.employee_id
Group By gender
)
Select *
From CTE_Example
;

