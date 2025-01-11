--1.1

SELECT ProductID, pr.Name as ProductName, vp.Name as ProductModel, Summary FROM SalesLT.Product as pr
INNER JOIN SalesLT.vProductModelCatalogDescription as vp ON (pr.ProductModelID = vp.ProductModelID)

ORDER BY ProductID;

--1.2

DECLARE @UniqueColors AS TABLE(Color VARCHAR(30))

INSERT INTO @UniqueColors   
SELECT DISTINCT Color FROM SalesLT.Product

SELECT ProductID, Name as ProductName, Color FROM SalesLT.Product
WHERE Color IN (SELECT * FROM @UniqueColors);

--1.3

CREATE TABLE #UniqueSize (Size VARCHAR(10))

INSERT INTO #UniqueSize
SELECT DISTINCT Size FROM SalesLT.Product

SELECT ProductID, Name as ProductName, Size FROM SalesLT.Product 
WHERE Size IN (SELECT * FROM #UniqueSize)
ORDER BY Size DESC

--SELECT name, collation_name  
--FROM sys.databases  


--1.4

SELECT P.ProductID, P.Name as ProductName, D.ParentProductCategoryName, D.ProductCategoryName  FROM SalesLT.Product as P
CROSS APPLY dbo.ufnGetAllCategories() as D
ORDER BY D.ProductCategoryName, D.ParentProductCategoryName, P.Name

--2.1

SELECT CONCAT(CompanyName, '(',FirstName, LastName,')') AS CompanyContact,  Revenue
FROM 
(	
	SELECT CustomerID, SUM(TotalDue) AS Revenue 
	FROM SalesLT.SalesOrderHeader	
	GROUP BY CustomerID
)AS D
JOIN SalesLT.Customer ON (Customer.CustomerID = D.CustomerID)
ORDER BY CompanyContact;

--2.2 

WITH Revenue 
AS 
(
	SELECT CustomerID, SUM(TotalDue) AS Revenue 
	FROM SalesLT.SalesOrderHeader	
	GROUP BY CustomerID
)

SELECT CONCAT(CompanyName, '(',FirstName, LastName,')') AS CompanyContact,  Revenue
FROM SalesLT.Customer
JOIN Revenue ON (Customer.CustomerID = Revenue.CustomerID)
ORDER BY CompanyContact
	











