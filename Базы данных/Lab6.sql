--1.1

SELECT ProductID, Name, ListPrice FROM SalesLT.Product
WHERE ListPrice > (SELECT AVG(UnitPrice) FROM SalesLT.SalesOrderDetail 
JOIN SalesLT.Product ON (SalesLT.Product.ProductID = SalesLT.SalesOrderDetail.ProductID))
ORDER BY ProductID

--1.2

SELECT ProductID, Name, ListPrice FROM SalesLT.Product
WHERE ListPrice >= 100 AND ProductID IN (SELECT ProductId FROM SalesLT.SalesOrderDetail WHERE UnitPrice < 100)
ORDER BY ProductID

--1.3

SELECT ProductID, Name, StandardCost, ListPrice, (SELECT AVG(UnitPrice) FROM SalesLT.SalesOrderDetail 
WHERE SalesLT.Product.ProductID = SalesLT.SalesOrderDetail.ProductID) AS AvgSellingPrice FROM SalesLT.Product
ORDER BY ProductID 

--SELECT ProductID, Name, StandardCost, ListPrice, (SELECT AVG(UnitPrice) FROM SalesLT.SalesOrderDetail 
--JOIN SalesLT.Product ON (SalesLT.Product.ProductID = SalesLT.SalesOrderDetail.ProductID)) AS AvgSellingPrice FROM SalesLT.Product
--ORDER BY ProductID 
 

 --1.4

SELECT ProductID, Name, StandardCost, ListPrice, (SELECT AVG(UnitPrice) FROM SalesLT.SalesOrderDetail 
WHERE SalesLT.Product.ProductID = SalesLT.SalesOrderDetail.ProductID) AS AvgSellingPrice FROM SalesLT.Product
WHERE StandardCost > (SELECT AVG(UnitPrice) FROM SalesLT.SalesOrderDetail 
WHERE SalesLT.Product.ProductID = SalesLT.SalesOrderDetail.ProductID)
ORDER BY ProductID 

--2.1 

SELECT SalesOrderID, SalesOrderHeader.CustomerID, FirstName, LastName, TotalDue FROM SalesLT.SalesOrderHeader
CROSS APPLY dbo.ufnGetCustomerInformation(CustomerID)
ORDER BY SalesOrderID

--2.2

SELECT CustomerAddress.CustomerID, FirstName, LastName, AddressLine1, City  FROM SalesLT.CustomerAddress
JOIN SalesLT.Address ON (SalesLT.Address.AddressID = SalesLT.CustomerAddress.AddressID)
CROSS APPLY dbo.ufnGetCustomerInformation(CustomerID)
ORDER BY CustomerAddress.CustomerID


