SELECT C.custid AS customerID, C.cname AS CustomerName, MAX(O.odate) AS OrderDate
FROM Customers AS C, Orders AS O
WHERE C.custid = O.ocust
GROUP BY C.custid;