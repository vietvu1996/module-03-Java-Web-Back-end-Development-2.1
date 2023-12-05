select attach_facility.id, 
attach_facility.name, 
attach_facility.cost, 
attach_facility.unit, 
attach_facility.status, 
customer.name as 'Tên khách hàng', 
customer_type.name as 'Loại khách hàng', 
customer.address 
from attach_facility
join contract_detail on contract_detail.attach_facility_id = attach_facility.id
join contract on contract.id = contract_detail.contract_id
join customer on customer.id = contract.customer_id
join customer_type on customer.customer_type_id = customer_type.id
where customer_type.name = 'Diamond' AND (customer.address = '%Vinh' OR '%Quảng Ngãi');