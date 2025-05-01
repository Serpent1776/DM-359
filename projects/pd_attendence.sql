create table pd_attendance (
student_id integer,
event_id integer,
attendence boolean,
foreign key (student_id) references pd_students(student_id),
foreign key (event_id) references pd_events(event_id)
);
insert into pd_attendance (student_id, event_id, attendence) values (1,2, false);
select * from pd_attendance where student_id = 1;
delete from pd_attendance where event_id = 2;
select attendence from pd_attendance where student_id = 1;
