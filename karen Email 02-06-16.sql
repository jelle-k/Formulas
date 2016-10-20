
/******************************
T0 = OPOR (Purchase order header)
T1 = POR1 (Purchase oder lines)
T2 = OPCH (Purchase invoice header)
T3 = PCH1 (Purchase invoice lines)
T4 = Business Partner Masterdata

******************************/


SELECT
--T0."DocDate",
--T2."DocDate",
T4."CardCode",
T4."CardName",
SUM(T1."Price") AS "Sum Purchase order",
SUM(T3."Price") AS "Sum Purchase invoice"



FROM
OCRD T4
INNER JOIN OPOR T0 ON T4."CardCode" = T0."CardCode"
INNER JOIN POR1 T1 ON T0."DocEntry" = T1."DocEntry"
INNER JOIN OPCH T2 ON T4."CardCode" = T2."CardCode"
INNER JOIN PCH1 T3 ON T2."DocEntry" = T3."DocEntry"



WHERE
T4."CardCode" = '700111'
AND
T0."DocStatus" = 'O' 
OR
T2."DocStatus" = 'O'

GROUP BY
--T4."CardCode", T0."CardCode", T2."CardCode"
T4."CardCode", T4."CardName", T4."CardCode", T4."CardCode"