CREATE TABLE test 
    (`ID` int, `year` int, `month` int, `Hwater` int);
    
INSERT INTO test 
    (`ID`, `year`, `month`, `hwater`)
VALUES
    (1,2015,1,13),
    (2,2015,2,22),
    (3,2015,3,30),
    (4,2015,4,37),
    (5,2015,5,43),
    (6,2015,6,49),
    (7,2015,7,52),
    (8,2015,8,60),
    (9,2015,9,60),
    (10,2016,1,65),
    (11,2016,2,67),
    (12,2016,3,69),
    (13,2016,4,74),
    (14,2016,5,84),
    (15,2016,6,91),
    (16,2016,7,91),
    (17,2016,8,96),
    (18,2016,9,102);


SELECT MONTH,
       MAX(CASE WHEN year = 2015  THEN hwater ELSE 0 END) as `2015`,
       MAX(CASE WHEN year = 2016  THEN hwater ELSE 0 END) as `2016`       

FROM test AS A 
WHERE A.year = 2015 OR A.year = 2016
GROUP BY MONTH
ORDER BY MONTH