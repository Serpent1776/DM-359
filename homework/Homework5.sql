/*Homework 5 tables*/
select * from appointments;
select * from cs_profs;
select * from cs_students;

/*1. For the first 20 appointments, list the professor and student name and the date of the appointment.
The date should be formatted like this “January 1, 2025 at 3:45 pm”.*/
select prof_name, student_name, date_format(date, "%M, %e, %Y at %r") from cs_profs  
join appointments using (prof_id)
join cs_students using (student_id)
limit 20;
/*2. In a single query, list the names of all the professors and all the students, making sure if there is a
student and professor with the same name, that both appear.*/
select prof_name, student_name from appointments 
join cs_students using (student_id) 
join cs_profs using (prof_id);
/*3. List all the ordered pairs that consist of a professor name and a student name, where both have last
names that start with W.
/*4. List the student names, their year, their GPA, and their class ranking (where they rank in GPA among
people in their year)
/*5. List all the professors that have at least 5 meetings with juniors. List the number of meetings with
juniors, too.
/*6. Who has the most meetings, freshmen, sophomores, juniors, or seniors? List just the class with the
most meetings and how many there are.
/*7. List all the students, their GPA, and the average GPA of all students (all in the same query).
/*8. List all the professors, all the rooms, and how many meetings each professor has in that room. Only
show those rooms for which there is more than one meeting.
/*9. List the student name, professor name, start time, and end time of all the meetings on 2/27/25. The
start and end times should be formatted like “9:50 AM”, without the date.
/*10. Find all the professors who are free on March 28 between 2 and 5 pm (i.e., don’t have an appointment
that starts between 2 and 5 or ends between 2 and 5).*/
