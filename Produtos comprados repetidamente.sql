SELECT 

sales.custId,
prod.productName,

COUNT(*) AS vezes_compradas

FROM northwind.salesorder AS sales

JOIN northwind.orderdetail AS ord
ON sales.orderId = ord.orderId

JOIN northwind.product AS prod
ON ord.productId = prod.productId

GROUP BY sales.custId, prod.productName

HAVING COUNT(*) > 1;