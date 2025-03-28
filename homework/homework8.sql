/*1. In one sentence each, what is the major purpose of the following?*/
-- (a) Views: These are stored snapshots of a selected thing.
-- (b) Triggers: These are triggerable operations.
-- (c) Indices: These allow for quicker access of a variable in a table.
/*
2. Why is it usually a bad idea to add indices on every column in a table?*/
-- it is not data efficient and pads up on runtime.
/*
3. Suppose we have a table called employees with fields called employee_id, name, birthdate, job, and
salary.
(a) Write a function called get_age that takes a birthday parameter and returns the what age that
birthday would correspond to (the age right now).
*/
delimiter $$
create function get_age(bday date) returns int deterministic
begin
return timestampdiff(year, bday, now());
end $$ delimiter ;
/*
(b) Create a VIEW on that table that contains the ID, name, and department, but not the salary. And
in place of the birthday, the view should have their current age (as of right now).
*/
create view simpliy_employees as select employee_id, name, job, get_age(birthdate) from employees;
/*
(c) Write a line of code that creates an index on the job column.
*/
create index job_index on employees(job);
/*
(d) Create something so that whenever an update is made to an employee’s salary, their salary is
never allowed to be more than the employee whose job is “president”.*/
delimiter $$
create trigger noOneAbovePres
before update on employees.salary 
for each row
begin
	if NEW.employees.salary > (select salary from employees where job = "president") then
	signal sqlstate '80000'
	set message_text = "No employee is above the president!";
	end if;
end $$
delimiter ;
/*
(e) What does the following stored procedure accomplish?
DELIMITER $$
CREATE PROCEDURE p()
BEGIN
DECLARE a DECIMAL(10,2);
DECLARE ps DECIMAL(10,2);
START TRANSACTION;
SELECT salary INTO ps FROM employees WHERE job = 'president';
DELETE FROM employees WHERE salary > (ps / 2);
SELECT AVG(salary) INTO a FROM employees;
IF a < 50000 THEN
ROLLBACK;
ELSE
COMMIT;
END IF;
END $$
DELIMITER ;*/
-- This deletes employees that are more than half the president's salary and then gets the average
-- only if the average is about 50000. 
/*
4. Design a database for an online chatting app. For this app, people have to register, so we need a way
to track info about registered users. In addition, each user can chat with any other user in a
one-on-one chat and have multiple chats open at once. At the very least, he database should store the
messages, who is sending to whom, and times of each message. Please list what the tables should be,
what the columns in each table should be, and indicate if any columns are foreign keys.*/
-- user: user_id, username
-- direct: direct_id, chat_name, username1, username2, time_created
-- messages: chat_id, is_group_chat, time_sent
-- group: group_id, group_name, host_username, time_created