SELECT ocu1 AS customerID ,Y AS totalbooks
FROM (( SELECT O.ocust AS ocu,SUM(D.qty) AS X
            FROM Products P,Orders O, Details D
            WHERE P.ptype <> 'BOOK'
            AND O.ordid = D.ordid
            AND D.pcode = P.pcode
            GROUP BY O.ocust) AS A
            JOIN ( SELECT O.ocust AS ocu1,SUM(D.qty) AS Y
                        FROM Products P,Orders O, Details D
                        WHERE P.ptype = 'BOOK'
                        AND O.ordid = D.ordid
                        AND D.pcode = P.pcode
                        GROUP BY O.ocust) AS B
            ON A.ocu = B.ocu1) AS C
WHERE Y>2*X;