/*
	**Blanket Agreement**
	OOAT = T0 - Blanket Agreement Header 
	OAT1 = T1 - Blanket Agreement Rows
	OAT2 = T2 - Blanket Agreement Details
	OAT3 = T3 - Blanket Agreement Activity
	OAT4 = T4 - Blanket Activity Transactions 
	
	OCRD = T5 - Business Partner Master Data
	
	OPOR = T8 - Purchase Order Header
	POR1 = T7 - Purchase Order Rows
	
	OPDN = T9 - Goods Receipt PO HEADER
	PDN1 = T10 - Goods Receipt PO Rows
	
	OHEM = T11 - User Info
	
*/


SELECT
T0."Number" "Blanket Agreement Nr.",
T0."StartDate",
T0."EndDate",
T0."Descript" "Blanket Agreement Description",
T0."Owner",
T0."BpCode" "Card Code",

T1."ItemCode" "Item Code",
T1."ItemName" "Item Name",
T1."PlanQty" "Planned Qty",
T1."CumQty" "Cumulative Qty",
(T1."PlanQty" - T1."CumQty") "Open Quantity",
T1."UnitPrice",
(T1."PlanQty" * T1."UnitPrice") "Open Value",
(T1."CumQty" * T1."UnitPrice") "Cumulative Value",
T1."Currency" "Currency",
T1."InvntryUom" "UoM",

T7."ItemCode" "PO Item Number",
T7."Dscription" "PO Item Description",
T7."Quantity" "PO Quantity",
T7."Price" "PO Price",
T7."Currency" "Currenct PO",
T7."UomCode" "UoM PO",

TO_NUMBER(T8."DocNum") "Purchase Order Nr.",
T8."DocDueDate",
T8."DocTotalFC",
T5."CardName",
 
T11."firstName" 

FROM
OOAT T0 
INNER JOIN OAT1 T1 ON T0."AbsID" = T1."AgrNo"
INNER JOIN OCRD T5 ON T0."BpCode" = T5."CardCode"
INNER JOIN POR1 T7 ON T1."AgrNo" = T7."AgrNo"	
INNER JOIN OPOR T8 ON T7."DocEntry" = T8."DocEntry"
INNER JOIN OHEM T11 ON T0."Owner" = T11."empID"

WHERE
T8."DocStatus" != 'C' AND
T7."LineStatus" != 'C' AND
T1."AgrNo" = 5