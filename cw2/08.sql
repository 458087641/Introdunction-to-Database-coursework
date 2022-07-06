SELECT Z.ocust AS customerID, max(Z.diff) AS numberofdays 
FROM (SELECT ocust AS ocust1 FROM Orders GROUP BY ocust HAVING count(ordid) >= 2) AS X 
JOIN ((SELECT O.ocust, O.odate, min(O1.odate) AS date2, abs(O.odate - min(O1.odate)) AS diff 
FROM Orders O JOIN Orders O1 ON O.ocust = O1.ocust AND O1.odate > O.odate GROUP BY O.ocust, O.odate)) AS Z 
ON Z.ocust = X.ocust1 GROUP BY Z.ocust;


