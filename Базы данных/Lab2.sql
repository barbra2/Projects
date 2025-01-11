--1.1

SELECT DISTINCT City, StateProvince FROM SalesLT.Address;

--1.2

SELECT TOP (10) PERCENT Weight FROM SalesLT.Product
ORDER BY Weight DESC;

--1.3

SELECT Weight FROM SalesLT.Product
ORDER BY Weight DESC
OFFSET 10 ROWS
FETCH NEXT 100 ROWS ONLY; 

SELECT TOP(10) listPrice FROM SalesLT.Product
ORDER BY listPrice DESC

--2.1

SELECT Name, Color, Size FROM SalesLT.Product
WHERE ProductModelID LIKE '1';

--2.2

SELECT ProductNumber, Name FROM SalesLT.Product
WHERE Color IN('Black','Red','White') AND Size IN('S','M');

--2.3

SELECT ProductNumber,Name,ListPrice FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-%';

--2.4

SELECT ProductNumber, Name, ListPrice FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-[^R]%-[1-9][1-9]';