/*
    *** Show values for Raw Materials ***
    OITM T0 = Item Master data
    IGE1 T1 = Goods Issue Rows
    OIGE T2 = Goods Issue Header
    OITW T3 = Warehouse Header
    OBTN T4 = Batch Code header
*/

SELECT DISTINCT 
  T0."ItemCode", 
  T0."ItemName", 
  T1."ShipDate", 
  T5."WhsCode", 
  T5."OnHand",
  T6."Price",
  (T5."OnHand" * T6."Price") "Value"

FROM OITM T0
  INNER JOIN IGE1 T1 ON T0."ItemCode" = T1."ItemCode"
  INNER JOIN (
    SELECT T1."ItemCode", MAX(T1."ShipDate") "maxDate" 
    FROM OIGE T0 INNER JOIN IGE1 T1 ON T0."DocEntry" = T1."DocEntry"
    GROUP BY T1."ItemCode") TM ON T0."ItemCode" = TM."ItemCode" AND T1."ShipDate" = TM."maxDate"
  INNER JOIN OITW T5 ON T0."ItemCode" = T5."ItemCode"
  INNER JOIN ITM1 T6 ON T0."ItemCode" = T6."ItemCode"

WHERE 
  T0."ItemCode" Not IN (SELECT Distinct T1."ItemCode" FROM IGE1 T1 INNER JOIN OIGE T2 ON T2."DocEntry" = T1."DocEntry" WHERE DAYS_BETWEEN(T2."DocDueDate",CURRENT_DATE) <16) AND
  T0."ItmsGrpCod" IN (101) AND
  T0."validFor" = 'Y' AND
  T6."PriceList" = 11 AND
  T5."OnHand" != 0 

UNION

/*
    *** Show values for Finished product ***
    OITM T0 = Item Master data
    DLN1 T1 = Delivery Rows
    ODLN T2 = Delivery Header
    OITW T3 = Warehouse Header
    OBTN T4 = Batch Code header
*/

SELECT DISTINCT 
  T0."ItemCode", 
  T0."ItemName", 
  T1."ShipDate", 
  T5."WhsCode", 
  T5."OnHand",
  T6."Price",
  (T5."OnHand" * T6."Price") "Value"

FROM OITM T0
  INNER JOIN DLN1 T1 ON T0."ItemCode" = T1."ItemCode"
  INNER JOIN (
    SELECT T1."ItemCode", MAX(T1."ShipDate") "maxDate" 
    FROM ODLN T0 INNER JOIN DLN1 T1 ON T0."DocEntry" = T1."DocEntry"
    GROUP BY T1."ItemCode") TM ON T0."ItemCode" = TM."ItemCode" AND T1."ShipDate" = TM."maxDate"
  INNER JOIN OITW T5 ON T0."ItemCode" = T5."ItemCode"
  INNER JOIN ITM1 T6 ON T0."ItemCode" = T6."ItemCode"

WHERE 
  T0."ItemCode" Not IN (SELECT Distinct T1."ItemCode" FROM DLN1 T1 INNER JOIN ODLN T2 ON T2."DocEntry" = T1."DocEntry" WHERE DAYS_BETWEEN(T2."DocDueDate",CURRENT_DATE) <30) AND
  T0."ItmsGrpCod" IN (113, 114, 104, 111) AND
  T0."validFor" = 'Y' AND
  T6."PriceList" = 11 AND
  T5."OnHand" != 0 

ORDER BY T0."ItemCode"
