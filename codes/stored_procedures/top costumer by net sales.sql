CREATE DEFINER=`root`@`localhost` PROCEDURE `top_customer_by_netsales`( 
in_market VARCHAR(50),
in_fiscal_year INT,
in_top_n INT)
BEGIN
SELECT customer , ROUND(SUM(net_sales)/1000000,2) AS net_sales_mln 
FROM net_sales 
WHERE market = in_market
AND fiscal_year = in_fiscal_year 
GROUP BY customer 
ORDER BY net_sales_mln DESC 
LIMIT in_top_n ;
END