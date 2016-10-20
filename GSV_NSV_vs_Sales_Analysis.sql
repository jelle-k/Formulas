SELECT
T0."DocNum",
T0."CardCode",
T1."Dscription",
T1."LineTotal"	


FROM OINV T0
INNER JOIN INV1 T1 ON T0."DocEntry" = T1."DocEntry"
INNER JOIN OCRD T2 ON T0."CardCode" = T2."CardCode"

WHERE
T0."CardCode" IN ('108196','100060') AND
MONTH(T0."DocDate") = 4 AND YEAR(T0."DocDate") = YEAR(CURRENT_DATE)


