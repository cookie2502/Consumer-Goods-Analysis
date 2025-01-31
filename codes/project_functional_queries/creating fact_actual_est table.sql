-- Drop fact_actuals_estimates if it exists.
DROP TABLE IF EXISTS fact_actual_est;

-- Create fact_actuals_estimates table by full outer joining fact_sales_monthly & fact_forecast_monthly tables.
CREATE TABLE fact_actual_est 
	(SELECT 
		s.date AS date,
		s.product_code AS product_code,
		s.customer_code AS customer_code,
		s.sold_quantity AS sold_quantity,
		f.forecast_quantity AS forecast_quantity,
        s.fiscal_year AS fiscal_year
	FROM fact_sales_monthly AS s
	LEFT JOIN fact_forecast_monthly f USING (date , customer_code , product_code)
	) 
	UNION
	(SELECT 
		f.date AS date,
		f.fiscal_year  fiscal_year,
		f.product_code  product_code,
		f.customer_code  customer_code,
		s.sold_quantity sold_quantity,
		f.forecast_quantity  forecast_quantity
	FROM fact_forecast_monthly  f
	LEFT JOIN fact_sales_monthly  s USING (date , customer_code , product_code));

-- Update fact_actuals_estimates table to replace all NULL sold/forecast quantities as 0.
UPDATE fact_actuals_estimates
SET sold_quantity = 0
WHERE sold_quantity IS NULL;

UPDATE fact_actuals_estimates
SET forecast_quantity = 0
WHERE forecast_quantity IS NULL;