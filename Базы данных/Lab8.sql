--1.1

SELECT a.CountryRegion, a.StateProvince, SUM(soh.TotalDue) AS Revenue
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY CUBE(a.CountryRegion, a.StateProvince)
ORDER BY a.CountryRegion, a.StateProvince;

--1.2

SELECT a. CountryRegion, a. StateProvince, SUM (soh. TotalDue) AS Revenue,IIF(GROUPING_ID(a.CountryRegion,a.StateProvince)=3,'Total',IIF(GROUPING_ID(a.CountryRegion,a.StateProvince)=2,a.StateProvince + ' Subtotal',a.CountryRegion + ' Subtotal')) as Level
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
JOIN SalesLT. Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY CUBE(a.CountryRegion, a.StateProvince)
ORDER BY a.CountryRegion, a.StateProvince;


--1.3

SELECT a. CountryRegion, a. StateProvince,a.City ,SUM (soh. TotalDue) AS Revenue,GROUPING_ID(a.CountryRegion,a.StateProvince,a.city),

CASE WHEN GROUPING_ID(a.CountryRegion,a.StateProvince,a.city)=7 THEN 'TOTAL'
WHEN GROUPING_ID(a.CountryRegion,a.StateProvince,a.city)=5 THEN StateProvince + ' SUBTOTAL'
WHEN GROUPING_ID(a.CountryRegion,a.StateProvince,a.city)=3 THEN CountryRegion+ ' SUBTOTAL'
WHEN GROUPING_ID(a.CountryRegion,a.StateProvince,a.city)=6 THEN city + ' SUBTOTAL'
END

AS Level
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
JOIN SalesLT. Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY CUBE(a.CountryRegion, a.StateProvince, a.City)
ORDER BY a.CountryRegion, a.StateProvince;

--2.1

WITH TAB(PN,CN,LT) AS

(SELECT ParentProductCategoryName, CompanyName, LineTotal  FROM SalesLT.vGetAllCategories,[SalesLT].[Product],[SalesLT].[SalesOrderDetail],[SalesLT].[SalesOrderHeader],[SalesLT].[Customer]
WHERE 
[Product].ProductCategoryID = vGetAllCategories.ProductCategoryID AND
[SalesOrderDetail].ProductID = [Product].ProductID AND
[SalesOrderHeader].SalesOrderID=[SalesOrderDetail].SalesOrderID AND
[Customer].CustomerID = [SalesOrderHeader].CustomerID)

SELECT CN,Bikes,Accessories,Clothing,Components FROM TAB PIVOT(SUM(LT) FOR PN IN(Accessories, Bikes, Clothing, Components)) AS R ORDER BY CN