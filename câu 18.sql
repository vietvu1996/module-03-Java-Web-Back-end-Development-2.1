select customer.id, customet.name from customer
join contract on contract.customer_id = customer.id

where contract.customer_id in (
select contract.customer_id from contract
where year(contract.start_date) < 2022
)
group by customer.id;
insert into contract(start_date,end_date,deposit,employee_id,customer_id,facility_id,is_delete) values 
('2021-12-05', '2021-12-30', 500, 8, 13, 7, 0);