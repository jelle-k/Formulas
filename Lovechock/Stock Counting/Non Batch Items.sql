SELECT T1."ItemCode", T1."WhsCode", T1."OnHand" 

FROM OITM T0  
INNER JOIN OITW T1 ON T0."ItemCode" = T1."ItemCode" 

WHERE T1."OnHand" != 0 AND T1."WhsCode" NOT LIKE 'Z' and T1."WhsCode" NOT LIKE  'Reenen' and T1."WhsCode" NOT LIKE  'Naturata'

ORDER BY T1."ItemCode" ASC