create database onyx_data_challenge_january;
use onyx_data_challenge_january;

create table data_onyx(
	orderId int not null,
    orderDate varchar(15) not null,
    productId varchar(10) not null,
    productCategories varchar(15) not null,
    buyerGender varchar(7) not null,
    buyerAge int not null,
    orderLocation varchar(20) not null,
    latitude int not null,
    longitude int not null,
    internationalShipping varchar(5) not null,
    salesPrice int not null,
    shippingCharges int not null,
    salesPerUnit int not null,
    quantity int not null,
    totalSales int not null,
    rating int not null,
    review varchar(100) not null
);

drop table data_onyx;
select * from data_onyx;

-- 1.	What are the overall sales trends?
select sum(totalSales) as Total_sales from data_onyx;

-- 2.	Which product categories perform the best? Clothing
select productCategories, sum(totalSales) as total_sales from data_onyx
group by productCategories
order by total_sales desc;

-- 3.	What are the most and least popular products? Clothing
select productCategories, sum(quantity) as total_quantity from data_onyx
group by productCategories
order by total_quantity desc;


-- 4.	How does location affect sales performance? Best - New jersey
select orderLocation, count(totalSales) as total_sales from data_onyx
group by orderLocation
order by total_sales desc;

-- 5.	What impact does international shipping have on sales?
select internationalShipping, count(totalSales) as total_sales from data_onyx
group by internationalShipping
order by total_sales desc;


-- 6.	What is the demographic profile of buyers? max no. of ages = 34 (count - 434)
select buyerGender, count(buyerGender) as gender from data_onyx
group by buyerGender 
order by gender desc;

select buyerAge, count(buyerAge) as count from data_onyx
group by buyerAge 
order by count desc;
-- 7.	How do ratings and reviews correlate with sales?
SELECT 
    rating, SUM(totalSales) AS total_sales
FROM
    data_onyx
GROUP BY rating
ORDER BY total_sales DESC;

-- 8.	What are the trends in shipping charges?
SELECT 
    shippingCharges,
    COUNT(shippingCharges) AS total_count,
    shippingCharges * COUNT(shippingCharges) AS multiplied_value
FROM
    data_onyx
GROUP BY shippingCharges;

-- 9.	How do discounts or promotional pricing influence purchasing behavior?
select  productCategories, sum(shippingCharges) from data_onyx
group by productCategories;


-- 10.	Are there any patterns in repeat purchases?
select productId, productCategories ,sum(totalSales) as total_sales from data_onyx
group by productId, productCategories
order by total_sales desc;

