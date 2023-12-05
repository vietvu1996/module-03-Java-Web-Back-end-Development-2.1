select facility.id, facility.name, facility.area, facility.cost, facility_type.name from facility
join facility_type on facility_type.id = facility.facility_type_id
where facility.id not in (
select facility.id from facility
join attach_facility on attach_facility.id = facility.id
join contract_detail on contract_detail.attach_facility_id = attach_facility.id
join contract on contract.id = contract_detail.contract_id
where year(contract.start_date) = 2023 AND month(contract.start_date) in (1, 2, 3)
);