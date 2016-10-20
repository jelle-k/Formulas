SELECT
T0."DocNum",
T0."DocDate" AS "Posting Date",
T0."CardCode",
T2."CardName",
(CASE
	WHEN T0."DocType" = 'I'
	THEN T1."ItemCode"
	ELSE NULL
END) AS "Item Code",
T1."Dscription",
T2."Country",
MONTH(T0."DocDate") AS "Month",
T1."LineTotal" AS "Row Total",
(CASE
	WHEN T0."DocType" = 'I'
	THEN (T1."Quantity"*T1."PriceBefDi")
	ELSE NULL
END) AS "GSV",
(CASE
	WHEN T0."DocType" = 'I'
	THEN ((T1."Quantity"*T1."PriceBefDi")-T1."LineTotal") 
	ELSE NULL
END) AS "Discount",
(CASE
	WHEN T0."DocType" = 'I'
	THEN T1."Quantity"
	ELSE NULL
END) AS "Qty",
(CASE
	WHEN T0."DocType" = 'I'
	THEN T3."ItmsGrpCod"
	ELSE NULL
END) AS "Group Code",
(CASE
	WHEN T0."DocType" = 'I'
	THEN T1."Price"
	ELSE NULL
END) AS "Price"


FROM OINV T0
INNER JOIN INV1 T1 ON T0."DocEntry" = T1."DocEntry"
INNER JOIN OCRD T2 ON T0."CardCode" = T2."CardCode"
LEFT OUTER JOIN OITM T3 ON T1."ItemCode" = T3."ItemCode"



WHERE
--T0."CardCode" IN ('108196','100060','100270') AND
MONTH(T0."DocDate") = 4 AND YEAR(T0."DocDate") = YEAR(CURRENT_DATE)

UNION ALL
SELECT
T0."DocNum",
T0."DocDate" AS "Posting Date",
T0."CardCode",
T2."CardName",
T1."Dscription",
(CASE
	WHEN T0."DocType" = 'I'
	THEN T1."ItemCode"
	ELSE NULL
END) AS "Item Code",
T2."Country",
MONTH(T0."DocDate") AS "Month",
(T1."LineTotal" * -1) AS "GSV",
(CASE
	WHEN T0."DocType" = 'I'
	THEN (T1."Quantity"*T1."PriceBefDi")
	ELSE NULL
END) AS "Row Total",
(CASE
	WHEN T0."DocType" = 'I'
	THEN T1."Quantity"
	ELSE NULL
END) AS "Qty",
(CASE
	WHEN T0."DocType" = 'I'
	THEN ((T1."Quantity"*T1."PriceBefDi")-T1."LineTotal") 
	ELSE NULL
END) AS "Discount",
(CASE
	WHEN T0."DocType" = 'I'
	THEN T3."ItmsGrpCod"
	ELSE NULL
END) AS "Group Code",
(CASE
	WHEN T0."DocType" = 'I'
	THEN T1."Price"
	ELSE NULL
END) AS "Price"

FROM
ORIN T0
INNER JOIN RIN1 T1 ON T0."DocEntry" = T1."DocEntry"
INNER JOIN OCRD T2 ON T0."CardCode" = T2."CardCode"
LEFT OUTER JOIN OITM T3 ON T1."ItemCode" = T3."ItemCode"


WHERE
--T0."CardCode" IN ('108196','100060','100270') AND
MONTH(T0."DocDate") = 4 AND YEAR(T0."DocDate") = YEAR(CURRENT_DATE)

