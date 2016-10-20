SELECT 
"FCT1"."ItemCode",
(
CASE 
	WHEN "FCT1"."ItemCode" = '11001' THEN
		 '13001'
	WHEN "FCT1"."ItemCode" = '11101' THEN
		 '13101'
	WHEN "FCT1"."ItemCode" = '11201' THEN
		 '13201'
	WHEN "FCT1"."ItemCode" = '11301' THEN
		 '13301'
	WHEN "FCT1"."ItemCode" = '11401' THEN
		 '13401'
	WHEN "FCT1"."ItemCode" = '11501' THEN
		 '13501'
	WHEN "FCT1"."ItemCode" = '11601' THEN
		 '13601'
	WHEN "FCT1"."ItemCode" = '11002' THEN
		 '13002'
	WHEN "FCT1"."ItemCode" = '11102' THEN
		 '13102'
	WHEN "FCT1"."ItemCode" = '11202' THEN
		 '13202'
	WHEN "FCT1"."ItemCode" = '11302' THEN
		 '13302'
	WHEN "FCT1"."ItemCode" = '11402' THEN
		 '13402'
	WHEN "FCT1"."ItemCode" = '11502' THEN
		 '13502'
	WHEN "FCT1"."ItemCode" = '11602' THEN
		 '13602'
	WHEN "FCT1"."ItemCode" = '11003' THEN
		 '13003'
	WHEN "FCT1"."ItemCode" = '11103' THEN
		 '13103'
	WHEN "FCT1"."ItemCode" = '11203' THEN
		 '13203'
	WHEN "FCT1"."ItemCode" = '11303' THEN
		 '13303'
	WHEN "FCT1"."ItemCode" = '11403' THEN
		 '13403'
	WHEN "FCT1"."ItemCode" = '11503' THEN
		 '13503'
	WHEN "FCT1"."ItemCode" = '11603' THEN
		 '13603'
	WHEN "FCT1"."ItemCode" = '11004' THEN
		 '13004'
	WHEN "FCT1"."ItemCode" = '11104' THEN
		 '13104'
	WHEN "FCT1"."ItemCode" = '11204' THEN
		 '13204'
	WHEN "FCT1"."ItemCode" = '11304' THEN
		 '13304'
	WHEN "FCT1"."ItemCode" = '11404' THEN
		 '13404'
	WHEN "FCT1"."ItemCode" = '11504' THEN
		 '13504'
	WHEN "FCT1"."ItemCode" = '11604' THEN
		 '13604'
	WHEN "FCT1"."ItemCode" = '11005' THEN
		 '13005'
	WHEN "FCT1"."ItemCode" = '11105' THEN
		 '13105'
	WHEN "FCT1"."ItemCode" = '11205' THEN
		 '13205'
	WHEN "FCT1"."ItemCode" = '11305' THEN
		 '13305'
	WHEN "FCT1"."ItemCode" = '11405' THEN
		 '13405'
	WHEN "FCT1"."ItemCode" = '11505' THEN
		 '13505'
	WHEN "FCT1"."ItemCode" = '11605' THEN
		 '13605'
	WHEN "FCT1"."ItemCode" = '11006' THEN
		 '13006'
	WHEN "FCT1"."ItemCode" = '11106' THEN
		 '13106'
	WHEN "FCT1"."ItemCode" = '11206' THEN
		 '13206'
	WHEN "FCT1"."ItemCode" = '11306' THEN
		 '13306'
	WHEN "FCT1"."ItemCode" = '11406' THEN
		 '13406'
	WHEN "FCT1"."ItemCode" = '11506' THEN
		 '13506'
	WHEN "FCT1"."ItemCode" = '11606' THEN
		 '13606'
	WHEN "FCT1"."ItemCode" = '11007' THEN
		 '13007'
	WHEN "FCT1"."ItemCode" = '11107' THEN
		 '13107'
	WHEN "FCT1"."ItemCode" = '11207' THEN
		 '13207'
	WHEN "FCT1"."ItemCode" = '11307' THEN
		 '13307'
	WHEN "FCT1"."ItemCode" = '11407' THEN
		 '13407'
	WHEN "FCT1"."ItemCode" = '11507' THEN
		 '13507'
	WHEN "FCT1"."ItemCode" = '11607' THEN
		 '13607'
	ELSE "FCT1"."ItemCode"
END
) AS '"FCT1"."ItemCode"',
(
CASE 
	WHEN SUBSTR("FCT1"."ItemCode",2,1) = 1
		THEN ("FCT1"."Quantity"*21) / 12
	ELSE "FCT1"."Quantity"
END
) AS "QuantityC",
"FCT1"."Quantity", 
"OFCT"."Code", 
"FCT1"."Date"
 
FROM   
"SBO_LOVECHOCK_LIVE"."OFCT" "OFCT" 
INNER JOIN "SBO_LOVECHOCK_LIVE"."FCT1" "FCT1" ON "OFCT"."AbsID"="FCT1"."AbsID"

WHERE 
(SUBSTR("OFCT"."Code",8,6) = 'pro.15' or SUBSTR("OFCT"."Code",8,6) = 'reg.15') 