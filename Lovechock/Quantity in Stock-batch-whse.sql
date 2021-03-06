SELECT
  T0."ItemCode", 
  T2."ItemName", 
  T0."DistNumber" as "BatchNum", 
  T1."WhsCode", 
  T1."Quantity"

FROM
  OBTN T0
  INNER JOIN OBTQ T1 ON T0."ItemCode" = T1."ItemCode" and T0."SysNumber" = T1."SysNumber"
  INNER JOIN OITM T2 ON T0."ItemCode" = T2."ItemCode"
  -- RIGHT OUTER JOIN IGE1 T3 ON T0."ItemCode" = T1."ItemCode"
  -- RIGHT OUTER JOIN OIGE T4 ON T3."DocEntry" = T4."DocEntry"
  -- RIGHT OUTER JOIN (
  -- SELECT T1."ItemCode", MAX(T0."DocDate") "maxDate" 
  -- FROM OIGE T0 INNER JOIN IGE1 T1 ON T0."DocEntry" = T1."DocEntry"
  -- GROUP BY T1."ItemCode") TM ON T0."ItemCode" = TM."ItemCode" AND T4."DocDate" = TM."maxDate"
WHERE
  T0."ItemCode" = '22020'
     
     