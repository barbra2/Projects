--1.1 

DECLARE @SalesOrderID int = 71902

IF EXISTS (SELECT SalesOrderID FROM SalesLT.SalesOrderDetail WHERE SalesOrderID = @SalesOrderID) 

	BEGIN 
		DELETE FROM SalesLT.SalesOrderDetail WHERE SalesOrderID = @SalesOrderID
		DELETE FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @SalesOrderID
	END
ELSE 
	BEGIN 
		DECLARE @ErrorMessage nvarchar(64) = CONCAT('Order #', convert(nvarchar, @SalesOrderID),' is not exist');
		THROW 50001, @ErrorMessage, 1
	END 

--1.2 

DECLARE @SalesOrderID2 int = 88

BEGIN TRY
	IF EXISTS (SELECT * FROM SalesLT.SalesOrderDetail WHERE SalesOrderID = @SalesOrderID2) 

		BEGIN 
			DELETE FROM SalesLT.SalesOrderDetail WHERE SalesOrderID = @SalesOrderID2
			DELETE FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @SalesOrderID2
		END
	ELSE 
		BEGIN 
			DECLARE @ErrorMessage2 nvarchar(64) = CONCAT('Order #', convert(nvarchar, @SalesOrderID2),' is not exist');
			THROW 51111, @ErrorMessage2, 1
		END 
END TRY

BEGIN CATCH 
	PRINT ERROR_MESSAGE()
END CATCH

--2.1 

DECLARE @SalesOrderID3 int = 500

BEGIN TRY 
BEGIN TRANSACTION 
	IF (EXISTS(SELECT SalesOrderID FROM SalesLT.SalesOrderDetail WHERE SalesOrderID = @SalesOrderID3))
	DELETE FROM SalesLT.SalesOrderDetail WHERE SalesOrderID = @SalesOrderID3;
	THROW 51000, 'Order is not found', 0
	DELETE FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @SalesOrderID3; 
COMMIT TRANSACTION
END TRY 

BEGIN CATCH 
	PRINT 'Error';
ROLLBACK
END CATCH

--SELECT SalesOrderID FROM SalesLT.SalesOrderHeader
--ORDER BY SalesOrderID

--SELECT SalesOrderID FROM SalesLT.SalesOrderDetail
--ORDER BY SalesOrderID























