/*Included with this assignment is a file inventory.sql. Open it and run all the SQL commands in it to
create and fill a few tables. Then write SQL queries for the following:*/
select * from inventory;
select * from stores;
select * from products;
/*(a) List all the food names, store names, and quantities where the quantity is at least 45.*/
select store_name, product_name, quantity from stores
inner join inventory on stores.store_id = inventory.store_id
inner join products on stores.store_id = products.product_id
where quantity >= 45;
/*(b) Find names of all the foods and quantities carried at “River Emporium”.*/
select store_name, product_name, quantity from stores
inner join inventory on stores.store_id = inventory.store_id
inner join products on stores.store_id = products.product_id
where store_name = "River Emporium";
/*(c) Find how many stores carry “Savory Tomatoes”.*/
select count(*) from stores
inner join inventory on stores.store_id = inventory.store_id
inner join products on stores.store_id = products.product_id
where product_name = "Savory Tomatoes";
/*(d) List all the food names and the total amount of each food in existence across all the stores.*/
select product_name, sum(quantity) from stores
inner join inventory on stores.store_id = inventory.store_id
inner join products on stores.store_id = products.product_id
group by product_name;
/*2. Included with this assignment is a file workers.sql. Open it and run all the SQL commands in it to
create and fill a few tables. Then write SQL queries for the following:*/
select * from workers;
select * from jobs;
select * from offices;
select * from worker_jobs;
/*(a) List the names of everyone who has a higher salary than John Herndandez.*/
select name from workers 
where salary > (select salary from workers where name = "John Hernandez");
/*(b) List the names and salaries of everyone making more than the average salary.*/
select name, salary from workers 
where salary > (select avg(salary) from workers);
/*(c) List all the employees whose office is Tech Hub 101.*/
select name from workers 
inner join offices using (office_id) 
where building = "Tech Hub" and room_number = 101;
/*(d) List the names of all the people whose job is Network Engineer.*/
select name from workers 
inner join worker_jobs using (worker_id)
inner join jobs using (job_id) where job_name = "Network Engineer";
/*(e) List each employee’s name and job.*/
select name, job_name from workers 
inner join worker_jobs using (worker_id) 
inner join jobs using (job_id);
/*(f) List all the people, their job titles, their salary, and the job’s starting salary where the person’s
salary is less than the job’s starting salary.*/
select name, job_name, salary, starting_salary from workers 
inner join worker_jobs using (worker_id) 
inner join jobs using (job_id) 
where salary < starting_salary;
/*(g) List each employee’s name along with the building and room number of their office. [Note: Not
everyone has an office. Only those with offices should be listed.]*/
select name, building, room_number from workers 
inner join offices using (office_id);
/*(h) List all employees who make the most in their building, along with their salaries (don’t worry
about the people that don’t have an office).*/
select name, salary, building from workers
inner join offices o1 using (office_id) 
where salary = (select max(salary) from workers
inner join offices o2 using (office_id)
where o1.building = o2.building);