select title, count(*) from spring_schedule group by title order by count(*) desc;

select count(*) from (select title, count(*) from spring_schedule group by title having count(*) = 1) as subtable;
#most populated country
select * from country order by population desc limit 1;
select * from country where population = (select max(population) from country);

select language, round(sum((population*percentage)/100), 0) as speakerpop 
from countrylanguage cl 
inner join country c on cl.countrycode = c.code 
group by language 
order by speakerpop desc;

#^world stuff



#class stuff
select * from classrooms;
select * from courses;
#what classes are in the science building
select title, building from courses 
inner join classrooms using(classroom_id)
where building = 'Science Building';
#list of all students and the classes
select name, title from undergrad_courses
inner join undergrads using(undergrad_id)
inner join courses using(course_id);

#get a list of all students taking classes > 22 years old along with classes
select name, title, timestampdiff(year, birthday, now()) from undergrad_courses
inner join undergrads using(undergrad_id)
inner join courses using(course_id)
where timestampdiff(year, birthday, now()) >= 22;
