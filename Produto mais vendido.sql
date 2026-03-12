SELECT 
productId,

COUNT(DISTINCT orderId) total_pedidos

FROM northwind.orderdetail

GROUP BY productId

ORDER BY total_pedidos DESC

LIMIT 1;