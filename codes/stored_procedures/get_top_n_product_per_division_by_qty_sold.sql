CREATE DEFINER=`root`@`localhost` PROCEDURE `get_topn_products_per_division_by_qty_sold`(
in_fiscal_year INT,
in_topn int
)
BEGIN
WITH cte1 AS (

SELECT p.product , p.division , SUM(sold_quantity) AS total_quantity
FROM fact_sales_monthly f
JOIN dim_product p  ON p.product_code = f.product_code 
WHERE get_fiscal_year(f.date) = in_fiscal_year
GROUP BY p.product , p.division)
, 
cte2 AS (
SELECT * , DENSE_RANK()OVER(PARTITION BY division ORDER BY total_quantity DESC) AS ranking
FROM cte1)

SELECT * FROM cte2 WHERE ranking <=in_topn ;


END