SELECT 
CASE 
	WHEN shippedDate > requiredDate THEN 'Atrasado'
    ELSE 'No prazo'
END AS status_entrega,

count(*) AS total_pedidos

FROM northwind.salesorder

GROUP BY status_entrega;