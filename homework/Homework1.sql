#1a. Jack
#1b. My  first and last name should be obivious, 
#but for the spelling of the last name don't forget to add "Heml" to the "ing"
/*1c. Ultimately, the upholding of ethics as a part of classroom culture is important 
for the sake of not only preparing students for the working world, 
but also to make them remember the work they do is applicable. 
The importance of science and math is not simply memorizing formulas, 
but it is also applying them to problems that exist both in the theoretical and real world. 
As for the other areas ethics empathizes, they are meant in the ethics of equality and professional formality
which has become increasingly important with the crises of racism and hatred that continue to permeate. 
Although, my symposium class stated that evil exists no matter the race.*/
#2
create table courses(
course_id integer primary key AUTO_INCREMENT,
course_name varchar(100),
course_start_date date,
course_credits integer default 3,
course_classroom enum ('Coad 107', 'Coad 111', 'Coad 125')
);
#5
alter table courses add course_cost numeric(6,2);
#3
insert into courses (course_name, course_start_date, course_credits, course_classroom, course_cost) values 
('CMSCI 277', '2023-08-18', default, 'Coad 107', 630),
('CMSCI 125', '2023-01-13', default, 'Coad 125', 0),
('CMSCI 360', '2024-08-18', default, 'Coad 111', 1399.99);
#4
update courses set course_start_date='2025-08-14' where course_id = 1;
#6
select name,  price from products; #a
select name, first_offered from products order by first_offered; #b
select name from products where category = 'Electronics'; #c
select name from products where price between 12 and 30 order by price; #d
select * from products order by price desc limit 1; #e
select avg(price) as 'Average Toy Price' from products where category = 'Toys'; #f 
select sum(price) as 'Total Cost to buy All Items' from products; #g
select name, price, price - price*0.2 as 'Sale Price' from products; #h
#select name, price, convert((price - price*0.2), numeric(10,2)) as 'Sale Price' from products; #error for problem 6h here
/*The line above would be right for this problem but causes error code 1064. 
Please remove the hashtag on the start of line 38 
to run it and run it to see the error code 1064 for yourself.
It says for me to check the manual and problem is that I don't know where the manual is. 
I used ctrl f in the notes you gave us and didn't find about casting in sql.
explantion for convert use:
I resorted to casting because 
rounding doesn't exist in sql or 
rather I think it doesn't because no function exists for it.
I guess from such point, parsing doesn't exist.
I found that the convert keyword existed because it was in the documentation 
which I think is like casting in python, but maybe not./*
*