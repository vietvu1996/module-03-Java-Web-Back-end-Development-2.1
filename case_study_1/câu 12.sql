select contract.id,
employee.name, 
customer.name,
customer.phone_number,
facility.name,
sum(contract_detail.quantity) as 'soluongdichvu',
contract.deposit
from customer
join contract on contract.customer_id = customer.id
join contract_detail on contract_detail.contract_id = contract.id
join employee on employee.id = contract.employee_id
join facility on facility.id = contract.facility_id
where year(contract.start_date) = 2022 and (month(contract.start_date) in (10, 11, 12) or month(contract.end_date) in (10, 11, 12))
and contract.id not in (
select contract_id from contract
where year(contract.start_date) = 2023
group by contract.id
)
group by contract.id,
employee.name, 
customer.name,
customer.phone_number,
facility.name,
contract.deposit