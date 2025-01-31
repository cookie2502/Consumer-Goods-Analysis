CREATE DEFINER=`root`@`localhost` TRIGGER `fact_sales_monthly_AFTER_INSERT` AFTER INSERT ON `fact_sales_monthly` FOR EACH ROW BEGIN
INSERT INTO fact_actual_est(date, product_code , customer_code , sold_quantity)
VALUES(
NEW.date,
NEW.product_code,
NEW.customer_code,
NEW.sold_quantity
)
ON duplicate key update
sold_quantity = values(sold_quantity);
END