SELECT
T0."DocNum",
T0."DocDate",
T4."Code",
T4."Name",
T4."U_Value"

FROM OINV T0
INNER JOIN "@GSVNSV" T4 ON (
YEAR(T0."DocDate") = YEAR(T4."Code") AND 
MONTH(T0."DocDate") = MONTH(T4."Code"))