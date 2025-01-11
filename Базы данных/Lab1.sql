--1.1

SELECT * FROM SalesLT.Customer;


--1.2

SELECT title, FirstName, MiddleName, LastName, Suffix FROM SalesLT.Customer;

--1.3

SELECT SalesPerson, CONCAT(title, LastName) AS CustomerName, Phone FROM SalesLT.Customer;


--2.1

SELECT CONCAT(CustomerID, ' : ', CompanyName) AS CustomerCompany FROM SalesLT.Customer;


--2.2

SELECT CONCAT(SalesOrderNumber, '(',RevisionNumber,')') AS OrderRevision, 
CAST(OrderDate AS DATE) AS OrderDate
FROM SalesLT.SalesOrderHeader;


--3.1

SELECT CONCAT(FirstName, ' ', ISNULL(MiddleName, ''), LastName) AS CustomerName FROM SalesLT.Customer;

--3.2

UPDATE SalesLT.Customer
SET EmailAddress = NULL
WHERE CustomerID & 7 = 1;

SELECT CustomerID, ISNULL(EmailAddress, Phone) AS PrimaryContact FROM SalesLT.Customer; 

--3.3

UPDATE SalesLT.SalesOrderHeader
SET ShipDate = NULL
WHERE SalesOrderID > 71889;

SELECT SalesOrderNumber,
CASE 
	WHEN ShipDate IS NULL THEN 'Awaiting Shipment'
	ELSE 'Shipped'
END ShippingStatus

FROM SalesLT.SalesOrderHeader