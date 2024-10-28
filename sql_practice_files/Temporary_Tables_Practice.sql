-- Temporary Tables

Create Temporary Table temp_table
(
first_name varchar(50)
,last_name varchar(50)
,favorite_movie varchar(100)
)
;

Select *
From temp_table
;

Insert Into temp_table
Values ('Austin', 'Lopez', 'Captian America: The Winter Soldier')
;

Select *
From temp_table
;

-- More popular way to create temporary table

Select *
From employee_salary
;

Create Temporary Table salary_over_50k
Select *
From employee_salary
Where salary >= 50000
;

Select *
From salary_over_50k
;