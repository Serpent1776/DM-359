create table pd_events (
event_id integer primary key auto_increment,
name varchar(250), 
date date, 
pd_points integer
);
insert into pd_events (name, date, pd_points) VALUES ("poster event", "3-4-29", 3);
select * from pd_events;
delete from pd_events where event_id = 2;