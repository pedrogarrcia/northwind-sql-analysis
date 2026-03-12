SELECT 

productId,

ROUND(SUM((unitPrice * quantity) * (1 - discount)),2) AS receita_produto

FROM northwind.orderdetail

GROUP BY productId

ORDER BY receita_produto DESC

LIMIT 5;