	/*
		Sum per Region Current Month
*/

SELECT
	"Region",
	SUM("GSV") "GSV",
	SUM("Discount") "Discount",
	SUM("NSV") "NSV"

FROM
	
(

/*
AR Invoice
*/
SELECT
(CASE
	WHEN T0."CardCode" = '105585' 
	THEN 'BENE'
	WHEN T0."CardCode" = '107957'
	THEN 'INDIR'
	WHEN T0."CardCode" = '105989'
	THEN 'FR'
	WHEN T2."Country" = 'NL'
	THEN 'BENE'
	WHEN T2."Country" = 'BE'
	THEN 'BENE'
	WHEN T2."Country" = 'DE'
	THEN 'DACHL'
	WHEN T2."Country" = 'AT'
	THEN 'DACHL'
	WHEN T2."Country" = 'CH'
	THEN 'DACHL'
	WHEN T2."Country" = 'LU'
	THEN 'DACHL'
	WHEN T2."Country" = 'FR'
	THEN 'FR'
	ELSE 'INDIR'
END) AS "Region",
T0."DocNum" AS "Document Number",
T1."ItemCode" AS "Item No.",
(T1."Quantity"*T1."PriceBefDi") AS "GSV",
((T1."Quantity"*T1."PriceBefDi")-T1."LineTotal") "Discount",
(CASE
		WHEN T0."DiscPrcnt" != 0
		THEN T1."LineTotal" / (1 + (T0."DiscPrcnt"  / 100))
		ELSE T1."LineTotal"
	END) AS "NSV"


FROM OINV T0
INNER JOIN INV1 T1 ON T0."DocEntry" = T1."DocEntry"
INNER JOIN OCRD T2 ON T0."CardCode" = T2."CardCode"
LEFT OUTER JOIN OITM T3 ON T1."ItemCode" = T3."ItemCode"

WHERE
T0."DocType" = 'I' AND
LEFT(T1."ItemCode",2) NOT IN ('99')  AND
	MONTH(T0."DocDate") = MONTH(CURRENT_DATE) AND YEAR(T0."DocDate") = YEAR(CURRENT_DATE)

UNION

/*
AR Credit Note
*/
SELECT
(CASE
	WHEN T0."CardCode" = '105585' 
	THEN 'BENE'
	WHEN T0."CardCode" = '107957'
	THEN 'INDIR'
	WHEN T0."CardCode" = '105989'
	THEN 'FR'
	WHEN T2."Country" = 'NL'
	THEN 'BENE'
	WHEN T2."Country" = 'BE'
	THEN 'BENE'
	WHEN T2."Country" = 'DE'
	THEN 'DACHL'
	WHEN T2."Country" = 'AT'
	THEN 'DACHL'
	WHEN T2."Country" = 'CH'
	THEN 'DACHL'
	WHEN T2."Country" = 'LU'
	THEN 'DACHL'
	WHEN T2."Country" = 'FR'
	THEN 'FR'
	ELSE 'INDIR'
END) AS "Region",
T0."DocNum" AS "Document Number",
T1."ItemCode" AS "Item No.",
(T1."Quantity"*T1."PriceBefDi")  * -1 AS "GSV",
((T1."Quantity"*T1."PriceBefDi")-T1."LineTotal") * -1 "Discount",
T1."LineTotal"  * -1 "NSV"


FROM ORIN T0
INNER JOIN RIN1 T1 ON T0."DocEntry" = T1."DocEntry"
INNER JOIN OCRD T2 ON T0."CardCode" = T2."CardCode"
LEFT OUTER JOIN OITM T3 ON T1."ItemCode" = T3."ItemCode"

WHERE
T0."DocType" = 'I' AND
LEFT(T1."ItemCode",2) NOT IN ('99')  AND
	MONTH(T0."DocDate") = MONTH(CURRENT_DATE) AND YEAR(T0."DocDate") = YEAR(CURRENT_DATE)

UNION

/*
Sales Order
*/
SELECT
(CASE
	WHEN T0."CardCode" = '105585' 
	THEN 'BENE'
	WHEN T0."CardCode" = '107957'
	THEN 'INDIR'
	WHEN T0."CardCode" = '105989'
	THEN 'FR'
	WHEN T2."Country" = 'NL'
	THEN 'BENE'
	WHEN T2."Country" = 'BE'
	THEN 'BENE'
	WHEN T2."Country" = 'DE'
	THEN 'DACHL'
	WHEN T2."Country" = 'AT'
	THEN 'DACHL'
	WHEN T2."Country" = 'CH'
	THEN 'DACHL'
	WHEN T2."Country" = 'LU'
	THEN 'DACHL'
	WHEN T2."Country" = 'FR'
	THEN 'FR'
	ELSE 'INDIR'
END) AS "Region",
T0."DocNum" AS "Document Number",
T1."ItemCode" AS "Item No.",
(T1."Quantity"*T1."PriceBefDi") AS "GSV",
((T1."Quantity"*T1."PriceBefDi")-T1."LineTotal") "Discount",
T1."LineTotal" AS "NSV"


FROM ORDR T0
INNER JOIN RDR1 T1 ON T0."DocEntry" = T1."DocEntry"
INNER JOIN OCRD T2 ON T0."CardCode" = T2."CardCode"
LEFT OUTER JOIN OITM T3 ON T1."ItemCode" = T3."ItemCode"

WHERE
T1."LineStatus" = 'O' AND
T0."DocType" = 'I' AND
LEFT(T1."ItemCode",2) NOT IN ('99')  AND
MONTH(T0."DocDueDate") = MONTH(CURRENT_DATE) AND YEAR(T0."DocDueDate") = YEAR(CURRENT_DATE)

)


GROUP BY
	"Region"