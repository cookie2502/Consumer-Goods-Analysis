CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `gross_price_total` AS
    SELECT 
        `ns`.`date` AS `date`,
        `ns`.`fiscal_year` AS `fiscal_year`,
        `ns`.`customer_code` AS `customer_code`,
        `c`.`customer` AS `customer`,
        `c`.`market` AS `market`,
        `ns`.`product_code` AS `product_code`,
        `ns`.`product` AS `product`,
        `p`.`variant` AS `variant`,
        `ns`.`sold_quantity` AS `sold_quantity`,
        `ns`.`gross_price_total` AS `gross_price_total`
    FROM
        ((`net_sales` `ns`
        JOIN `dim_product` `p` ON ((`ns`.`product_code` = `p`.`product_code`)))
        JOIN `dim_customer` `c` ON ((`ns`.`customer_code` = `c`.`customer_code`)))