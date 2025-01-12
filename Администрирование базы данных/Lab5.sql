--1.1 

SELECT ProductID, UPPER(Name) as ProductName, CEILING(ROUND(Weight, 0)) AS ApproxWeight FROM SalesLT.Product

--1.2

SELECT ProductID, UPPER(Name) as ProductName, CEILING(ROUND(Weight, 0)) AS ApproxWeight, 
DATEPART(year, SellStartDate) AS SellStartYear, DATENAME(month, SellStartDate) AS SellStartMonth FROM SalesLT.Product

--1.3

SELECT ProductID, UPPER(Name) as ProductName, CEILING(ROUND(Weight, 0)) AS ApproxWeight, 
DATEPART(year, SellStartDate) AS SellStartYear, DATENAME(month, SellStartDate) AS SellStartMonth,
LEFT(ProductNumber,2) AS ProductType FROM SalesLT.Product

--1.4

SELECT ProductID, UPPER(Name) as ProductName, CEILING(ROUND(Weight, 0)) AS ApproxWeight, 
DATEPART(year, SellStartDate) AS SellStartYear, DATENAME(month, SellStartDate) AS SellStartMonth,
LEFT(ProductNumber,2) AS ProductType, Size FROM SalesLT.Product

WHERE ISNUMERIC(Size)=1 

--2.1

SELECT CompanyName, TotalDue AS Revenue, RANK() OVER (ORDER BY TotalDue DESC) AS RankByRevenue FROM SalesLT.SalesOrderHeader
JOIN SalesLT.Customer ON (SalesLT.SalesOrderHeader.CustomerID = SalesLT.Customer.CustomerID)

--3.1

SELECT Name, SUM(LineTotal) AS TotalRevenue FROM SalesLT.SalesOrderDetail
JOIN SalesLT.Product ON (SalesLT.Product.ProductID = SalesLT.SalesOrderDetail.ProductID)
GROUP BY Name
ORDER BY TotalRevenue DESC

--3.2

SELECT Name, SUM(LineTotal) AS TotalRevenue FROM SalesLT.SalesOrderDetail
JOIN SalesLT.Product ON (SalesLT.Product.ProductID = SalesLT.SalesOrderDetail.ProductID)
WHERE LineTotal > 1000
GROUP BY Name
ORDER BY TotalRevenue DESC

--3.3 

SELECT Name, SUM(LineTotal) AS TotalRevenue FROM SalesLT.SalesOrderDetail
JOIN SalesLT.Product ON (SalesLT.Product.ProductID = SalesLT.SalesOrderDetail.ProductID)
GROUP BY Name
HAVING SUM(LineTotal) > 20000
ORDER BY TotalRevenue DESC
