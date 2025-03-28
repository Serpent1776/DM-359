create table employees( #1
id integer primary key auto_increment,
last_name varchar(100),
first_name varchar(100),
birthday date,
salary integer,
major varchar(100)
);

INSERT INTO employees (last_name, first_name, birthday, salary, major) VALUES #2
('Smith', 'John', '1990-05-15', 55000, 'Math'),
('Johnson', 'Emily', '1985-08-22', 60000, 'CS'),
('Brown', 'Michael', '1995-02-10', 48000, 'CS'),
('Davis', 'Sarah', '1988-11-30', 62000, 'Cyber'),
('Wilson', 'Christopher', '1992-07-03', 58000, 'Data'),
('Martinez', 'Linda', '1998-04-18', 52000, 'Data'),
('Harris', 'Daniel', '1987-09-25', 67000, 'CS'),
('Clark', 'Amanda', '1993-01-08', 54000, 'Cyber'),
('White', 'Matthew', '1989-06-14', 59000, 'Math'),
('Lee', 'Jennifer', '1997-03-22', 51000, 'CS');
select * from employees; #3a
select * from employees where major = 'CS'; #b
select last_name, salary from employees where major = 'Data'; #c
select last_name from employees where major = 'CS' and salary < 50000; #d
select last_name, salary from employees where salary between 50000 and 60000; #e
select last_name, salary from employees where major = 'Cyber' order by salary desc; #f
select id, first_name, last_name, birthday from employees order by birthday limit 3; #g
select last_name, salary, salary*1.2 as 'new salary' from employees; #h
select distinct major from employees; #i
select count(*) from employees;  #j
select count(*) from employees where salary > 60000; #k
select avg(salary) from employees where major = 'CS'; #l
alter table employees add department varchar(100); #4
update employees set department = 'accounting' where id = 2; #5
update employees set salary = salary * 1.1 where id = 3; #6
delete from employees where id = 5; #7
alter table employees change salary salary numeric(10,2); #8
select * from employees;
drop table employees; #9