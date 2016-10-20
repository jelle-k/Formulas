/****************
Open invoices and open purchase orders
****************/
SELECT
T0."CardCode",
T0."CardName",
T1."DocNum",
T1."DocEntry",
T1."DocDueDate",
T2."Dscription",
T2."AcctCode",
(CASE
	WHEN T1."DocType" = 'I'
		THEN (T2."Price" * T2."Quantity")
	WHEN T1."DocType" = 'S'
		THEN T2."Price"
END) AS "Price before VAT",
(CASE
	WHEN T1."DocType" = 'I'
		THEN (T2."PriceAfVAT" * T2."Quantity")
	WHEN T1."DocType" = 'S'
		THEN T2."Price"
END) AS "Price afer VAT",
T2."Currency",
T2."TargetType"


FROM OCRD T0
INNER JOIN OPOR T1 ON T0."CardCode" = T1."CardCode"
INNER JOIN POR1 T2 ON T1."DocEntry" = T2."DocEntry"


WHERE
T1."DocStatus" = 'O' AND
T0."CardCode" = '701020'

UNION ALL

SELECT
T0."CardCode",
T0."CardName",
T3."DocNum",
T3."DocEntry",
T3."DocDueDate",
T4."Dscription",
T4."AcctCode",
T4."Price" AS "Price before VAT",
T4."PriceAfVAT" AS "Price afer VAT",
T4."Currency",
T4."TargetType"


FROM
OCRD T0
INNER JOIN OPCH T3 ON T0."CardCode" = T3."CardCode"
INNER JOIN PCH1 T4 ON T3."DocEntry" = T4."DocEntry"

WHERE
T0."CardCode" = '701020'