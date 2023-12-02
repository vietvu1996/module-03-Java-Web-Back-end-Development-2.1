select * from employee
where name like 'T%' OR name like 'H%' OR name like 'K%'
AND length(name) <= 15; 