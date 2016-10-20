SELECT T2."DocNum", T0."DocNum", T0."DocDate", T0."DocType", T3."Status", T3."WtmCode" FROM "OPOR" T0 
INNER JOIN "POR1" T1 ON T0."DocEntry" = T1."DocEntry" 
INNER JOIN "ODRF" T2 ON T0."draftKey" = T2."DocEntry" 
INNER JOIN "OWDD" T3 ON T3."DocEntry" = T2."DocEntry" 
GROUP BY T2."DocNum", T0."DocNum", T0."DocDate", T0."DocType", T3."Status", T3."WtmCode"
