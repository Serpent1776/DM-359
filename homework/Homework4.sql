/*1. Use the spring_schedule table for this problem (from Homework 2).
/*(a) List titles of the first 20 courses in the table and whether or not they are full. The second column
of the results should say “full” if the course’s enrollment is at or over its capacity and ”open”
otherwise. That column’s name should “Full?”.*/
select title, case
when enrollment >= capacity then "full"
when enrollment < capacity then "open"
end as "capacity status" from spring_schedule limit 20;
/*(b) In a single query, list all the times that are starting times of classes or ending times of classes.*/
select distinct start as times from spring_schedule union select end from spring_schedule;
/*(c) Find how many different course titles there are.*/
select distinct count(title) from spring_schedule;
/*(d) Using EXISTS, find all the titles of courses that have multiple sections.*/
select title from spring_schedule where exists(select code from spring_schedule where count(*) > 2);
#I got err 1111 here because idk how to use exists, since the examples you give only use not exists().
/*(e) List all the MATH classes (start of course code is MATH) that are in rooms that are not used for
any CMSCI classes (start of course code is CMSCI).*/
select * from spring_schedule where code like "MATH%" and room not in (select room from spring_schedule where code like "CMSCI%");
/*2. Use the high_school database for this problem.
(a) List all the students and the classes they are in for all of Dr. Anderson’s classes*/
select * from hs_students;
select * from hs_faculty;
select * from hs_courses;
select * from hs_course_students;
select hs_students.name, hs_courses.name from hs_students 
join hs_course_students using (student_id)
join hs_courses using (course_id)
join hs_faculty using (faculty_id)
where hs_courses.faculty_id = 1;
/*(b) List all the classes and how many students are in each.*/
select name,
(select count(course_id) from hs_course_students where course_id = hs_courses.course_id) as "amount" from hs_courses;
/*(c) List all the freshmen along with a list of the courses they are taking (use GROUP_CONCAT).*/
select name,
(select group_concat(" ", name) from hs_course_students 
join hs_courses using (course_id) 
where student_id = hs_students.student_id) as "courses" from hs_students
where class = "FR";
/*3. Use the workers database for this problem (same one from Homework 3).*/
select * from offices;
select * from workers;
select * from worker_jobs;
select * from jobs;
/*(a) List each worker’s name along with the building and room number of their office. [Note: Not
everyone has an office. Only those with offices should be listed.]*/
select name, building, room_number from workers join offices using(office_id);
/*(b) Repeat the above, but make sure all workers are listed, even those without offices (their building
and room numbers will just be null).*/
select name, building, room_number from workers left join offices using(office_id);
/*(c) List all the job names and how many people there are with each job. [Be careful since some jobs
don’t have anyone doing them.]*/
select job_name, (select group_concat(" ", name) from workers 
join worker_jobs using (worker_id) where job_id = jobs.job_id) as "workers" from jobs;
/*(d) List just the open jobs (the ones with no one doing them).*/
select job_name from jobs where (select group_concat(" ", name) from workers 
join worker_jobs using (worker_id) where job_id = jobs.job_id) is null; 
/*(e) List all the workers that don’t share an office with someone else.*/
select name from workers where (select count(*) from offices where office_id = workers.office_id) < 2;
select name from workers w1 where not exists 
(select office_id from workers w2 where w1.office_id = w2.office_id and w1.worker_id != w2.worker_id);