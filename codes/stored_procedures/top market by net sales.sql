CREATE DEFINER=`root`@`localhost` PROCEDURE `top_market_by_net_sales`(in_fiscal_year INT , top_n INT )
BEGIN
SELECT 
  market , ROUND(SUM(net_sales)/1000000 ,2) AS net_sale_mln
  FROM gdb0041.net_sales
  WHERE fiscal_year = in_fiscal_year
  GROUP BY market
  ORDER BY net_sale_mln DESC
  limit top_n;
END