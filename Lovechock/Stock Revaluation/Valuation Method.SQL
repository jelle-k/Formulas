SELECT 
  T0."ItemCode", 
  T0."ItemName", 
  T0."EvalSystem", 
  T0."AvgPrice" 

FROM 
  OITM T0 

WHERE 
  T0."validFor" = 'Y'

ORDER BY
  T0."ItemCode"