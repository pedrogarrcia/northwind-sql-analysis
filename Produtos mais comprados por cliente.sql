SELECT 
cus.companyName,
prod.productName,

count(sales.orderId) AS qntd_pedidos

FROM northwind.customer AS cus

JOIN northwind.salesorder AS sales
ON sales.custId = cus.custId 

JOIN northwind.orderdetail AS ord
ON sales.orderId = ord.orderId

JOIN northwind.product AS prod
ON ord.productId = prod.productId

WHERE cus.companyName = "Customer IRRVL"

GROUP BY cus.companyName, prod.productName

ORDER BY qntd_pedidos DESC

LIMIT 5;