SELECT DISTINCT Z.ordid AS orderID, O.odate AS orderdate,P.ptype AS producttype
FROM (SELECT DISTINCT D2.ordid, P2.ptype
	FROM Details AS D2, Products AS P2
	WHERE D2.pcode= P2.pcode) AS Z, Products AS P, Orders AS O, Details AS D
WHERE O.ordid = Z.ordid and D.ordid= O.ordid and D.pcode = P.pcode and Z.ordid NOT IN
		(SELECT Z1.ordid
		FROM (SELECT DISTINCT D2.ordid, P2.ptype
			FROM Details AS D2, Products AS P2
			WHERE D2.pcode= P2.pcode) AS Z1
			GROUP BY Z1.ordid
			HAVING (COUNT(Z1.ordid)>1)); 

