SELECT 
  T3."ItemCode",
  T3."ExpDate", 
  T4."ItemName", 
  T3."BatchNum",
  T3."Status", 
  T3."Quantity",
  CASE 
    WHEN T3."BaseType" = 20 THEN T4."BuyUnitMsr"
    WHEN T3."BaseType" = 15 THEN T4."SalUnitMsr"
    ELSE T4."InvntryUom" 
  END


FROM 
  "OIBT" T3 
  INNER JOIN OITM T4 ON T4."ItemCode" = T3."ItemCode"
  
WHERE 
  T3."BatchNum" = '{?BatchCode@}' AND T3."ItemCode" = '{?ItemCode@}'