USE AdventureWorks2019;

SELECT 
P.Name AS PRODUCTNAME,
NONDISCOUNTSALES = (OD.OrderQty * OD.UnitPrice),
DISCOUNTS = ((OD.OrderQty * OD.UnitPrice) * OD.UnitPriceDiscount)
FROM
SALES.SalesOrderDetail AS OD
INNER JOIN Production.Product AS P
ON OD.ProductID = P.ProductID;


SELECT OD.OrderQty FROM SALES.SalesOrderHeader AS OH
INNER JOIN SALES.SalesOrderDetail AS OD
ON OH.SalesOrderID = OD.SalesOrderID
WHERE OH.SalesOrderID = 43661;


SELECT * FROM
SALES.SalesOrderDetail AS OD;

SELECT * FROM
Production.Product;


SELECT 
* FROM
	PERSON.PERSON AS P
	JOIN HumanResources.Employee AS E
	ON P.BusinessEntityID = E.BusinessEntityID
WHERE 5000.00 
IN (SELECT 
		SP.Bonus FROM 
		SALES.SalesPerson AS SP
	WHERE E.BusinessEntityID = SP.BusinessEntityID)



SELECT 
	SP.BusinessEntityID, 
	SP.Bonus 
FROM 
	SALES.SalesPerson AS SP
WHERE Bonus = 5000.00


SELECT P1.ProductModelID
FROM Production.Product AS P1
GROUP BY P1.ProductModelID
HAVING MAX(P1.ListPrice) >= (SELECT 
AVG(P2.ListPrice) * 1.01 FROM 
Production.Product AS P2
WHERE P1.ProductModelID = P2.ProductModelID)

SELECT * 
FROM Production.ProductModel


SELECT PP.FirstName, PP.LastName
FROM PERSON.PERSON AS PP
JOIN HumanResources.Employee AS HE
ON PP.BusinessEntityID = HE.BusinessEntityID
WHERE PP.BusinessEntityID IN (
	SELECT OH.SalesPersonID
	FROM SALES.SalesOrderHeader AS OH
	WHERE OH.SalesOrderID IN (
		SELECT OD.SalesOrderID
		FROM SALES.SalesOrderDetail AS OD
		WHERE OD.ProductID IN (
			SELECT P.ProductID
			FROM Production.Product AS P
			WHERE P.ProductNumber = 'BK-M68B-42'
		)
	)
)



SELECT SUM(OD.LineTotal) AS SUB_TOTAL
FROM SALES.SalesOrderDetail AS OD
GROUP BY OD.SalesOrderID

--WHERE OD.SalesOrderID = 43659



SELECT OH.SalesOrderID
FROM SALES.SalesOrderHeader AS OH
GROUP BY OH.SalesOrderID;


SELECT OH.SalesOrderID
FROM SALES.SalesOrderHeader AS OH
LEFT JOIN SALES.SalesOrderDetail AS OD
ON OH.SalesOrderID = OD.SalesOrderID
GROUP BY OH.SalesOrderID;


--DELETE FROM SALES.SalesOrderDetail
--WHERE SalesOrderID = 43697;


SELECT * 
FROM SALES.SalesOrderDetail
WHERE SalesOrderID = 43697;