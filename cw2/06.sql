SELECT D.Pcode AS productcode , SUM(D.qty) AS timesOrdered
FROM Products P, Details D,(SELECT SUM(D.qty) AS total, P.ptype, COUNT(P.ptype)-1 AS Pcount
			FROM Products P, Details D
			WHERE P.pcode = D.pcode 
			GROUP BY P.ptype) AS Z
WHERE P.pcode = D.pcode  and P.ptype=Z.ptype
GROUP BY D.pcode,P.ptype,Z.total,Z.Pcount
HAVING SUM(D.qty)> 1.5* ((Z.total -SUM(D.qty))/Z.Pcount);
