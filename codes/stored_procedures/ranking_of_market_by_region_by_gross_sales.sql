CREATE DEFINER=`root`@`localhost` PROCEDURE `ranking_of_market_by_region_by_gross_sales`( in_fiscal_year INT , 
no_of_rank INT)
BEGIN
	with cte1 as (
		select
			c.market,
			c.region,
			round(sum(s.gross_price_total)/1000000,2) as gross_sales_mln
			from gross_price_total s
			join dim_customer c
			on c.customer_code=s.customer_code
			where fiscal_year= in_fiscal_year
			group by c.market , c.region
			order by gross_sales_mln desc
		),
		cte2 as (
			select *,
			dense_rank() over(partition by region order by gross_sales_mln desc) as drnk
			from cte1
		)
	select * from cte2 where drnk<= no_of_rank ; 
END