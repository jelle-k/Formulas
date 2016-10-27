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
	(Case
		WHEN SUBSTRING(T1."ItemCode",2,1) = '1' and Right(T1."ItemCode",1) = '1'
		THEN 'AF'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '1' and Right(T1."ItemCode",1) = '2'
		THEN 'GO'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '1' and Right(T1."ItemCode",1) = '3'
		THEN 'PN'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '1' and Right(T1."ItemCode",1) = '4'
		THEN 'PI'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '1' and Right(T1."ItemCode",1) = '5'
		THEN 'MV'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '1' and Right(T1."ItemCode",1) = '6'
		THEN 'CC'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '1' and Right(T1."ItemCode",1) = '7'
		THEN 'PM'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '3' and Right(T1."ItemCode",1) = '1'
		THEN 'AF'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '3' and Right(T1."ItemCode",1) = '2'
		THEN 'GO'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '3' and Right(T1."ItemCode",1) = '3'
		THEN 'PN'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '3' and Right(T1."ItemCode",1) = '4'
		THEN 'PI'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '3' and Right(T1."ItemCode",1) = '5'
		THEN 'MV'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '3' and Right(T1."ItemCode",1) = '6'
		THEN 'CC'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '3' and Right(T1."ItemCode",1) = '7'
		THEN 'PM'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '2' and Right(T1."ItemCode",2) = '01'
		THEN 'AC'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '2' and Right(T1."ItemCode",2) = '02'
		THEN 'RC'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '2' and Right(T1."ItemCode",2) = '03'
		THEN 'MH'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '2' and Right(T1."ItemCode",2) = '11'
		THEN 'AC'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '2' and Right(T1."ItemCode",2) = '12'
		THEN 'HV'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '2' and Right(T1."ItemCode",2) = '13'
		THEN 'MH'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '4' and Right(T1."ItemCode",1) = '1'
		THEN 'SS'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '4' and Right(T1."ItemCode",1) = '2'
		THEN 'BH'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '4' and Right(T1."ItemCode",1) = '3'
		THEN 'AB'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '4' and Right(T1."ItemCode",1) = '4'
		THEN 'po'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '5' and Right(T1."ItemCode",1) = '1'
		THEN 'CB'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '5' and Right(T1."ItemCode",1) = '2'
		THEN 'MA'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '10'
		THEN 'AF'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '11'
		THEN 'GO'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '12'
		THEN 'PN'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '13'
		THEN 'PI'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '14'
		THEN 'MV'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '15'
		THEN 'CC'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '16'
		THEN 'AF'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '17'
		THEN 'GO'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '18'
		THEN 'PN'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '19'
		THEN 'PI'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '20'
		THEN 'MV'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '21'
		THEN 'CC'
		ELSE NULL
  END) AS "Flavour",
	T0."CardCode",
	T2."CardName" AS "Customer Name",
	(CASE
		WHEN T0."CardCode" = '105585' 
		THEN 'NL'
		WHEN T0."CardCode" = '107957'
		THEN 'JP'
		WHEN T0."CardCode" = '105989'
		THEN 'FR'
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
		WHEN LEFT(T1."ItemCode",2) = 18
		THEN (21 * T1."Quantity")
 	END) AS "Q Piece"

FROM OINV T0
	INNER JOIN INV1 T1 ON T0."DocEntry" = T1."DocEntry"
	INNER JOIN OCRD T2 ON T0."CardCode" = T2."CardCode"
	LEFT OUTER JOIN OITM T3 ON T1."ItemCode" = T3."ItemCode"

WHERE
	T0."DocType" = 'I' AND
	LEFT(T1."ItemCode",2) NOT IN ('99') AND
	T0."DocDate" BETWEEN [%0] AND [%1] 
/*AND YEAR(T0."DocDate") = 2016 AND
	MONTH(T0."DocDate") = 08 
*/

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
	(Case
		WHEN SUBSTRING(T1."ItemCode",2,1) = '1' and Right(T1."ItemCode",1) = '1'
		THEN 'AF'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '1' and Right(T1."ItemCode",1) = '2'
		THEN 'GO'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '1' and Right(T1."ItemCode",1) = '3'
		THEN 'PN'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '1' and Right(T1."ItemCode",1) = '4'
		THEN 'PI'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '1' and Right(T1."ItemCode",1) = '5'
		THEN 'MV'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '1' and Right(T1."ItemCode",1) = '6'
		THEN 'CC'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '1' and Right(T1."ItemCode",1) = '7'
		THEN 'PM'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '3' and Right(T1."ItemCode",1) = '1'
		THEN 'AF'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '3' and Right(T1."ItemCode",1) = '2'
		THEN 'GO'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '3' and Right(T1."ItemCode",1) = '3'
		THEN 'PN'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '3' and Right(T1."ItemCode",1) = '4'
		THEN 'PI'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '3' and Right(T1."ItemCode",1) = '5'
		THEN 'MV'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '3' and Right(T1."ItemCode",1) = '6'
		THEN 'CC'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '3' and Right(T1."ItemCode",1) = '7'
		THEN 'PM'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '2' and Right(T1."ItemCode",2) = '01'
		THEN 'AC'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '2' and Right(T1."ItemCode",2) = '02'
		THEN 'RC'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '2' and Right(T1."ItemCode",2) = '03'
		THEN 'MH'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '2' and Right(T1."ItemCode",2) = '11'
		THEN 'AC'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '2' and Right(T1."ItemCode",2) = '12'
		THEN 'HV'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '2' and Right(T1."ItemCode",2) = '13'
		THEN 'MH'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '4' and Right(T1."ItemCode",1) = '1'
		THEN 'SS'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '4' and Right(T1."ItemCode",1) = '2'
		THEN 'BH'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '4' and Right(T1."ItemCode",1) = '3'
		THEN 'AB'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '4' and Right(T1."ItemCode",1) = '4'
		THEN 'po'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '5' and Right(T1."ItemCode",1) = '1'
		THEN 'CB'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '5' and Right(T1."ItemCode",1) = '2'
		THEN 'MA'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '10'
		THEN 'AF'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '11'
		THEN 'GO'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '12'
		THEN 'PN'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '13'
		THEN 'PI'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '14'
		THEN 'MV'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '15'
		THEN 'CC'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '16'
		THEN 'AF'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '17'
		THEN 'GO'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '18'
		THEN 'PN'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '19'
		THEN 'PI'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '20'
		THEN 'MV'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '21'
		THEN 'CC'
		ELSE NULL
  END) AS "Flavour",
	T0."CardCode",
	T2."CardName" AS "Customer Name",
	(CASE
		WHEN T0."CardCode" = '105585' 
		THEN 'NL'
		WHEN T0."CardCode" = '107957'
		THEN 'JP'
		WHEN T0."CardCode" = '105989'
		THEN 'FR'
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
	((T1."Quantity"*T1."PriceBefDi")-T1."LineTotal") * -1 "Discount",
	T1."LineTotal"  * -1 "NSV",
	(CASE
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
		WHEN LEFT(T1."ItemCode",2) = 18
		THEN (21 * T1."Quantity") * -1
  END) AS "Q Piece"

FROM ORIN T0
	INNER JOIN RIN1 T1 ON T0."DocEntry" = T1."DocEntry"
	INNER JOIN OCRD T2 ON T0."CardCode" = T2."CardCode"
	LEFT OUTER JOIN OITM T3 ON T1."ItemCode" = T3."ItemCode"

WHERE
	T0."DocType" = 'I' AND
	LEFT(T1."ItemCode",2) NOT IN ('99') AND
	T0."DocDate" BETWEEN [%0] AND [%1]

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
	(Case
		WHEN SUBSTRING(T1."ItemCode",2,1) = '1' and Right(T1."ItemCode",1) = '1'
		THEN 'AF'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '1' and Right(T1."ItemCode",1) = '2'
		THEN 'GO'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '1' and Right(T1."ItemCode",1) = '3'
		THEN 'PN'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '1' and Right(T1."ItemCode",1) = '4'
		THEN 'PI'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '1' and Right(T1."ItemCode",1) = '5'
		THEN 'MV'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '1' and Right(T1."ItemCode",1) = '6'
		THEN 'CC'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '1' and Right(T1."ItemCode",1) = '7'
		THEN 'PM'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '3' and Right(T1."ItemCode",1) = '1'
		THEN 'AF'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '3' and Right(T1."ItemCode",1) = '2'
		THEN 'GO'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '3' and Right(T1."ItemCode",1) = '3'
		THEN 'PN'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '3' and Right(T1."ItemCode",1) = '4'
		THEN 'PI'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '3' and Right(T1."ItemCode",1) = '5'
		THEN 'MV'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '3' and Right(T1."ItemCode",1) = '6'
		THEN 'CC'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '3' and Right(T1."ItemCode",1) = '7'
		THEN 'PM'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '2' and Right(T1."ItemCode",2) = '01'
		THEN 'AC'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '2' and Right(T1."ItemCode",2) = '02'
		THEN 'RC'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '2' and Right(T1."ItemCode",2) = '03'
		THEN 'MH'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '2' and Right(T1."ItemCode",2) = '11'
		THEN 'AC'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '2' and Right(T1."ItemCode",2) = '12'
		THEN 'HV'	
		WHEN SUBSTRING(T1."ItemCode",2,1) = '2' and Right(T1."ItemCode",2) = '13'
		THEN 'MH'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '4' and Right(T1."ItemCode",1) = '1'
		THEN 'SS'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '4' and Right(T1."ItemCode",1) = '2'
		THEN 'BH'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '4' and Right(T1."ItemCode",1) = '3'
		THEN 'AB'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '4' and Right(T1."ItemCode",1) = '4'
		THEN 'po'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '5' and Right(T1."ItemCode",1) = '1'
		THEN 'CB'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '5' and Right(T1."ItemCode",1) = '2'
		THEN 'MA'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '10'
		THEN 'AF'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '11'
		THEN 'GO'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '12'
		THEN 'PN'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '13'
		THEN 'PI'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '14'
		THEN 'MV'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '15'
		THEN 'CC'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '16'
		THEN 'AF'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '17'
		THEN 'GO'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '18'
		THEN 'PN'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '19'
		THEN 'PI'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '20'
		THEN 'MV'
		WHEN SUBSTRING(T1."ItemCode",2,1) = '8' and Right(T1."ItemCode",2) = '21'
		THEN 'CC'
		ELSE NULL
	END) AS "Flavour",
	T0."CardCode",
	T2."CardName" AS "Customer Name",
	(CASE
		WHEN T0."CardCode" = '105585' 
		THEN 'NL'
		WHEN T0."CardCode" = '107957'
		THEN 'JP'
		WHEN T0."CardCode" = '105989'
		THEN 'FR'
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
		WHEN LEFT(T1."ItemCode",2) = 18
		THEN (21 * T1."Quantity")
		END) AS "Q Piece"

FROM ORDR T0
	INNER JOIN RDR1 T1 ON T0."DocEntry" = T1."DocEntry"
	INNER JOIN OCRD T2 ON T0."CardCode" = T2."CardCode"
	LEFT OUTER JOIN OITM T3 ON T1."ItemCode" = T3."ItemCode"

WHERE
	T1."LineStatus" = 'O' AND
	T0."DocType" = 'I' AND
	LEFT(T1."ItemCode",2) NOT IN ('99') and
	T0."DocDueDate" BETWEEN [%0] AND [%1]	