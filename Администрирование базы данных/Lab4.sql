--1.1

SELECT CompanyName, AddressLine1, City, 'Billing' AS AddressType 
FROM SalesLT.Address JOIN SalesLT.CustomerAddress ON (SalesLT.Address.AddressID = SalesLT.CustomerAddress.AddressID)
JOIN SalesLT.Customer ON (SalesLT.CustomerAddress.CustomerID = SalesLT.Customer.CustomerID)
WHERE AddressType = 'Main office'

--1.2

SELECT CompanyName, AddressLine1, City, 'Shipping' AS AddressType 
FROM SalesLT.Address JOIN SalesLT.CustomerAddress ON (SalesLT.Address.AddressID = SalesLT.CustomerAddress.AddressID)
JOIN SalesLT.Customer ON (SalesLT.CustomerAddress.CustomerID = SalesLT.Customer.CustomerID)
WHERE AddressType = 'Shipping'

--1.3

SELECT CompanyName, AddressLine1, City, 'Billing' AS AddressType 
FROM SalesLT.Address JOIN SalesLT.CustomerAddress ON (SalesLT.Address.AddressID = SalesLT.CustomerAddress.AddressID)
JOIN SalesLT.Customer ON (SalesLT.CustomerAddress.CustomerID = SalesLT.Customer.CustomerID)
WHERE AddressType = 'Main office'

UNION 

SELECT CompanyName, AddressLine1, City, 'Shipping' AS AddressType 
FROM SalesLT.Address JOIN SalesLT.CustomerAddress ON (SalesLT.Address.AddressID = SalesLT.CustomerAddress.AddressID)
JOIN SalesLT.Customer ON (SalesLT.CustomerAddress.CustomerID = SalesLT.Customer.CustomerID)
WHERE AddressType = 'Shipping'

ORDER BY CompanyName, AddressType

--2.1

SELECT CompanyName
FROM SalesLT.Customer JOIN SalesLT.CustomerAddress ON (SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID)
WHERE AddressType = 'Main office'

EXCEPT 

SELECT CompanyName
FROM SalesLT.Customer JOIN SalesLT.CustomerAddress ON (SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID)
WHERE AddressType = 'Shipping'

--2.2

SELECT CompanyName
FROM SalesLT.Customer JOIN SalesLT.CustomerAddress ON (SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID)
WHERE AddressType = 'Main office'

INTERSECT 

SELECT CompanyName
FROM SalesLT.Customer JOIN SalesLT.CustomerAddress ON (SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID)
WHERE AddressType = 'Shipping'
