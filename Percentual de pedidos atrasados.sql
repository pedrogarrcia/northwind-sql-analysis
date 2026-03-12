SELECT 
    status_entrega,
    total_pedidos,
    ROUND((total_pedidos / total_geral) * 100, 2) AS percentual

FROM (
    SELECT 
        CASE 
            WHEN shippedDate > requiredDate THEN 'Atrasado'
            ELSE 'No prazo'
        END AS status_entrega,

        COUNT(*) AS total_pedidos,

        (SELECT COUNT(*) FROM northwind.salesorder) AS total_geral

    FROM northwind.salesorder

    GROUP BY status_entrega

) AS resumo;