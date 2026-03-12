SELECT 

productId,

ROUND(SUM(unitPrice * quantity * (1 - discount)),0) AS fat_total,

ROUND(SUM(
    CASE 
        WHEN discount = 0 
        THEN unitPrice * quantity
    END
),2) AS faturamento_sem_desconto,

ROUND(SUM(
    CASE 
        WHEN discount <> 0
        THEN unitPrice * quantity * (1 - discount)
    END
),2) AS faturamento_com_desconto,

ROUND(
SUM(unitPrice * quantity * (1 - discount)) 
/
SUM(SUM(unitPrice * quantity * (1 - discount))) OVER () * 100
,2) AS percentual_produto,

ROUND(SUM(SUM(unitPrice * quantity * (1 - discount))) OVER (),2) AS faturamento_total_geral

FROM northwind.orderdetail

GROUP BY productId 

ORDER BY fat_total DESC;