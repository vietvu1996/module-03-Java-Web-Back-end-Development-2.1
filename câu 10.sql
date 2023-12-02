select contract.id, contract.start_date, contract.end_date, contract.deposit, sum(contract_detail.quantity) from contract
join contract_detail on contract_detail.contract_id = contract.id
group by contract.id, contract.start_date, contract.end_date, contract.deposit;