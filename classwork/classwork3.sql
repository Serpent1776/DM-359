/*1. List the name and government type of every country with a population over 100 million.
2. Find the total population of Europe. Make sure it’s formatted so that the population is displayed with
commas.
3. List all the countries whose names contain an X anywhere.
4. List the names of all the countries whose name starts with C and are exactly 4 characters long.
5. List all the countries whose life expectancy is NULL.
6. List all the government types and how many countries use that government type.
7. List all the government types and how many countries use that government type. Only have it list
those that are used by more than one country, and have it sorted by amount from greatest to least.
8. Repeat the problem above, but only countries with at least 5 million people should be included in the
counts.
9. List all of the heads of state that are heads of state for more than one country and include in that
listing the total population of all the countries they are in charge of.
10. Rounded to 1 decimal place, list the country names and their population as a percentage of China’s.
Order by that percentage from greatest to least, and only display the top 30.*/

select * from country;
#1
select name, GovernmentForm from country where Population >100000000;
#2
select format(sum(population), 0) from country where Continent = "Europe";
#3
select name from country where name like "?a";
#4
select name from country where name like "C%";
#5
select name, LifeExpectancy from country where isnull(LifeExpectancy);
#6
select GovernmentForm, count(GovernmentForm) from country group by GovernmentForm;
#7
select GovernmentForm, count(GovernmentForm) from country group by GovernmentForm
having count(GovernmentForm) > 1
order by count(GovernmentForm) desc;
#8
select GovernmentForm, count(GovernmentForm) from country where population > 5000000 group by GovernmentForm
having count(GovernmentForm) > 1 
order by count(GovernmentForm) desc;
#9
select HeadOfState, count(*), sum(Population) from country
group by HeadofState
having count(*) > 1;
#10
select Population from country where name='China';
select name, round((Population/1277558000)*10000, 1) as "CCP pop percent" from country order by "CCP pop percent" asc;
