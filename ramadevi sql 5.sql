create table analytical_sales(
   transaction_id INT PRIMARY KEY,
   product_category VARCHAR(30),
   units_sold INT,
   total_revenue DECIMAL(8,2)
);
INSERT INTO analytical_sales
VALUES
(1,'ELECTRONICS',2,1199.98),
(2,'APPAREL',5,125.00),
(3,'ELECTRONICS',1,45.00),
(4,'HOME GOODS',3,270.00),
(5,'APPAREL',1,45.00),
(6,'ELECTRONICS',4,2400.00);
select * from analytical_sales;
--- 1)Caluculating global sales metrics using AGGREGATE FUNCTIONS
SELECT
SUM(total_revenue) as gross_revenue,
avg(total_revenue) as total_transactions,
count(*) as total_transactions,
min(total_revenue) as lowest_revenue,
max(total_revenue) as highest_revenue
from analytical_sales;
---2)COUNT DISTINCTING categories using cont
SELECT
count(distinct product_category) as unique_categories
from analytical_sales;
---3)Segment revenue GROUP BY 
select 
   product_category,
   sum(total_revenue) as category_revenue,
   sum(units_sold) as total_units
from 
 analytical_sales
 group by product_category;
---4)Ranking categories by Revenue
SELECT 
product_category,
sum (total_revenue) as highest_revenue
from analytical_sales
group by product_category
order by highest_revenue desc;
--- 5)Filtering individual records using(where)
select * 
from analytical_sales
where units_sold>1;
---6)Filtering aggregated results using (having)
select
product_category,
sum(total_revenue) as gross_revenue
from analytical_sales
group by product_category
having sum(total_revenue)>300
order by gross_revenue desc;
---7)Combining where ,group by, and having
select
   product_category,
   sum(total_revenue) as filtered_category_revenue
from analytical_sales
where units_sold >1
group by product_category
having
     sum(total_revenue)>250;
---8)Sql logical execution order
select
     product_category,
     sum(total_revenue) as filtered_category_revenue
from analytical_sales
where units_sold >1
group by product_category
having
     sum(total_revenue)>250
order by  filtered_category_revenue desc
limit 2;
---CRRECTING an aggregation error
select 
     product_category,
	 transaction_id,
	 sum(total_revenue) as category_revenue
from analytical_sales
group by transaction_id;

