--1.1 

DELETE FROM SalesLT.Product	WHERE Name = 'LED Lights'
INSERT INTO SalesLT.Product  (Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate) 
VALUES ('LED Lights', 'LT-L123', 2.56, 12.99, 37, GETDATE())

SELECT IDENT_CURRENT('SalesLT.Product') AS LastID
SELECT * FROM SalesLT.Product WHERE ProductID = IDENT_CURRENT('SalesLT.Product')

--1.2

DELETE FROM SalesLT.Product WHERE Name IN ('Bicycle Bell','Bicycle Horn')
DELETE FROM SalesLT.ProductCategory WHERE Name = 'Bells and Horns'

INSERT INTO SalesLT.ProductCategory  (ParentProductCategoryID, Name) 
VALUES (4, 'Bells and Horns')

INSERT INTO SalesLT.Product (Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate)
VALUES 
	('Bicycle Bell', 'BB-RING', 2.47, 4.99, IDENT_CURRENT('SalesLT.ProductCategory'), GETDATE()),
	('Bicycle Horn', 'BB-PARP', 1.29, 3.75, IDENT_CURRENT('SalesLT.ProductCategory'), GETDATE())

SELECT * FROM SalesLT.ProductCategory
SELECT IDENT_CURRENT('SalesLT.ProductCategory')
SELECT * FROM SalesLT.Product WHERE ProductID IN (IDENT_CURRENT('SalesLT.Product') - 1, IDENT_CURRENT('SalesLT.Product'))

--2.1

UPDATE SalesLT.Product
SET ListPrice = (ListPrice * 1.1)
FROM SalesLT.Product
JOIN SalesLT.ProductCategory ON SalesLT.Product.ProductCategoryID = SalesLT.ProductCategory.ProductCategoryID
WHERE SalesLT.ProductCategory.Name = 'Bells and Horns'

SELECT * FROM SalesLT.Product
JOIN SalesLT.ProductCategory ON SalesLT.Product.ProductCategoryID = SalesLT.ProductCategory.ProductCategoryID
WHERE SalesLT.ProductCategory.Name = 'Bells and Horns'


--2.2

UPDATE SalesLT.Product 
SET DiscontinuedDate = GETDATE()
WHERE ProductCategoryID = 37 AND ProductNumber <> 'LT-L123'

SELECT * FROM SalesLT.Product
WHERE ProductCategoryID = 37

--3.1 

DELETE FROM SalesLT.Product WHERE Name IN ('Bicycle Bell','Bicycle Horn')
DELETE FROM SalesLT.ProductCategory WHERE Name = 'Bells and Horns'
SELECT * FROM SalesLT.ProductCategory
SELECT * FROM.SalesLT.Product
