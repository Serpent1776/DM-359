select * from spring_schedule;
#1a
select name from products where dayname(first_offered) = 'Monday';
#1b
select name, first_offered from products where first_offered > date_sub(now(), interval 100 day);
#1c
select category, price as 'largest' from products order by price desc limit 5;
#1d
select category, price as 'largest' from products where price > 100 order by price desc limit 2;
#2a
select code, title, days, start from spring_schedule where professor like 'Lamprecht%';
#2b
select count(*) as 'Lamprecht\'\s courses' from spring_schedule where professor like 'Lamprecht%'; 
#\ are escapes I wonder how useful that will be
#2c
select code, title from spring_schedule where code like "CMSCI%"
and start = "2:00 PM" and days = "T R" or 
code like "CYBER%" and start = "2:00 PM" and days = "T R"; 
#this one is a bit lengthy, hoping to compact it later
#2d
select code, title, capacity, enrollment from spring_schedule order by enrollment desc limit 5;
#2e
select start, count(*) from spring_schedule group by start order by count(*) desc;
#2f
select * from spring_schedule where code like "%%MO%";
#2g
select * from spring_schedule 
where time_to_sec(timediff(cast(end as time), cast(start as time))) >= 10800; #3 hours is 10800 seconds
#2h
select days, count(days) from spring_schedule group by days;
#2i
select concat(start, end), enrollment 
from spring_schedule 
order by enrollment desc;
#2j
select substring(code, 1, 5) as 'Department', sum(enrollment) as "Total" 
from spring_schedule 
where days = "M W F" 
group by substring(code, 1, 5)
having sum(enrollment) > 100;
#haha, I got it through substring!