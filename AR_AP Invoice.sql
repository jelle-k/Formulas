/**
AR Invoice update
**/

SELECT
T0."DocEntry",
T0."DocDate" AS "Posting Date",
T0."DocDueDate" AS "Due Date",
T1."CreateDate" AS "Creation Date",
T0."DocNum" AS "Document Number",
CASE LEFT(T0."DocNum",1) WHEN 2 THEN 'AR Invoice' END AS "Document Type",
T0."DocTotal" AS "Document Total"

FROM
OINV T0
INNER JOIN ADOC T1 ON T0."DocNum" = T1."DocNum"

WHERE
T0."DocDate" >= [%1] AND 
T0."DocDate" <= [%2]


UNION

/**
AP Invoice
**/

SELECT
T0."DocEntry",
T0."DocDate" AS "Posting Date",
T0."DocDueDate" AS "Due Date",
T1."CreateDate" AS "Creation Date",
T0."DocNum" AS "Document Number",
CASE LEFT(T0."DocNum",1) WHEN 6 THEN 'AP Invoice' END AS "Document Type",
(T0."DocTotal" * -1) AS "Document Total"

FROM
OPCH T0
INNER JOIN ADOC T1 ON T0."DocNum" = T1."DocNum"

WHERE
T0."DocDate" >= [%1] AND 
T0."DocDate" <= [%2]
