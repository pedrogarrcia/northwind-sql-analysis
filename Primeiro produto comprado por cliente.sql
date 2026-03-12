SELECT 

sales.custId,
prod.productName,
sales.orderDate

FROM northwind.salesorder AS sales

JOIN orderdetail AS ord
ON sales.orderId = ord.orderId

JOIN product AS prod
ON ord.productId = prod.productId

WHERE sales.orderDate = (

    SELECT MIN(orderDate)

    FROM northwind.salesorder

    WHERE custId = sales.custId
);