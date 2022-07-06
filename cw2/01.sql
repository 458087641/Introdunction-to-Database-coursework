SELECT C.country AS CountryCode, COUNT(O.ordid) AS TotalOrders
FROM Orders AS O , Customers AS C
WHERE C.custid=O.ocust and O.odate>='20170101' and O.odate<='20201231'
GROUP BY C.country;