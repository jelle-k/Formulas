ALTER PROCEDURE AA_BATCH (IN DOCENTRY INT, IN OBJ_TYPE INT) 
LANGUAGE SQLSCRIPT AS   
BEGIN 
      CREATE LOCAL TEMPORARY TABLE #Records (ID INT);

      CREATE LOCAL TEMPORARY TABLE #Data (ItemCode NVARCHAR(50), Quantity INT, ItemName NVarchar(100), DistNumber NVarchar(50), ExpDate Date, BuyUnitMsr NVarchar (20)
      ,Status INT, U_ASE_PALLETS INT, BinCode NVARCHAR(50),  U_ASE_BATCH_SUPPLIER NVARCHAR(25));

      INSERT INTO #Records
      SELECT K.NUM
      FROM 
      (
            SELECT ROW_NUMBER() OVER (ORDER BY T1.F) NUM
            FROM
              (SELECT 0 AS F FROM DUMMY UNION ALL SELECT 1 FROM DUMMY) T1,
              (SELECT 0 AS F FROM DUMMY UNION ALL SELECT 1 FROM DUMMY) T2,
              (SELECT 0 AS F FROM DUMMY UNION ALL SELECT 1 FROM DUMMY) T3,
              (SELECT 0 AS F FROM DUMMY UNION ALL SELECT 1 FROM DUMMY) T4,
              (SELECT 0 AS F FROM DUMMY UNION ALL SELECT 1 FROM DUMMY) T5,
              (SELECT 0 AS F FROM DUMMY UNION ALL SELECT 1 FROM DUMMY) T6,
              (SELECT 0 AS F FROM DUMMY UNION ALL SELECT 1 FROM DUMMY) T7,
              (SELECT 0 AS F FROM DUMMY UNION ALL SELECT 1 FROM DUMMY) T8,
              (SELECT 0 AS F FROM DUMMY UNION ALL SELECT 1 FROM DUMMY) T9,
              (SELECT 0 AS F FROM DUMMY UNION ALL SELECT 1 FROM DUMMY) T10,
              (SELECT 0 AS F FROM DUMMY UNION ALL SELECT 1 FROM DUMMY) T11,
              (SELECT 0 AS F FROM DUMMY UNION ALL SELECT 1 FROM DUMMY) T12
      )K ORDER BY K.NUM;
      
      
      --INSERT INTO #Data  ((SELECT T0."ItemCode" , 4 FROM OITM T0 WHERE T0."ItemCode"  IN '11103', ));
      --INSERT INTO #Data VALUES  ('A0002', 2);
      --INSERT INTO #Data VALUES  ('A0004', 4);
      
        INSERT INTO #Data 
    --SELECT T0."ItemCode", T1."Quantity" FROM "OITL" T0 
    --INNER JOIN "ITL1" T1 ON T0."LogEntry" = T1."LogEntry" 
    --INNER JOIN "OBTN" T3 ON T3."AbsEntry" = T1."MdAbsEntry" 
    --WHERE T0."ApplyEntry" = :DOCENTRY AND T0."ApplyType" = :OBJ_TYPE;
    
    SELECT T0."ItemCode", 
    CASE
    WHEN T0."ApplyType" = 20 THEN (T1."Quantity" / T4."NumInBuy")
    WHEN T0."ApplyType" = 15 THEN (T1."Quantity" / T4."NumInSale")
    ELSE T1."Quantity" END AS "Quantity"
    , T4."ItemName", T3."DistNumber" , T3."ExpDate", T3."MnfSerial",
    CASE 
    WHEN T0."ApplyType" = 20 THEN T4."BuyUnitMsr"
    WHEN T0."ApplyType" = 15 THEN T4."SalUnitMsr"
    ELSE T4."InvntryUom" END, 
    T3."Status", T3."U_ASE_PALLETS", T5."BinCode", T3."U_ASE_BATCH_SUPPLIER"
    FROM "OITL" T0 
    INNER JOIN OITM T4 ON T4."ItemCode" = T0."ItemCode"
    INNER JOIN "ITL1" T1 ON T0."LogEntry" = T1."LogEntry" 
    INNER JOIN "OBTN" T3 ON T3."AbsEntry" = T1."MdAbsEntry"
    LEFT JOIN ( 
      
      SELECT OBIN."AbsEntry", OBIN."BinCode", OITM."ItemCode", OITM."ManBtchNum", OITM."ManSerNum", 
            CASE 
            WHEN OITM."ManBtchNum" = 'Y' THEN OBBQ."SnBMDAbs" 
            WHEN OITM."ManSerNum" = 'Y' THEN OSBQ."SnBMDAbs" 
            ELSE NULL 
            END AS "SnBMDAbs", OBTN."SysNumber" AS "SysCharge", OBTN."DistNumber" AS "Charge", OSRN."SysNumber" AS "SysSerial", OSRN."DistNumber" AS "Serail", OSRN."MnfSerial", 
            CASE 
            WHEN OITM."ManBtchNum" = 'Y' THEN OBBQ."OnHandQty" 
            WHEN OITM."ManSerNum" = 'Y' THEN OSBQ."OnHandQty" 
            ELSE OIBQ."OnHandQty" 
            END AS "OnHandQty", OBTN."Notes" FROM "OIBQ" 
            INNER JOIN OITM ON OITM."ItemCode" = OIBQ."ItemCode" 
            INNER JOIN "OBIN" ON OBIN."AbsEntry" = OIBQ."BinAbs" 
            LEFT OUTER JOIN "OSBQ" ON OSBQ."ItemCode" = OIBQ."ItemCode" AND OSBQ."BinAbs" = OIBQ."BinAbs" 
            LEFT OUTER JOIN "OSRN" ON OSRN."AbsEntry" = OSBQ."SnBMDAbs" 
            LEFT OUTER JOIN "OBBQ" ON OBBQ."ItemCode" = OIBQ."ItemCode" AND OBBQ."BinAbs" = OIBQ."BinAbs" 
            LEFT OUTER JOIN "OBTN" ON OBTN."AbsEntry" = OBBQ."SnBMDAbs" 
    )T5 ON T5."Charge" = T3."DistNumber" AND T5."ItemCode" = T0."ItemCode" AND T5."OnHandQty"  = T1."Quantity"
    WHERE T1."Quantity" > 0 AND T0."ApplyEntry" = :DOCENTRY AND T0."ApplyType" = :OBJ_TYPE;
    
  
      
      
      SELECT D.* FROM #Data D
      INNER JOIN #Records T ON T.ID <= CEILING(D.U_ASE_PALLETS)
      ORDER BY D.Quantity, D.ItemCode;

      DROP TABLE #Records;    
      DROP TABLE #Data; 
END;  

--CALL AA_BATCH (481, 20);