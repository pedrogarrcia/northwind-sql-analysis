SELECT

productId,

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
),2) AS faturamento_com_desconto

FROM northwind.orderdetail

GROUP BY productId WITH ROLLUP;