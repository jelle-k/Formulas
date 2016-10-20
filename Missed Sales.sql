/***************************
T0 - ORDR - Order Header
T1 - RDR1 - Order Lines
***************************/

SELECT 
T0."DocNum", 
T0."CardCode", 
T0."CardName", 
T1."ItemCode", 
T1."Dscription", 
T1."Quantity", 
T1."DelivrdQty", 
(T1."Quantity" - T1."DelivrdQty") AS "Difference",
(T1."Price" * (T1."Quantity" - T1."DelivrdQty")) AS "Value (€)", 
T0."DocDueDate" "Delivery Date"

FROM 
ORDR T0  
INNER JOIN RDR1 T1 ON T0."DocEntry" = T1."DocEntry" 

WHERE 
T1."Quantity" <> T1."DelivrdQty" 
AND
T0."DocDueDate" >=[%0] and  T0."DocDueDate" <=[%1]
AND
T0."DocStatus" = 'C'