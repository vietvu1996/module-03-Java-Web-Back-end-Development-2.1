select facility.id, facility.name, facility.area, facility.max_people, facility.cost, facility_type.name from facility
join facility_type on facility_type.id = facility.facility_type_id
where facility.id in(
select facility.id from facility
join contract on facility.id = contract.facility_id
where year(contract.start_date) = 2022)