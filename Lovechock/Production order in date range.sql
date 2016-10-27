/*
Production overview
*/

SELECT
T0."DocNum" "Production order nr.", 
T0."ItemCode",
(CASE
	WHEN T0."Type" = 'D'
		THEN (T0."PlannedQty" * -1)
	WHEN T0."Type" = 'S'
		THEN T0."PlannedQty"
END) "Planned Qty",
(CASE
	WHEN T0."Type" = 'D'
		THEN (T0."CmpltQty" * -1)
	WHEN T0."Type" = 'S'
		THEN T0."CmpltQty"
END) "Completed Qty",
(CASE
	WHEN T0."Type" = 'D'
		THEN (T0."PlannedQty" * -1) - (T0."CmpltQty" * -1)
	WHEN T0."Type" = 'S'
		THEN T0."PlannedQty" - T0."CmpltQty"
END) "Difference", 
T0."DueDate"



FROM OWOR T0
LEFT OUTER JOIN OITM T1 ON T0."ItemCode" = T1."ItemCode"

WHERE 
T0."DueDate" BETWEEN [%0] AND [%1]