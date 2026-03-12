SELECT  
*

FROM northwind.customer AS cus

JOIN salesorder AS sales
ON cus.custId = sales.custId

JOIN northwind.orderdetail AS ord 
ON ord.orderId = sales.orderId

WHERE cus.companyName = "Customer IRRVL";