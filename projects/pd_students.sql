create table pd_students (
student_id integer primary key auto_increment,
name varchar(50),
year varchar(20) check (year = "Freshman" or year = "Sophomore" or year = "Junior" or year = "Senior" or year = "Graduate"),
requiredClass varchar(20) check (requiredClass like "%-%")
);
insert into pd_students (name, year, requiredClass) VALUES ("Jack Hemling", "Junior", "DM-359");
Select * from pd_students;
delete from pd_students where student_id = 4;

