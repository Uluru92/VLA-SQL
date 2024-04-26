--jercicio Intermedio: Ventas por Categoría de Producto

--Objetivo: Generar un informe de ventas que muestre el total de ventas 
--por cada categoría de producto para el año 2017. 
--La consulta debe incluir el nombre de la categoría y el total de ventas, 
--ordenados de mayor a menor por el total de ventas.

SELECT PC.Name AS CATEGORY_NAME, SUM(SOH.TotalDue) AS TOTAL_SALES
FROM Production.Product AS P
JOIN Production.ProductSubcategory AS PS
ON P.ProductSubcategoryID = PS.ProductSubcategoryID
JOIN Production.ProductCategory AS PC 
ON PC.ProductCategoryID = PS.ProductCategoryID
JOIN SALES.SalesOrderDetail AS SOD
ON SOD.ProductID = P.ProductID
JOIN SALES.SalesOrderHeader AS SOH 
ON SOH.SalesOrderID = SOD.SalesOrderID
WHERE YEAR(SOH.OrderDate) < 2017
GROUP BY PC.Name
ORDER BY TOTAL_SALES;