select contract.id, facility_type.name as 'loại dịch vụ', 
attach_facility.name as 'dịch vụ đi kèm', count(contract.id) as 'số lượng sử dụng' from attach_facility
join contract_detail on contract_detail.attach_facility_id = attach_facility.id
join contract on contract_detail.contract_id = contract.id
join facility on facility.id = contract.facility_id
join facility_type on facility_type.id = facility.facility_type_id
group by contract.id, attach_facility.id, facility_type.name, attach_facility.name
having count(contract.id) = 1;