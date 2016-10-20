/* Sum off all completed SFP from Goods Receipt purchase order, Converting Disassemblies to (-) and subtractinf from the total
Date SELECT is from Goods Receipt purchase order */

SELECT
	--NEW
	--T3."DocNum",
	T1."ItemCode",
	T2."ItemName",
	SUM
	(CASE
		WHEN T0."Type" = 'S'
			THEN T0."PlannedQty"
		ElSE Null
	END) "Planned Qty",
	SUM
	(CASE
		WHEN T0."Type" = 'D'
			THEN (T1."Quantity" * -1)
		WHEN T0."Type" = 'S'
			THEN T0."CmpltQty"
	END) "Completed Qty",
	SUM
	(CASE
		WHEN T0."Type" = 'D'
			THEN (T0."PlannedQty" * -1) - (T0."CmpltQty" * -1)
		WHEN T0."Type" = 'S'
			THEN T0."PlannedQty" - T0."CmpltQty"
	END) "Difference"

FROM
	IGN1 T1
	INNER JOIN OITM T2 ON T1."ItemCode" = T2."ItemCode"
	INNER JOIN OWOR T0 ON T1."BaseRef" = T0."DocNum"
	INNER JOIN OIGN T3 ON T1."DocEntry" = T3."DocEntry"

WHERE
	T3."DocDate" BETWEEN [%0] AND [%1] AND
	RIGHT(T1."ItemCode",1) <> 'R' AND
	LEFT(T1."ItemCode",2) = '44'
	-- NEW
	--T1."ItemCode" = '44001'
GROUP BY
	T1."ItemCode", T2."ItemName"