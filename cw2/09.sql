SELECT X.ocust AS customerID, CX.cname AS customername, X.toto totalorders
FROM (SELECT C.toto,C.ocust
FROM(SELECT O.ocust 
    FROM Orders O 
    WHERE O.ocust NOT IN (SELECT O1.ocust  
    FROM orders O1, orders O2 
    WHERE O1.odate =O2.odate 
    AND O1.ocust = O2.ocust 
    AND O1.ordid <> O2.ordid
    GROUP BY O1.ocust
    HAVING COUNT(O1.ocust)=2)
    GROUP BY O.ocust 
    HAVING COUNT(O.ocust)>=10) AS A
        JOIN (SELECT B.ocust,COUNT(B.ocust)AS toto, SUM(B.diff) AS totd 
        FROM (SELECT O.ocust, O.odate, abs(O.odate - max(O1.odate)) AS diff
            FROM Orders O
            LEFT JOIN Orders O1 ON O.ocust = O1.ocust
            AND O1.odate < O.odate 
            GROUP BY O.ocust, O.odate) AS B
        GROUP BY B.ocust)AS C
    ON A.ocust = C.ocust
WHERE (C.totd)/(C.toto-1 ) < 7) AS X, Customers CX
WHERE CX.custid = X.ocust;