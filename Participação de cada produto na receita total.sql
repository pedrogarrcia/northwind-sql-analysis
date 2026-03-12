SELECT 

productId,

COUNT(DISTINCT orderId) AS total_pedidos,

ROUND(SUM(unitPrice * quantity * (1 - discount)),2) AS receita_produto,

ROUND(
SUM(unitPrice * quantity * (1 - discount)) /
SUM(SUM(unitPrice * quantity * (1 - discount))) OVER () * 100
,2) AS percentual_receita

FROM northwind.orderdetail

GROUP BY productId

ORDER BY receita_produto DESC;