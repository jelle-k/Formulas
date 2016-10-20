/*
Goods Receipt
*/

SELECT 
T1."ItemCode", 
T1."Dscription", 
T1."Quantity", 
T0."DocDate",
T0."DocNum", 
T1."BaseRef"  

FROM 
OIGN T0  
INNER JOIN IGN1 T1 ON T0."DocEntry" = T1."DocEntry"



WHERE 
T1."BaseRef" IS NOT NULL





