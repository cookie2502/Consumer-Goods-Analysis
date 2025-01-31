CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `net_sales` AS
    SELECT 
        `sales_postinvoice_discount`.`date` AS `date`,
        `sales_postinvoice_discount`.`fiscal_year` AS `fiscal_year`,
        `dim_customer`.`market` AS `market`,
        `dim_customer`.`customer` AS `customer`,
        `sales_postinvoice_discount`.`customer_code` AS `customer_code`,
        `sales_postinvoice_discount`.`product_code` AS `product_code`,
        `sales_postinvoice_discount`.`product` AS `product`,
        `sales_postinvoice_discount`.`sold_quantity` AS `sold_quantity`,
        `sales_postinvoice_discount`.`gross_price_total` AS `gross_price_total`,
        `sales_postinvoice_discount`.`net_preinvoice_sales` AS `net_preinvoice_sales`,
        `sales_postinvoice_discount`.`postinvoice_discount_pct` AS `postinvoice_discount_pct`,
        ROUND(((1 - `sales_postinvoice_discount`.`postinvoice_discount_pct`) * `sales_postinvoice_discount`.`net_preinvoice_sales`),
                2) AS `net_sales`
    FROM
        (`sales_postinvoice_discount`
        JOIN `dim_customer` ON ((`dim_customer`.`customer_code` = `sales_postinvoice_discount`.`customer_code`)))