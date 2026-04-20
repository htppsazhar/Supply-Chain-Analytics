-- 𝑰𝒏 𝒕𝒉𝒊𝒔 𝒇𝒊𝒍𝒆 𝒘𝒆 𝒘𝒊𝒍𝒍 𝒕𝒉𝒆 𝒔𝒐𝒍𝒗𝒊𝒏𝒈 𝒕𝒉𝒆 𝑷𝒓𝒂𝒄𝒕𝒊𝒄𝒆 𝑸𝒖𝒆𝒔𝒕𝒊𝒐𝒏 𝒓𝒆𝒍𝒂𝒕𝒆𝒅 𝒕𝒐 𝒕𝒉𝒆 𝑺𝒖𝒑𝒑𝒍𝒚 𝑪𝒉𝒂𝒊𝒏 𝑷𝒓𝒐𝒋𝒆𝒄𝒕


-- SECTION A: Level 1 (Basic Queries)

-- 1. Data Exploration: Read all the data from the Supplier, Product, OrderItem, Orders, and Customer tables.

-- Supplier:
SELECT * FROM supplier;

-- Product:
SELECT * FROM Product;

-- OrderItem:
SELECT * FROM orderitem;

-- Orders:
SELECT * FROM orders;

-- Customer:
SELECT * FROM customer;

/****************************/

-- 2. Customer Demographics: Find the count of customers in each country, ordered from highest to lowest.

SELECT * FROM customer ;

SELECT DISTINCT(Country), COUNT(*) AS Total_Customers
FROM customer
GROUP BY Country
ORDER BY Total_Customers DESC;

/****************************/

-- 3. Active Inventory: Display all products that are currently active (not discontinued).

SELECT ProductName, IsDiscontinued 
FROM product 
WHERE IsDiscontinued = 0 ;

/****************************/

-- 4. Supplier Catalog: List all company names along with the names of the products they supply.

-- SELECT * FROM supplier ; 

-- SELECT * FROM product;

SELECT s.Id, s.CompanyName, p.Id, p.ProductName
FROM product p
JOIN supplier s ON p.SupplierId = s.Id;

/****************************/

-- 5. Regional Search: Find all customer information for those residing in 'Mexico'.

SELECT * 
FROM customer 
WHERE Country = 'Mexico'; 

/****************************/

-- 6. High-Value Items: Identify the most expensive item ordered by each customer.

SELECT c.FirstName, p.ProductName, MAX(oi.UnitPrice) AS Most_Expensive_Item
FROM customer c
JOIN orders o ON c.Id = o.CustomerId
JOIN orderitem oi ON o.Id = oi.OrderId
JOIN product p ON oi.ProductId = p.Id
GROUP BY c.FirstName, p.ProductName
ORDER BY Most_Expensive_Item DESC;

/****************************/

-- 7. Top Suppliers: Find the Supplier ID that provides the highest number of products.

SELECT p.SupplierId, s.CompanyName, COUNT(p.Id) AS Highest_No_Of_Products
FROM product p
JOIN supplier s ON p.SupplierId = s.Id
GROUP BY p.SupplierId, s.CompanyName
ORDER BY Highest_No_Of_Products DESC
LIMIT 5;

/****************************/

-- 8. Order Trends: Display the count of orders placed each month and year.

-- SELECT * FROM orders;

SELECT 
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    COUNT(Id) AS Total_Orders
FROM orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Year, Month ;

/****************************/

-- 9. Supplier Concentration: Which country has the maximum number of suppliers?

-- SELECT * FROM supplier;

SELECT Country, COUNT(*) AS Total_no_of_supplier
FROM supplier
GROUP BY Country
ORDER BY Total_no_of_supplier DESC LIMIT 5; 

/****************************/

-- 10. Inactive Customers: Identify customers who have never placed an order.

-- SELECT * FROM customer;

-- SELECT * FROM orders; 

SELECT c.Id, c.FirstName
FROM customer c
LEFT JOIN orders o ON c.Id = o.CustomerId
WHERE o.CustomerId IS NULL;

  
/********************************************/
-- Section B: Level 2 (Intermediate Queries)
/********************************************/

-- 1. Product Demand: Rank Product IDs and Names based on the total quantity ordered by customers.

-- SELECT * FROM product;

SELECT p.Id, p.ProductName, SUM(oi.Quantity) AS Total_Quantity
FROM product p
JOIN orderitem oi ON p.Id = oi.ProductId
GROUP BY p.Id, p.ProductName
ORDER BY Total_Quantity DESC;

/****************************/

-- 2. Annual Performance: Display the total number of orders delivered each year.

-- SELECT * FROM orders;

SELECT YEAR(OrderDate) AS Each_Year, COUNT(*) AS Total_orders
FROM orders
GROUP BY Each_Year
ORDER BY Total_orders DESC ; 
 
/****************************/

-- 3. Revenue Analysis: Calculate the total revenue generated each year.

-- SELECT * FROM orders;

SELECT YEAR(OrderDate) AS Each_Year, SUM(TotalAmount) AS Total_Revenue
FROM orders
GROUP BY Each_Year
ORDER BY Total_Revenue;

/****************************/

-- 4. Top Spender: Find the details of the customer who has spent the most money across all their orders.

-- SELECT * FROM customer;
-- SELECT * FROM orders;

SELECT c.Id, c.FirstName, c.LastName, SUM(o.TotalAmount) AS Total_revenue
FROM customer c 
LEFT JOIN orders o ON c.Id = o.CustomerId
GROUP BY c.Id, c.FirstName, c.LastName
ORDER BY Total_revenue DESC;

/****************************/

-- 5. Customer Ranking: List all customers and their total order amounts, ordered from highest to lowest.

SELECT c.Id, c.FirstName, c.LastName, SUM(o.TotalAmount) AS Total_Order_Amount
FROM customer c
LEFT JOIN orders o ON c.Id = o.CustomerId
GROUP BY c.Id, c.FirstName, c.LastName
ORDER BY Total_Order_Amount DESC;

/****************************/

-- 6. Order History: For each customer, list their current and previous order dates to see how frequently they do business.

-- SELECT * FROM customer;
-- SELECT * FROM orders;

SELECT 
    c.FirstName,
    o.OrderDate AS Current_Order_Date,
    LAG(o.OrderDate) OVER (PARTITION BY c.Id ORDER BY o.OrderDate) AS Previous_Order_Date
FROM customer c
JOIN orders o ON c.Id = o.CustomerId
ORDER BY c.FirstName, o.OrderDate;

/****************************/

-- 7. Supplier Revenue: Identify the top 3 suppliers based on the total revenue generated by their products.

-- SELECT * from supplier;
-- SELECT * FROM product;

SELECT s.Id, s.CompanyName, 
       SUM(oi.UnitPrice * oi.Quantity) AS Total_Revenue
FROM supplier s
JOIN product p ON p.SupplierId = s.Id
JOIN orderitem oi ON oi.ProductId = p.Id
GROUP BY s.Id, s.CompanyName
ORDER BY Total_Revenue DESC
LIMIT 3;

/****************************/

-- 8. Customer Loyalty: Display the latest order date for each customer (excluding their very first order).

SELECT c.FirstName, MAX(o.OrderDate) AS Latest_Order_Date
FROM customer c
JOIN orders o ON c.Id = o.CustomerId
GROUP BY c.Id, c.FirstName
HAVING COUNT(o.Id) > 1
ORDER BY Latest_Order_Date DESC;

/****************************/

-- 9. Order Details: For every order, display the Order ID, Product Name, and Supplier Name.

SELECT o.Id AS Order_ID, p.ProductName, s.CompanyName AS Supplier_Name
FROM orders o
JOIN orderitem oi ON o.Id = oi.OrderId
JOIN product p ON oi.ProductId = p.Id
JOIN supplier s ON p.SupplierId = s.Id
ORDER BY o.Id;


/********************************************/
-- Section C: Level 3 (Advanced Queries)
/********************************************/

-- 1. Bulk Buyers: Find customers who have ordered more than 10 products in a single order.

SELECT c.FirstName, o.Id AS Order_ID, COUNT(oi.ProductId) AS Total_Products
FROM customer c
JOIN orders o ON c.Id = o.CustomerId
JOIN orderitem oi ON o.Id = oi.OrderId
GROUP BY c.FirstName, o.Id
HAVING COUNT(oi.ProductId) > 10
ORDER BY Total_Products DESC;

/****************************/

-- 2. Small Orders: List all product details for items that were ordered with a quantity of exactly 1.

SELECT p.Id, p.ProductName, oi.Quantity
FROM product p
JOIN orderitem oi ON p.Id = oi.ProductId
WHERE oi.Quantity = 1;

/****************************/

-- 3. Premium Suppliers: Identify companies that supply products with a unit price above 100.

                                   
-- SELECT * FROM supplier;										 -- supplier = companyname, supplierID
-- SELECT * FROM product;										 -- product = productid, supplierid 

SELECT s.CompanyName, p.ProductName, (p.UnitPrice) AS Total_UnitPrice
FROM product p 
JOIN supplier s ON p.SupplierId = s.Id
GROUP BY p.Id, p.ProductName
HAVING Total_UnitPrice > 100
ORDER BY Total_UnitPrice DESC;

/****************************/

-- 4. City-Based Networking: List customers who live in the same city and country, arranged by country.

-- SELECT DISTINCT(Country) FROM customer;

-- SELECT DISTINCT(City) FROM customer;
-- select * from customer ;

SELECT City, Country, GROUP_CONCAT(FirstName SEPARATOR ' | ') AS Customers
FROM customer
GROUP BY City, Country
HAVING COUNT(Id) > 1
ORDER BY Country;

/****************************/


/********************************************/
-- Section D: Level 4 (Expert Queries)
/********************************************/

-- 1. Savings Analysis: The company offers discounts. 
--    Calculate the total amount saved in each order (Actual Price - Selling Price) and rank orders by total savings.

-- SELECT * FROM orderitem;
-- SELECT * FROM product;

SELECT oi.orderid, SUM((p.unitprice - oi.unitprice) * oi.quantity) AS total_amount_saved
FROM product p 
JOIN orderitem oi ON p.id = oi.productid
GROUP BY oi.orderid
ORDER BY total_amount_saved DESC;

/****************************/

-- 2. Market Research: Help a new supplier, Mr. Kavin, by identifying:
--       a. A list of high-demand products he should consider supplying.
--       b. A list of his potential competitors for those products.


-- 2.a: High-demand products

SELECT p.ProductName, SUM(Quantity) AS High_demand_products
FROM orderitem oi
JOIN product p ON p.Id = oi.ProductId
GROUP BY p.ProductName
ORDER BY High_demand_products DESC;


-- 3.b. Competitors for high-demand products

SELECT DISTINCT s.contactname, s.CompanyName, p.productname
FROM orderitem oi 
JOIN product p ON p.id = oi.productid
JOIN supplier s ON p.supplierid = s.id;


/********************************************/
-- All QUESTIONS COMPLETED..!!
/********************************************/






































