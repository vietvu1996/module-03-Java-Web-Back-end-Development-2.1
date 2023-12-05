select attach_facility.id, attach_facility.name, count(contract.id) as 'số lượng sử dụng' from attach_facility
join contract_detail on contract_detail.attach_facility_id = attach_facility.id
join contract on contract_detail.contract_id = contract.id
group by attach_facility.id, attach_facility.name
having count(contract.id) >= all (
select count(contract.id) from attach_facility
join contract_detail on contract_detail.attach_facility_id = attach_facility.id
join contract on contract_detail.contract_id = contract.id
group by attach_facility.id, attach_facility.name
);