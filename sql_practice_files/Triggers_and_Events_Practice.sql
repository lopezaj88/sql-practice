-- Triggers and Events

Select *
From employee_demographics
;

Select *
From employee_salary
;

Delimiter $$
Create Trigger employee_insert
	After Insert On employee_salary
    For Each Row 
Begin
	Insert into employee_demographics(employee_id, first_name, last_name)
    Values(New.employee_id, New.first_name, New.last_name)
    ;
End $$
Delimiter ;


Insert Into employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
Values(13, 'Jean-Ralphio', 'Saperstein', 'Entertainment 720 CEO', 1000000, NULL);


-- EVENTS (Scheduled automation)
Select *
From employee_demographics
;

Delimiter $$
Create Event delete_retirees2
On Schedule Every 30 Second
Do
Begin
	Delete
    From employee_demographics
    Where age >= 60
    ;
End $$
Delimiter ;
