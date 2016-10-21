SELECT 
  T1."ItemCode", 
  T1."Dscription", 
  T1."Quantity", 
  T0."DocDate", 
  T0."DocNum", 
  T1."BaseRef" 

FROM 
  OIGE T0  
  INNER JOIN IGE1 T1 ON T0."DocEntry" = T1."DocEntry" 

WHERE 
  MONTH( T0."DocDate") = 4 AND
  YEAR(T0."DocDate") = 2016 AND
  T1."ItemCode" = '44004' AND 
  T1."BaseRef" IS NULL