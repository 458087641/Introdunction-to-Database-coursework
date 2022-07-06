SELECT I.invid AS InvoiceID, (SUM(P.amount) - I.amount) AS RefundAmount
FROM Invoices AS I, Payments AS P
WHERE I.invid = P.invid  
GROUP BY I.invid 
HAVING (SUM(P.amount) - I.amount)>0;