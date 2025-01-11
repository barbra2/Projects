--1.1

SELECT CompanyName, SalesOrderID, TotalDue FROM SalesLT.Customer JOIN SalesLT.SalesOrderHeader ON (SalesLT.Customer.CustomerID = SalesLT.SalesOrderHeader.CustomerID)

--1.2 

SELECT DISTINCT CompanyName, SalesOrderID, TotalDue, AddressLine1, AddressLine2, City, StateProvince, PostalCode, CountryRegion
FROM SalesLT.Customer JOIN SalesLT.SalesOrderHeader ON (SalesLT.Customer.CustomerID = SalesLT.SalesOrderHeader.CustomerID)
JOIN SalesLT.CustomerAddress ON (SalesLT.CustomerAddress.CustomerID = SalesLT.SalesOrderHeader.CustomerID)
JOIN SalesLT.Address ON (SalesLT.Address.AddressID = SalesLT.CustomerAddress.AddressID)
WHERE SalesLT.CustomerAddress.AddressType = 'Main Office'


--2.1

SELECT CompanyName, FirstName, LastName, SalesOrderID, TotalDue 
	FROM SalesLT.Customer LEFT JOIN SalesLT.SalesOrderHeader ON (SalesLT.Customer.CustomerID = SalesLT.SalesOrderHeader.CustomerID)
ORDER BY SalesOrderID DESC


--2.2

SELECT Customer.CustomerID, CompanyName, FirstName, LastName, Phone FROM SalesLT.Customer LEFT JOIN SalesLT.CustomerAddress ON 
(SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID)
WHERE AddressID is NULL


--2.3 

SELECT Customer.CustomerID, Product.ProductID FROM SalesLT.Customer
FULL JOIN SalesLT.SalesOrderHeader ON (SalesLT.Customer.CustomerID = SalesLT.SalesOrderHeader.CustomerID)
FULL JOIN SalesLT.SalesOrderDetail ON (SalesLT.SalesOrderHeader.SalesOrderID = SalesLT.SalesOrderDetail.SalesOrderID)
FULL JOIN SalesLT.Product ON (SalesLT.SalesOrderDetail.ProductID = SalesLT.Product.ProductID)
WHERE Customer.CustomerID IS NULL OR Product.ProductID IS NULL;
