SELECT 
IFNULL(T0."CompnyName", '') AS "Name", 
IFNULL(T0."CompnyAddr", '') AS "AddressFull", 
IFNULL(T1."Street", '') AS "AddressStreet", 
IFNULL(T1."City", '') AS "AddressCity", 
IFNULL(T1."ZipCode", '') AS "AddressZipCode", 
IFNULL(T0."Country", '') AS "AddressCountry", 
IFNULL(T0."Phone1", '') AS "Phone1", 
IFNULL(T0."E_Mail", '') AS "Email", 
IFNULL(T0."TaxIdNum", '') AS "FederalTaxId", 
IFNULL(T1."IntrntAdrs", '') AS "Website", 
IFNULL(T0."PrintHeadr", '') AS "PrintHeader", 
IFNULL(T0."BankCountr", '') AS "BankCountry", 
IFNULL(T0."DflBnkCode", '') AS "BankCode", 
(SELECT IFNULL(TS0."BankName", '') FROM ODSC TS0 WHERE TS0."CountryCod" = T0."BankCountr" AND TS0."BankCode" = T0."DflBnkCode") AS "BankName", 
(SELECT IFNULL(TS0."SwiftNum", '') FROM ODSC TS0 WHERE TS0."CountryCod" = T0."BankCountr" AND TS0."BankCode" = T0."DflBnkCode") AS "BankSwift", 
(SELECT IFNULL(TS0.IBAN, '') FROM DSC1 TS0 WHERE TS0."Country" = T0."BankCountr" AND TS0."BankCode" = T0."DflBnkCode" AND TS0."Branch" = T0."DflBranch" AND TS0."Account" = T0."DflBnkAcct") AS "BankIban", 
(SELECT IFNULL(TS0."Street", '') FROM DSC1 TS0 WHERE TS0."Country" = T0."BankCountr" AND TS0."BankCode" = T0."DflBnkCode" AND TS0."Branch" = T0."DflBranch" AND TS0."Account" = T0."DflBnkAcct") AS "BankStreet", 
(SELECT IFNULL(TS0."Block", '') FROM DSC1 TS0 WHERE TS0."Country" = T0."BankCountr" AND TS0."BankCode" = T0."DflBnkCode" AND TS0."Branch" = T0."DflBranch" AND TS0."Account" = T0."DflBnkAcct") AS "BankBlock", 
(SELECT IFNULL(TS0."City", '') FROM DSC1 TS0 WHERE TS0."Country" = T0."BankCountr" AND TS0."BankCode" = T0."DflBnkCode" AND TS0."Branch" = T0."DflBranch" AND TS0."Account" = T0."DflBnkAcct") AS "BankCity", 
(SELECT IFNULL(TS0."County", '') FROM DSC1 TS0 WHERE TS0."Country" = T0."BankCountr" AND TS0."BankCode" = T0."DflBnkCode" AND TS0."Branch" = T0."DflBranch" AND TS0."Account" = T0."DflBnkAcct") AS "BankCounty", 
(SELECT IFNULL(TS0."State", '') FROM DSC1 TS0 WHERE TS0."Country" = T0."BankCountr" AND TS0."BankCode" = T0."DflBnkCode" AND TS0."Branch" = T0."DflBranch" AND TS0."Account" = T0."DflBnkAcct") AS "BankState", 
(SELECT IFNULL(TS0."ZipCode", '') FROM DSC1 TS0 WHERE TS0."Country" = T0."BankCountr" AND TS0."BankCode" = T0."DflBnkCode" AND TS0."Branch" = T0."DflBranch" AND TS0."Account" = T0."DflBnkAcct") AS "BankZipCode", 
IFNULL(T0."DflBnkAcct", '') AS "BankAccount", IFNULL(T0."DflBranch", '') AS "BankBranch", IFNULL(T0."HldCode", '') AS "HolidayCode", IFNULL(T0."MultiLang", '') AS "MultiLanguageSupport", IFNULL(T2."LogoFile", '') AS "Logo" 
FROM OADM T0 
INNER JOIN ADM1 T1 ON 1 = 1 
INNER JOIN OADP T2 ON 1 = 1