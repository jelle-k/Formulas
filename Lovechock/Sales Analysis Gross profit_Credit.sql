UNION

SELECT 
T1."CardCode",
T1."CardName",
T0."ItemCode", 
T0."Dscription", 
SUM((T0."PriceAfVAT" * T0."Quantity") * -1) AS "Total Sales Amount", 
SUM((T0."GrssProfit") * -1) AS "Gross Profit",
SUM(((T0."PriceAfVAT" * T0."Quantity") - T0."GrssProfit") * -1) AS "Total Base Price for Profit",
SUM(T0."GrssProfit" / (1 + (T0."PriceAfVAT" * T0."Quantity") / 100)) AS "Gross Profit %"

FROM 
RIN1 T0 
RIGHT OUTER JOIN ORIN T1 ON T0."DocEntry" = T1."DocEntry"

WHERE 
T1."DocDate" BETWEEN [%0] AND [%1] AND 
T1."CardCode" = 100774

GROUP BY T1."CardCode", T1."CardName", T0."ItemCode", T0."Dscription"

ORDER BY
T1."CardName"