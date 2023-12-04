select contract.customer_id as 'mã khách hàng',
customer.name as 'tenkhachhang',
customer_type.name,
sum(facility.cost + (contract_detail.quantity * attach_facility.cost)) as 'total'
from contract
join customer on customer.id = contract.customer_id
join customer_type on customer_type.id = customer.customer_type_id
join contract_detail on contract_detail.contract_id = contract.id
join attach_facility on attach_facility.id = contract_detail.attach_facility_id
left join facility on facility.id = attach_facility.id
where contract.is_delete = 0 and year(contract.start_date) = 2022
group by contract.customer_id
having total > 10000000
order by total;

update customer
set customer_type_id = (select id from customer_type where name = 'Diamond')
where customer_type_id = (select id from customer_type where name = 'Platinum')
and id in (
select contract.customer_id
from contract
join contract_detail on contract.id = contract_detail.contract_id
join attach_facility on contract_detail.attach_facility_id = attach_facility.id
left join facility on attach_facility.id = facility.id
where contract.is_delete = 0
group by contract.customer_id
having SUM(facility.cost + (contract_detail.quantity * attach_facility.cost)) > 10000000
) 