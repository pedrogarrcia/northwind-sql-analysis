USE northwind;

SELECT 
cus.companyName, 
ROUND(SUM((ord.unitPrice * ord.quantity) * (1 - ord.discount)),2) AS total_gasto

FROM northwind.customer AS cus

JOIN salesorder AS sales
ON cus.custId = sales.custId

JOIN northwind.orderdetail AS ord 
ON ord.orderId = sales.orderId

GROUP BY cus.companyName

ORDER BY total_gasto DESC;