/*
AR Invoice
*/
SELECT
(CASE
	WHEN T2."Country" = 'NL'
	THEN 'NLBE'
	WHEN T2."Country" = 'BE'
	THEN 'NLBE'
	WHEN T2."Country" = 'DE'
	THEN 'DACHL'
	WHEN T2."Country" = 'AT'
	THEN 'DACHL'
	WHEN T2."Country" = 'CH'
	THEN 'DACHL'
	WHEN T2."Country" = 'LU'
	THEN 'DACHL'
	ELSE T2."Country"
END) AS "Region",
YEAR(T0."DocDate") AS "Year",
MONTH(T0."DocDate") AS "Month",
T2."CardName" AS "Customer Name",
(CASE 
	WHEN T3."ItmsGrpCod" = 113
	THEN 'Tablet'
	WHEN T3."ItmsGrpCod" = 104
	THEN 'Bar'
	WHEN T3."ItmsGrpCod" = 114
	THEN 'Mylk'
	WHEN T3."ItmsGrpCod" = 111
	THEN 'Rocks'

END) AS "GroupCode",
T0."CardCode",
T2."CardName" AS "Customer Name",
T2."Country",
T0."DocNum" AS "Document Number",
T0."DocDate" AS "Posting Date",
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
(T1."Quantity" * T1."PriceAfVAT") AS "GSV",
(CASE
	WHEN T1."Price" <> T1."PriceBefDi"
	THEN (T1."Price" * T1."Quantity")
	ELSE 0
END) AS "Promo",
(T1."Quantity" * T1."PriceBefDi") AS "NSV",
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
END) AS "Q Piece"


FROM OINV T0
INNER JOIN INV1 T1 ON T0."DocEntry" = T1."DocEntry"
INNER JOIN OCRD T2 ON T0."CardCode" = T2."CardCode"
LEFT OUTER JOIN OITM T3 ON T1."ItemCode" = T3."ItemCode"

WHERE
--T0."DocType" = 'S' AND
--LEFT(T1."ItemCode",2) NOT IN ('99') AND
--T0."CardCode" IN ('108196','100060','100270', '107766') AND
MONTH(T0."DocDate") = 6 AND YEAR(T0."DocDate") = YEAR(CURRENT_DATE)

UNION
/*
AR Credit Note
*/
SELECT
(CASE
	WHEN T2."Country" = 'NL'
	THEN 'NLBE'
	WHEN T2."Country" = 'BE'
	THEN 'NLBE'
	WHEN T2."Country" = 'DE'
	THEN 'DACHL'
	WHEN T2."Country" = 'AT'
	THEN 'DACHL'
	WHEN T2."Country" = 'CH'
	THEN 'DACHL'
	WHEN T2."Country" = 'LU'
	THEN 'DACHL'
	ELSE T2."Country"
END) AS "Region",
YEAR(T0."DocDate") AS "Year",
MONTH(T0."DocDate") AS "Month",
T2."CardName" AS "Customer Name",
(CASE 
	WHEN T3."ItmsGrpCod" = 113
	THEN 'Tablet'
	WHEN T3."ItmsGrpCod" = 104
	THEN 'Bar'
	WHEN T3."ItmsGrpCod" = 114
	THEN 'Mylk'
	WHEN T3."ItmsGrpCod" = 111
	THEN 'Rocks'

END) AS "GroupCode",
T0."CardCode",
T2."CardName" AS "Customer Name",
T2."Country",
T0."DocNum" AS "Document Number",
T0."DocDate" AS "Posting Date",
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
(T1."Quantity" * T1."PriceAfVAT") AS "GSV",
(CASE
	WHEN T1."Price" <> T1."PriceBefDi"
	THEN (T1."Price" * T1."Quantity")
	ELSE 0
END) AS "Promo",
(T1."Quantity" * T1."PriceBefDi") AS "NSV",
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
END) AS "Q Piece"


FROM ORIN T0
INNER JOIN RIN1 T1 ON T0."DocEntry" = T1."DocEntry"
INNER JOIN OCRD T2 ON T0."CardCode" = T2."CardCode"
LEFT OUTER JOIN OITM T3 ON T1."ItemCode" = T3."ItemCode"

WHERE
--T0."DocType" = 'S' AND
--LEFT(T1."ItemCode",2) NOT IN ('99') AND
--T0."CardCode" IN ('108196','100060','100270', '107766') AND
MONTH(T0."DocDate") = 6 AND YEAR(T0."DocDate") = YEAR(CURRENT_DATE)

