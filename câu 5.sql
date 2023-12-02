select customer.id, customer.name, customer_type.name, 
contract.id, contract.start_date, contract.end_date, (contract.deposit + contract_detail.quantity * attach_facility.cost) 
as total
from customer
join contract on customer.id = contract.customer_id
join customer_type on customer_type.id = customer.customer_type_id
join contract_detail on contract_detail.contract_id = contract.id
join attach_facility on attach_facility.id = contract_detail.attach_facility_id
group by customer.id, customer.name, customer_type.name,
contract.id, contract.start_date, contract.end_date, 
contract.deposit, contract_detail.quantity, attach_facility.cost;