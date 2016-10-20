SELECT 
"OFCT"."AbsID", 
"OFCT"."Code",  
"OCRD"."CardName", 
"OCRD"."CardCode", 
"OCRD"."CardType", 
"OCRD"."U_forecast_resp", 
"FCT1"."Date", 
"FCT1"."ItemCode", 
"FCT1"."Quantity", 
"OITM"."ItemName", 
CONCAT("OCRD"."CardCode","FCT1"."ItemCode" ) AS "key",

(
SELECT 
SUM("INV1"."Quantity")  
FROM 
SBO_LOVECHOCK_LIVE.INV1 "INV1", 
SBO_LOVECHOCK_LIVE.OINV "OINV" 
WHERE "OINV"."DocEntry" = "INV1"."DocEntry" 
AND "OINV"."CardCode" = "OCRD"."CardCode" 
AND "OINV"."TaxDate" >=  "FCT1"."Date"  
AND "OINV"."TaxDate" <= add_years(add_days("FCT1"."Date",6),1) 
AND "INV1"."ItemCode" =  "FCT1"."ItemCode" 
) 
AS "Invoiced",

(
SELECT 
SUM("RIN1"."Quantity")  
FROM 
SBO_LOVECHOCK_LIVE.RIN1 "RIN1", 
SBO_LOVECHOCK_LIVE.ORIN "ORIN" 
WHERE "ORIN"."DocEntry" = "RIN1"."DocEntry" 
AND "ORIN"."CardCode" = "OCRD"."CardCode" 
AND "ORIN"."TaxDate" >=  "FCT1"."Date"  
AND "ORIN"."TaxDate" <= Add_years(add_days("FCT1"."Date",6),1) 
AND "RIN1"."ItemCode" =  "FCT1"."ItemCode" 
) 
AS "Credited",

(
SELECT 
SUM("RIN1"."Quantity")  
FROM 
SBO_LOVECHOCK_LIVE.RIN1 "RIN1", 
SBO_LOVECHOCK_LIVE.ORIN "ORIN" 
WHERE "ORIN"."DocEntry" = "RIN1"."DocEntry" 
AND "ORIN"."CardCode" = "OCRD"."CardCode" 
AND "ORIN"."TaxDate" >=  "FCT1"."Date"
AND "ORIN"."TaxDate" <= add_days("FCT1"."Date",6)
AND "RIN1"."ItemCode" =  "FCT1"."ItemCode" 
) 
AS "Creditedly",

(
SELECT 
SUM("INV1"."Quantity")  
FROM 
SBO_LOVECHOCK_LIVE.INV1 "INV1", 
SBO_LOVECHOCK_LIVE.OINV "OINV" 
WHERE "OINV"."DocEntry" = "INV1"."DocEntry" 
AND "OINV"."CardCode" = "OCRD"."CardCode" 
AND "OINV"."TaxDate" >=  "FCT1"."Date"  
AND "OINV"."TaxDate" <= add_days("FCT1"."Date",6)
AND "INV1"."ItemCode" =  "FCT1"."ItemCode" 
) 
AS "Invoicedly",

(
SELECT 
SUM("RDR1"."Quantity") 
FROM 
SBO_LOVECHOCK_LIVE.RDR1 "RDR1" 
INNER JOIN SBO_LOVECHOCK_LIVE.ORDR "ORDR" ON "RDR1"."DocEntry"="ORDR"."DocEntry" 
WHERE 
"ORDR"."CardCode" = "OCRD"."CardCode" 
AND "RDR1"."ItemCode" = "FCT1"."ItemCode" 
AND "ORDR"."DocStatus"='O'  
AND "ORDR"."DocDueDate" >=  add_years("FCT1"."Date",1)  
AND "ORDR"."DocDueDate" <= Add_years(add_days("FCT1"."Date",6),1)
) 
AS "Openord"

FROM	
SBO_LOVECHOCK_LIVE.OFCT "OFCT",  
SBO_LOVECHOCK_LIVE.OCRD "OCRD", 
SBO_LOVECHOCK_LIVE.FCT1 "FCT1",
SBO_LOVECHOCK_LIVE.OITM "OITM" 

WHERE
"OCRD"."CardCode" = Left ("OFCT"."Code",6) 
AND 
"FCT1"."AbsID" = "OFCT"."AbsID" 
AND
"OITM"."ItemCode" =  "FCT1"."ItemCode" 
AND
"OITM"."ItemCode" Not in ('11001','11002','11003','11004','11005','11006','11007'
,'11101','11102','11103','11104','11105','11106','11107'
,'11201','11202','11203','11204','11205','11206','11207'
,'11301','11302','11303','11304','11305','11306','11307'
,'11401','11402','11403','11404','11405','11406','11407'
,'11501','11502','11503','11504','11505','11506','11507'
,'11601','11602','11603','11604','11605','11606','11607'
,'12001','12002','12003','12004','12005'
,'12101','12102','12103','12104','12105'
,'12201','12202','12203','12204','12205'
,'12301','12302','12303','12304','12305'
,'12401','12402','12403','12404','12405') 
AND
"OCRD"."CardType" = 'C' 
AND
"OCRD"."U_forecast_resp" = {?forecastman}