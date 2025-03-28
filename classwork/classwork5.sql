select distinct name from country union select distinct localname from country;

select count(*) from country;
select * from mount_students;
select * from clubs join faculty using (faculty_id) where clubs.name = "Chess Club";
select count(*) from clubs 
join club_students using (club_id) 
join mount_students using (student_id) 
where clubs.name = "Debate Club";
select count(*), clubs.name from clubs 
join club_students using (club_id) 
join mount_students using (student_id)
group by clubs.name;
select mount_students.name, count(student_id) as "clubs" from club_students
 join mount_students using (student_id) 
 group by student_id having count(student_id) > 1;
select mount_students.name, group_concat(" ", clubs.name) as "clubs" from club_students
 join mount_students using (student_id) 
 join clubs using (club_id)
 group by student_id;
select mount_students.name, count(student_id) as "clubs" from club_students
 join mount_students using (student_id) 
 group by student_id having count(student_id) < 1;

select mount_students.name, mount_students.class from club_students
 join mount_students using (student_id) 
 join clubs using (club_id)
 group by student_id having mount_students.class = "SO";

select count(*), clubs.name from clubs 
join club_students using (club_id) 
join mount_students using (student_id) where mount_students.class = "SO"
group by clubs.name;


select distinct name from club_students
join mount_students using (student_id) where name != "Emma Moore" and club_id in (select club_id from club_students);