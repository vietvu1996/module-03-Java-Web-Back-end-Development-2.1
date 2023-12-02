select distinct name from customer;

select name from customer group by name;

select name from (
select name from customer 
union
select name from customer 
) as name_table;