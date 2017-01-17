/******************
Notes
*******************/

SELECT 
T1."CardCode",
T1."CardName",
T0."ItemCode", 
T0."Dscription", 
SUM(
  (CASE
    WHEN T1."DiscPrcnt" != 0
     THEN T0."LineTotal" / (1 + (T1."DiscPrcnt"  / 100))
    ELSE T0."LineTotal"
  END)) AS "Total Sales Amount", 
SUM(
  (CASE
    WHEN T1."DiscPrcnt" != 0
      THEN T0."LineTotal" / (1 + (T1."DiscPrcnt"  / 100))
    ELSE T0."LineTotal"
  END) - T0."StockValue") AS "Gross Profit",
SUM(
  (CASE
    WHEN T1."DiscPrcnt" != 0
      THEN T0."LineTotal" / (1 + (T1."DiscPrcnt"  / 100))
    ELSE T0."LineTotal"
  END) - ((CASE
    WHEN T1."DiscPrcnt" != 0
      THEN T0."LineTotal" / (1 + (T1."DiscPrcnt"  / 100))
    ELSE T0."LineTotal"
  END) - T0."StockValue")) AS "Total Base Price for Profit",
(CASE
  WHEN SUM((CASE
    WHEN T1."DiscPrcnt" != 0
     THEN T0."LineTotal" / (1 + (T1."DiscPrcnt"  / 100))
    ELSE T0."LineTotal"
  END)) = 0
    THEN -1
  ELSE (SUM((CASE
    WHEN T1."DiscPrcnt" != 0
     THEN T0."LineTotal" / (1 + (T1."DiscPrcnt"  / 100))
    ELSE T0."LineTotal"
  END) - T0."StockValue")) / SUM((CASE
    WHEN T1."DiscPrcnt" != 0
      THEN T0."LineTotal" / (1 + (T1."DiscPrcnt"  / 100))
    ELSE T0."LineTotal"
  END)) 
END) AS "Gross Profit %"

FROM 
INV1 T0 
RIGHT OUTER JOIN OINV T1 ON T0."DocEntry" = T1."DocEntry"

WHERE 
T1."DocDate" BETWEEN [%0] AND [%1]

GROUP BY T1."CardCode", T1."CardName", T0."ItemCode", T0."Dscription"

UNION

SELECT 
T1."CardCode",
T1."CardName",
T0."ItemCode", 
T0."Dscription", 
SUM((T0."PriceAfVAT" * T0."Quantity") * -1) AS "Total Sales Amount", 
SUM((T0."GrssProfit") * -1) AS "Gross Profit",
SUM(((T0."PriceAfVAT" * T0."Quantity") - T0."GrssProfit") * -1) AS "Total Base Price for Profit",
0

FROM 
RIN1 T0 
RIGHT OUTER JOIN ORIN T1 ON T0."DocEntry" = T1."DocEntry"

WHERE 
T1."DocDate" BETWEEN [%0] AND [%1]

GROUP BY T1."CardCode", T1."CardName", T0."ItemCode", T0."Dscription"

ORDER BY
T1."CardName", T0."ItemCode"


