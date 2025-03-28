select count(*) from country where name like "A%";
select format(sum(population), 0) as 'World Population' from country 
where name like "u_%";
select * from country where name like "C%";

# life expectancy
select * from country;
select Region, avg(LifeExpectancy) from country group by Region;
select Region, avg(LifeExpectancy) from country where  Population > 10000000 group by Region;