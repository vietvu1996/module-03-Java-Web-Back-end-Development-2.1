select attach_facility.id, contract_detail.quantity, attach_facility.cost
from attach_facility
join contract_detail on contract_detail.attach_facility_id = attach_facility.id
join contract on contract.id = contract_detail.contract_id
where contract_detail.quantity > 10 and year(contract.start_date) = 2022
order by contract_detail.quantity;
set sql_safe_updates = 0;

update attach_facility
set cost = cost * 2
where attach_facility.id in (
select * from (
select attach_facility.id
from attach_facility
join contract_detail on contract_detail.attach_facility_id = attach_facility.id
join contract on contract.id = contract_detail.contract_id
where contract_detail.quantity > 10 and year(contract.start_date) = 2022) as capnhap
);

select * from contract;
select * from contract_detail;
select * from attach_facility;