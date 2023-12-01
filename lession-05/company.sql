create database company;
use company;

create table employees(
id int auto_increment primary key,
name varchar(50) not null, 
department varchar(50) not null,
salary decimal(10,2) not null
);

insert into employees (name, department, salary)
values ('John Doe', 'A', 3500),
('Jane Smith', 'A', 2000),
('David Johnson', 'A', 6000);

DELIMITER //

create TRIGGER update_department
before INSERT ON employees
FOR EACH ROW
BEGIN
	IF NEW.salary >= 5000 THEN
		SET new.department = 'Management';
	ELSEIF NEW.salary >= 3000 THEN
		SET new.department = 'Sales';
	ELSE 
		SET new.department = 'Support';
	END IF;
END //

DELIMITER ;