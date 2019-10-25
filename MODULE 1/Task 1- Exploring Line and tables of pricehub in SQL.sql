# Select the entire line_item table
SELECT * FROM line_item LIMIT 10;

# Select only the columns sku, unit_price and date from the line_item table (and only the first 10 rows)
SELECT sku, unit_price, date FROM line_item LIMIT 10; 

# Count the total number of unique "sku" from the line_item table
SELECT sum(sku) FROM line_item;

# Generate a list with the average price of each sku
SELECT avg(sku) FROM line_item;

# Count the total number of rows of the line_item table
SELECT count(*) FROM line_item;

# Select only the columns sku, unit_price and date from the line_item table (and only the first 10 rows)
 SELECT sku, AVG (unit_price) AS avg_price FROM line_item group by sku LIMIT 10;
 
 
SELECT sku FROM line_item ORDER BY sku DESC;

# Which products were bought in largest quantities?
SELECT sku AS product FROM line_item 
ORDER BY product DESC;

# select the 100 lines with the biggest "product quantity"
SELECT product_quantity FROM line_item 
ORDER BY product_quantity DESC LIMIT 100;

# select their stock keeping unit" and product quantity
SELECT id_order AS stock, product_quantity FROM line_item ORDER BY product_quantity DESC;

##ORDERS#
### EDA
SELECT * FROM orders;  
SELECT id_order FROM orders;

# How many orders were placed in total?
SELECT sum(id_order) FROM orders;

# Make a count of orders by their state
SELECT count(State) FROM orders;

# Select all the orders placed in January of 2017
SELECT id_order, created_date AS JAN_2017 FROM orders
 ORDER BY created_date > "2017-02-01";
 
 
# Count the number of orders of your previous select query (i.e. How many orders were placed in January of 2017?)
SELECT count(id_order) FROM orders
 where date(created_date) > "2017-02-01";
 
 # How many orders were cancelled on January 4th 2017?
SELECT count(*) FROM orders where date(created_date) = "2017-01-04" and state = "Cancelled"; 

# How many orders have been placed each month of the year?
select count(id_order), extract(month from created_date) as monthly from orders group by monthly;

# What is the total amount paid in all the orders?
Select sum(total_paid) FROM orders;

# What is the average amount paid per order?
Select avg(total_paid) FROM orders;

# Give a result to the previous question with only 2 decimals
Select round(avg(total_paid)) FROM orders;

# What is the date of the newest order? And the oldest?
SELECT id_order, created_date FROM orders order by created_date asc LIMIT 1;

# Oldest
SELECT id_order, created_date FROM orders order by created_date DESC LIMIT 1;

# What is the day with the highest amount of completed orders (and how many completed orders were placed that day)?
SELECT DISTINCT(created_date) , total_paid, state AS FULL_COMPLETED FROM orders 
order by state= "Completed" AND total_paid;
 
 
 SELECT created_date FROM orders HAVING total_paid;
 
 ### PRODUCT 
 
 # How many products are there
#EDA
 SELECT * FROM products;
 
 # How many brands
 SELECT sum(brand) FROM products;
 
 # How many categories
 SELECT manual_categories AS categories FROM products;
 #ANS = 170
 
 # How many products per brand & products per category
 SELECT sum(brand), sum(manual_categories) FROM products group by ProductId; 
 
 # What's the average price per brand and the average price per category
 SELECT avg(price) FROM products order by brand and manual_categories;
 
 # What's the name and description of the most expensive product per brand and per category
  SELECT products.name_en as productName, products.short_desc_en as Description, products.brand, price
  FROM products 
 
  
  
  
 #### QUERY 2 ####
 
 # QUERY 1
  use pricehub;
  
SELECT line_item.sku, name_en, manual_categories, unit_price, price, date, line_item.sku
FROM line_item 
JOIN products 
ON line_item.sku = products.sku;

# QUERY 2.
## 2
SELECT line_item.sku, name_en, manual_categories, unit_price, price, date, (price-unit_price) AS price_difference
FROM line_item 
JOIN products 
ON line_item.sku = products.sku;

## 3
SELECT line_item.sku, name_en, products.manual_categories, unit_price, price, date, (price-unit_price) 
AS price_difference
FROM line_item 
INNER JOIN products 
ON line_item.sku = products.sku
group by products.manual_categories
order by products.manual_categories;

## 4
SELECT line_item.sku, products.brand, 
unit_price, products.price, date, 
(price-unit_price) AS price_difference
FROM line_item
INNER JOIN products 
ON line_item.sku = products.sku
group by products.brand
order by products.brand;

## 5
SELECT line_item.sku, products.brand,  
AVG(price-unit_price) AS avg_price_difference
FROM line_item
INNER JOIN products
ON line_item.sku = products.sku
group by products.brand
having avg(price-unit_price) > 50000
order by avg_price_difference;

##6
SELECT line_item.sku
FROM line_item
INNER JOIN orders
ON line_item.sku;

##7
SELECT line_item.sku, products.brand, products.manual_categories
FROM line_item
JOIN orders
ON orders.id_order = line_item.id_order
JOIN products 
ON line_item.sku = products.sku;

##8
SELECT line_item.sku, products.brand, products.manual_categories
FROM line_item
JOIN orders
ON orders.id_order = line_item.id_order
JOIN products 
ON line_item.sku = products.sku
group by count(manual_categories)  
group by count(brand)



 













 
 
 








