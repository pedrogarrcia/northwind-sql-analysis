SELECT 

p1.productName AS produto_1,
p2.productName AS produto_2,

COUNT(*) AS vezes_comprados_juntos

FROM northwind.orderdetail o1

JOIN northwind.orderdetail o2
ON o1.orderId = o2.orderId
AND o1.productId < o2.productId

JOIN northwind.product p1
ON o1.productId = p1.productId

JOIN northwind.product p2
ON o2.productId = p2.productId

GROUP BY produto_1, produto_2

ORDER BY vezes_comprados_juntos DESC

LIMIT 10;