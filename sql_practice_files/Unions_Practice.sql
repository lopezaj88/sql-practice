-- Unions Practice

Select first_name, last_name
From employee_demographics
Union All
Select first_name, last_name
From employee_salary
;

Select first_name
,last_name
,'Old' as Label
From employee_demographics
Where age > 40 and gender = 'Male'
Union
Select first_name
,last_name
, 'Old Lady' as Label
From employee_demographics
Where age > 40 and gender = 'Female'
Union
Select first_name
,last_name
, 'Highly Paid' as label
From employee_salary 
Where salary > 70000
;