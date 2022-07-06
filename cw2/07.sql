SELECT B.pcode AS productcode,B.price AS productprice
FROM ((SELECT D.pcode AS c2,SUM(D.qty)/COUNT(D.ordid) AS qty
    FROM Details D 
    GROUP BY D.pcode) AS A
    JOIN Products P
    ON P.pcode = A.c2) AS B
WHERE B.qty>= 3;