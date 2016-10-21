SELECT 
  T0."BaseRef", 
  T0."ItemCode",
  T0."StockPrice" * T0."Quantity" "total" 

FROM 
  IGE1 T0 
WHERE 
  T0."BaseRef" = 2443 AND
  LEFT(T0."ItemCode",2) <> 99 



----------------------------------------------------------------

SELECT 
  T0."BaseRef", 
  SUM(T0."StockPrice" * T0."Quantity") "total" --€(231.87 + 656.04) + 1978.97
--T0."ItemCode",
--T0."Price",
--T0."Quantity"

FROM 
  IGE1 T0 
WHERE 
  T0."BaseRef" = 2443


GROUP BY 
  T0."BaseRef"

----------------------------------------------------------------------

SELECT
  T0."BaseRef", 
  SUM(T0."StockPrice" * T0."Quantity") "total €", --€(231.87 + 656.04) + 1978.97
  --T0."ItemCode",
  --T0."Price",
  --T0."Quantity"
  T1."ItemCode"
  --T1."PlannedQty",
  --T1."CmpltQty",
  --T1."DueDate",
  --((T0."StockPrice" * T0."Quantity") / T1."CmpltQty") "cost per Piece"

FROM
  IGE1 T0
  LEFT OUTER JOIN OWOR T1 ON T0."BaseRef" = T1."DocNum" 
WHERE 
  T0."BaseRef" = 2443

GROUP BY 
  T0."BaseRef", 
  --T1."ItemCode", 
  --T1."PlannedQty", 
  --T1."CmpltQty", 
  --T1."DueDate", 
  --((T0."StockPrice" * T0."Quantity") / T1."CmpltQty") 




------------------------------


SELECT
T1."DocNum" "Production Order Number",
T1."ItemCode" "Item Code",
T1."PlannedQty" "Planned Quantity",
T1."CmpltQty" "Completed Quantity",
(T1."CmpltQty" / T1."PlannedQty") * 100 "Percent - %",
T1."DueDate" "Production order date",
(SELECT sum(T0."StockPrice" * T0."Quantity")
FROM IGE1 T0 
WHERE T0."BaseRef" = [%1]
GROUP BY T0."BaseRef"
) "Total Cost - €",
((SELECT sum(T0."StockPrice" * T0."Quantity")
FROM IGE1 T0 
WHERE T0."BaseRef" = [%1]
GROUP BY T0."BaseRef"
) / T1."CmpltQty") "Value per Item - €"

FROM
OWOR T1

WHERE T1."DocNum" = [%1] --AND
--T1."DocDate" BETWEEN [%0] AND [%1]

---------------------------------------


Declare @var1 VARCHAR(10)
Set @var1 = T0."DocNum"

SET @SQL VARCHAR(max)
SET @SQL = SELECT
T0."DocNum",
T0."ItemCode"


FROM  OWOR T0

WHERE var1 = 2443
EXEC(@SQL)	


-------------------------------------------

SELECT
T1."DocNum" "Production Order Number",
T1."ItemCode" "Item Code",
T1."PlannedQty" "Planned Quantity",
T1."CmpltQty" "Completed Quantity",
(T1."PlannedQty" / T1."CmpltQty") * 100 "Percent %",
T1."DueDate" "Production order date",

(SELECT sum(T0."StockPrice" * T0."Quantity")
FROM IGE1 T0 
LEFT OUTER JOIN OWOR T1 ON T0."BaseRef" = T1."DocNum"
WHERE T1."DocDate" BETWEEN [%0] AND [%1]
GROUP BY T0."BaseRef"
) "Total Cost - €",

((SELECT sum(T0."StockPrice" * T0."Quantity")
FROM IGE1 T0 
LEFT OUTER JOIN OWOR T1 ON T0."BaseRef" = T1."DocNum"
WHERE T1."DocDate" BETWEEN [%0] AND [%1]
GROUP BY T0."BaseRef"
) / T1."CmpltQty") "Value per Item €"

FROM
OWOR T1

WHERE T1."DocDate" BETWEEN [%0] AND [%1] 