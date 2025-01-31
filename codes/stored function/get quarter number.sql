CREATE DEFINER=`root`@`localhost` FUNCTION `quarter_number`(get_quarter DATE) RETURNS varchar(4) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
DECLARE x TINYINT ;
DECLARE qtr VARCHAR(4);
SET x = MONTH(get_quarter);
CASE 
WHEN x IN (9,10,11) THEN  SET qtr = "Q1"; 
WHEN x IN (12,1,2) THEN SET qtr = "Q2";
WHEN  x BETWEEN 3 AND 5 THEN SET qtr = "Q3";
WHEN x BETWEEN 6 AND 8 THEN SET qtr = "Q4";
ELSE SET qtr="NA" ;
 END CASE ;

RETURN qtr;
END