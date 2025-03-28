select * from bugs;
select * from programmers;
select * from software_products;

select description, software_products.name as "product", p.name as "fixer" from bugs
inner join programmers p on p.programmer_id = bugs.fixer
inner join software_products using (product_id);

select description, software_products.name as "product", p.name as "fixer" from bugs
left join programmers p on p.programmer_id = bugs.fixer
left join software_products using (product_id);

select description, software_products.name as "product", case 
when p.name != "" then p.name 
when p.name is null then "NO FIXER"
end as "fixer" from bugs 
left join programmers p on p.programmer_id = bugs.fixer
left join software_products using (product_id);

 select a.name, b.name from programmers a cross join programmers b
 where a.salary >= 80000 and b.salary >= 80000 and a.programmer_id > b.programmer_id;
 
 
select name from software_products inner join bugs using (product_id) where bug_id is null;


select name, min(reported_date) from software_products sp 
inner join bugs using(product_id) 
group by name
union select name, max(reported_date) from software_products sp 
inner join bugs using(product_id) 
group by name
order by name;