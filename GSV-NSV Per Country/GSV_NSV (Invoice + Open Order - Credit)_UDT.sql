/*
AR Invoice
*/
SELECT
(CASE
	WHEN T0."CardCode" = '105585' 
	THEN 'BENE'
	WHEN T0."CardCode" = '107957'
	THEN 'INDIR'
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
YEAR(T0."DocDate") AS "Year",
MONTH(T0."DocDate") AS "Month",
T2."CardName" AS "Customer Name",
(CASE 
	WHEN T3."ItmsGrpCod" = 113
	THEN 'Tablets'
	WHEN T3."ItmsGrpCod" = 104
	THEN 'Bars'
	WHEN T3."ItmsGrpCod" = 114
	THEN 'Tablets'
	WHEN T3."ItmsGrpCod" = 111
	THEN 'Rocks'

END) AS "GroupCode",
T0."CardCode",
T2."CardName" AS "Customer Name",
(CASE
	WHEN T0."CardCode" = '105585' 
	THEN 'NL'
	WHEN T0."CardCode" = '107957'
	THEN 'JP'
	ELSE T2."Country"
END) "Country",
T0."DocNum" AS "Document Number",
T0."DocDate" AS "Posting/Delivery Date",
T1."ItemCode" AS "Item No.",
T1."Quantity" AS "Q Pck",
(Case
	WHEN LEFT(T1."ItemCode",2) = 11
	THEN 21
	WHEN LEFT(T1."ItemCode",2) = 12
	THEN 8
	WHEN LEFT(T1."ItemCode",2) = 13
	THEN 12
	WHEN LEFT(T1."ItemCode",2) = 14
	THEN 8
	WHEN LEFT(T1."ItemCode",2) = 15
	THEN 8	
END) AS "PC/Pck",
(T1."Quantity"*T1."PriceBefDi") AS "GSV",
((T1."Quantity"*T1."PriceBefDi")-T1."LineTotal") "Discount",
T1."LineTotal" AS "NSV",
(Case
	WHEN LEFT(T1."ItemCode",2) = 11
	THEN (21 * T1."Quantity")
	WHEN LEFT(T1."ItemCode",2) = 12
	THEN (8 * T1."Quantity")
	WHEN LEFT(T1."ItemCode",2) = 13
	THEN (12 * T1."Quantity")
	WHEN LEFT(T1."ItemCode",2) = 14
	THEN (8 * T1."Quantity")
	WHEN LEFT(T1."ItemCode",2) = 15
	THEN (8	* T1."Quantity")
END) AS "Q Piece",
T4."U_Value"

FROM OINV T0
INNER JOIN INV1 T1 ON T0."DocEntry" = T1."DocEntry"
INNER JOIN OCRD T2 ON T0."CardCode" = T2."CardCode"
LEFT OUTER JOIN OITM T3 ON T1."ItemCode" = T3."ItemCode"
LEFT OUTER JOIN "@GSVNSV" T4 ON (
YEAR(T0."DocDate") = YEAR(T4."Code") AND 
MONTH(T0."DocDate") = MONTH(T4."Code"))

WHERE
T0."DocType" = 'I' AND
LEFT(T1."ItemCode",2) NOT IN ('99') 

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
YEAR(T0."DocDate") AS "Year",
MONTH(T0."DocDate") AS "Month",
T2."CardName" AS "Customer Name",
(CASE 
	WHEN T3."ItmsGrpCod" = 113
	THEN 'Tablets'
	WHEN T3."ItmsGrpCod" = 104
	THEN 'Bars'
	WHEN T3."ItmsGrpCod" = 114
	THEN 'Tablets'
	WHEN T3."ItmsGrpCod" = 111
	THEN 'Rocks'

END) AS "GroupCode",
T0."CardCode",
T2."CardName" AS "Customer Name",
(CASE
	WHEN T0."CardCode" = '105585' 
	THEN 'NL'
	WHEN T0."CardCode" = '107957'
	THEN 'JP'
	ELSE T2."Country"
END) "Country",
T0."DocNum" AS "Document Number",
T0."DocDate" AS "Posting/Delivery Date",
T1."ItemCode" AS "Item No.",
T1."Quantity" AS "Q Pck",
(Case
	WHEN LEFT(T1."ItemCode",2) = 11
	THEN 21
	WHEN LEFT(T1."ItemCode",2) = 12
	THEN 8
	WHEN LEFT(T1."ItemCode",2) = 13
	THEN 12
	WHEN LEFT(T1."ItemCode",2) = 14
	THEN 8
	WHEN LEFT(T1."ItemCode",2) = 15
	THEN 8	
END) AS "PC/Pck",
(T1."Quantity"*T1."PriceBefDi")  * -1 AS "GSV",
((T1."Quantity"*T1."PriceBefDi")-T1."LineTotal") "Discount",
T1."LineTotal"  * -1 "NSV",
(Case
	WHEN LEFT(T1."ItemCode",2) = 11
	THEN (21 * T1."Quantity") * -1
	WHEN LEFT(T1."ItemCode",2) = 12
	THEN (8 * T1."Quantity") * -1
	WHEN LEFT(T1."ItemCode",2) = 13
	THEN (12 * T1."Quantity") * -1
	WHEN LEFT(T1."ItemCode",2) = 14
	THEN (8 * T1."Quantity") * -1
	WHEN LEFT(T1."ItemCode",2) = 15
	THEN (8	* T1."Quantity") * -1
END) AS "Q Piece",
T4."U_Value"

FROM ORIN T0
INNER JOIN RIN1 T1 ON T0."DocEntry" = T1."DocEntry"
INNER JOIN OCRD T2 ON T0."CardCode" = T2."CardCode"
LEFT OUTER JOIN OITM T3 ON T1."ItemCode" = T3."ItemCode"
LEFT OUTER JOIN "@GSVNSV" T4 ON (
YEAR(T0."DocDate") = YEAR(T4."Code") AND 
MONTH(T0."DocDate") = MONTH(T4."Code"))

WHERE
T0."DocType" = 'I' AND
LEFT(T1."ItemCode",2) NOT IN ('99') 

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
YEAR(T0."DocDueDate") AS "Year",
MONTH(T0."DocDueDate") AS "Month",
T2."CardName" AS "Customer Name",
(CASE 
	WHEN T3."ItmsGrpCod" = 113
	THEN 'Tablets'
	WHEN T3."ItmsGrpCod" = 104
	THEN 'Bars'
	WHEN T3."ItmsGrpCod" = 114
	THEN 'Tablets'
	WHEN T3."ItmsGrpCod" = 111
	THEN 'Rocks'

END) AS "GroupCode",
T0."CardCode",
T2."CardName" AS "Customer Name",
(CASE
	WHEN T0."CardCode" = '105585' 
	THEN 'NL'
	WHEN T0."CardCode" = '107957'
	THEN 'JP'
	ELSE T2."Country"
END) "Country",
T0."DocNum" AS "Document Number",
T0."DocDueDate" AS "Posting/Delivery Date",
T1."ItemCode" AS "Item No.",
T1."Quantity" AS "Q Pck",
(Case
	WHEN LEFT(T1."ItemCode",2) = 11
	THEN 21
	WHEN LEFT(T1."ItemCode",2) = 12
	THEN 8
	WHEN LEFT(T1."ItemCode",2) = 13
	THEN 12
	WHEN LEFT(T1."ItemCode",2) = 14
	THEN 8
	WHEN LEFT(T1."ItemCode",2) = 15
	THEN 8	
END) AS "PC/Pck",
(T1."Quantity"*T1."PriceBefDi") AS "GSV",
((T1."Quantity"*T1."PriceBefDi")-T1."LineTotal") "Discount",
T1."LineTotal" AS "NSV",
(Case
	WHEN LEFT(T1."ItemCode",2) = 11
	THEN (21 * T1."Quantity")
	WHEN LEFT(T1."ItemCode",2) = 12
	THEN (8 * T1."Quantity")
	WHEN LEFT(T1."ItemCode",2) = 13
	THEN (12 * T1."Quantity")
	WHEN LEFT(T1."ItemCode",2) = 14
	THEN (8 * T1."Quantity")
	WHEN LEFT(T1."ItemCode",2) = 15
	THEN (8	* T1."Quantity")
END) AS "Q Piece",
T4."U_Value"

FROM ORDR T0
INNER JOIN RDR1 T1 ON T0."DocEntry" = T1."DocEntry"
INNER JOIN OCRD T2 ON T0."CardCode" = T2."CardCode"
LEFT OUTER JOIN OITM T3 ON T1."ItemCode" = T3."ItemCode"
LEFT OUTER JOIN "@GSVNSV" T4 ON (
YEAR(T0."DocDueDate") = YEAR(T4."Code") AND 
MONTH(T0."DocDueDate") = MONTH(T4."Code"))

WHERE
T0."DocStatus" = 'O' AND
T0."DocType" = 'I' AND
LEFT(T1."ItemCode",2) NOT IN ('99')