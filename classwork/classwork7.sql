select * from city;
select max(population), CountryCode from city group by CountryCode order by max(population) desc;

select name, m, rank() over (order by m desc) from country 
inner join (select countryCode, max(population) as m from city group by CountryCode) 
as X on country.code = x.CountryCode;

select prof_name from appointments 
inner join cs_profs using (prof_id) 
where monthname(date) = "march" 
group by prof_id order by max(appointment_id) desc limit 1;
