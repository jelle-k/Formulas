/* Shows Completed quantity for specific item for production orders in a date range from Goods Receipt
*/
SELECT
	T3."DocNum",
	(CASE
		WHEN T0."Type" = 'D'
			THEN 'Disassembly'
		ELSE NULL
	END) "Type",
	T1."ItemCode",
	T2."ItemName",
	(CASE
		WHEN T0."Type" = 'S'
			THEN T0."PlannedQty"
		ElSE Null
	END) "Planned Qty",
	(CASE
		WHEN T0."Type" = 'D'
			THEN (T1."Quantity" * -1)
		WHEN T0."Type" = 'S'
			THEN T0."CmpltQty"
	END) "Completed Qty",
	(CASE
		WHEN T0."Type" = 'D'
			THEN (T0."PlannedQty" * -1) - (T0."CmpltQty" * -1)
		WHEN T0."Type" = 'S'
			THEN T0."PlannedQty" - T0."CmpltQty"
	END) "Difference",
	T3."DocDate" "Posting Date"

FROM
	IGN1 T1
	INNER JOIN OITM T2 ON T1."ItemCode" = T2."ItemCode"
	INNER JOIN OWOR T0 ON T1."BaseRef" = T0."DocNum"
	INNER JOIN OIGN T3 ON T1."DocEntry" = T3."DocEntry"

WHERE
	T3."DocDate" BETWEEN [%0] AND [%1] AND
	RIGHT(T1."ItemCode",1) <> 'R' 