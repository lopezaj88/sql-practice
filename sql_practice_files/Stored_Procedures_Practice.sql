-- Stored Procedures (similar to python functions)
Use parks_and_recreation; -- specifies which database to use. Not always necessary, but if dealing with multiple dbs it could be good to use
Delimiter $$ 
-- allows you to run multiple queries in a stored procedure 
Create Procedure large_salaries()
Begin
	Select *
	From employee_salary
	Where salary >= 50000
;
End $$
Delimiter ;
Call large_salaries;

Delimiter $$
Create Procedure large_salaries2()
Begin
	Select *
    From employee_salary
    Where salary >= 50000
    ;
    
    Select * 
    From employee_salary
    Where salary >= 10000
    ;
End $$
Delimiter ;
-- Best practice is to change the delimiter back to ; so you can go back to using the default 
Call large_salaries2();


-- Stored procedures that accept inputs
Delimiter $$
Create Procedure large_salaries3(p_employee_id INT)
Begin
	Select salary
    From employee_salary
    Where employee_id = p_employee_id
    ;
End $$
Delimiter ;

Call large_salaries3(1);