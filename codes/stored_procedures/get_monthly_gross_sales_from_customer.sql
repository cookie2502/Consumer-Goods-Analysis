CREATE DEFINER=`root`@`localhost` PROCEDURE `get_monthly_gross_sales_for_customer`(in_customer_codes TEXT)
BEGIN
SELECT f.date AS month_starting , SUM(ROUND(g.gross_price*f.sold_quantity,2)) AS monthly_sales 
FROM fact_sales_monthly f 
JOIN fact_gross_price g ON f.product_code = g.product_code AND get_fiscal_year(f.date) = g.fiscal_year
WHERE find_in_set(f.customer_code,in_customer_codes)>0
GROUP BY f.date;


END