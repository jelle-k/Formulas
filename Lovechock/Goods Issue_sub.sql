SELECT 
  T3."ItemCode", 
  T3."Dscription", 
  T3."Quantity", 
  T2."DocDate", 
  T2."DocNum", 
  T3."BaseRef" 

FROM 
  OIGE T0  
  INNER JOIN IGE1 T1 ON T0."DocEntry" = T1."DocEntry" 

WHERE 
  T3."BaseRef" IS NULL