--1.1.
DECLARE @OrderDate datetime = GETDATE()
DECLARE @DueDate datetime = DATEADD(dd, 7, GETDATE())
DECLARE @CustomerID int = 1
DECLARE @SalesOrderID int 

SET @SalesOrderID = NEXT VALUE FOR AdventureWorksLT2014.SalesLT.SalesOrderNumber

INSERT INTO SalesLT.SalesOrderHeader (OrderDate, DueDate, CustomerID, ShipMethod, SalesOrderID) 
VALUES (@OrderDate, @DueDate, @CustomerID, 'CARGO TRANSPORT 5', @SalesOrderID)

SELECT * FROM SalesLT.SalesOrderHeader

PRINT @SalesOrderID;

--1.2

DECLARE @ProductID int = 760
DECLARE @Quantity int = 1 
DECLARE @UnitPrice money = 782.99
DECLARE @SalesOrderID1 int = IDENT_CURRENT('SalesLT.SalesOrderHeader'); 


IF EXISTS (SELECT * FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @SalesOrderID1)
	INSERT INTO SalesLT.SalesOrderDetail (ProductID, OrderQty, UnitPrice, SalesOrderID) 
	VALUES (@ProductID, @Quantity, @UnitPrice, @SalesOrderID1)
ELSE 
	PRINT 'Заказ не существует'

SELECT * FROM SalesLT.SalesOrderHeader

--2.1

DECLARE @AVGPrice money = 2000
DECLARE @MAXPrice money = 5000
DECLARE @AVGListPrice money 
DECLARE @MAXListPrice money 

SELECT @AVGListPrice = AVG(ListPrice), @MAXListPrice = MAX(ListPrice) FROM SalesLT.Product
WHERE ProductCategoryID IN (SELECT DISTINCT ProductCategoryID FROM SalesLT.vGetAllCategories WHERE ParentProductCategoryName = 'Bikes')

PRINT 'New bike AVG cost: ' + CONVERT(nvarchar, @AVGListPrice)
PRINT 'New bike MAX cost: ' + CONVERT(nvarchar, @MAXListPrice)

WHILE (@AVGListPrice < @AVGPrice) 
BEGIN
	UPDATE SalesLT.Product SET ListPrice = ListPrice * 1.1
	WHERE ProductID IN (SELECT DISTINCT ProductCategoryID FROM SalesLT.vGetAllCategories WHERE ParentProductCategoryName = 'Bikes')

	SELECT @AVGListPrice = AVG(ListPrice), @MAXListPrice = MAX(ListPrice) FROM SalesLT.Product
	WHERE ProductID IN (SELECT DISTINCT ProductCategoryID FROM SalesLT.vGetAllCategories WHERE ParentProductCategoryName = 'Bikes')

	IF @MAXListPrice > @MAXPrice
		BREAK 
	ELSE
		CONTINUE
END

PRINT 'New bike AVG cost: ' + CONVERT(nvarchar, @AVGListPrice)
PRINT 'New bike MAX cost: ' + CONVERT(nvarchar, @MAXListPrice)
	
