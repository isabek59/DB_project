--1. Представление для вывода списка всех товаров с их ценой, названием производителя и названием категории:

CREATE VIEW main.product_info AS 
SELECT p.product_name, p.product_price, m.manufacture_name, c.category_name 
FROM main.product p 
JOIN main.manufacture m ON p.manufacture_id = m.manufacture_id 
JOIN main.category c ON p.category_id = c.category_id;

--2. Представление для вывода списка покупок с указанием имени покупателя, количеством купленного товара, датой покупки и названием товара:

CREATE VIEW main.purchase_info AS 
SELECT c.customer_name, pr.product_name, pu.product_count, pu.purchase_date 
FROM main.purchase pu 
JOIN main.customer c ON pu.customer_id = c.customer_id 
JOIN main.product pr ON pu.product_id = pr.product_id;

--3. Представление для вывода статистики по продажам товаров по категориям:

CREATE VIEW main.sales_by_category AS 
SELECT c.category_name, SUM(pu.product_count) AS total_sales 
FROM main.purchase pu 
JOIN main.product pr ON pu.product_id = pr.product_id 
JOIN main.category c ON pr.category_id = c.category_id 
GROUP BY c.category_name;

--4. Представление для вывода списка всех поставок с указанием цены поставки, датой поставки и названием филиала:

CREATE VIEW main.delivery_info AS 
SELECT d.delivery_price, d.delivery_date, s.store_name 
FROM main.delivery d 
JOIN main.store s ON d.store_id = s.store_id;

--5. Представление "Топ-5 самых популярных товаров":
CREATE VIEW main.top_products AS
SELECT p.product_name, SUM(pr.product_count) AS total_sales
FROM main.product p
JOIN main.purchase pr ON p.product_id = pr.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC
LIMIT 5;

--6. Представление "Статистика поставок по месяцам":
CREATE VIEW main.delivery_statistics AS
SELECT EXTRACT(MONTH FROM d.delivery_date) AS month,
EXTRACT(YEAR FROM d.delivery_date) AS year,
COUNT(*) AS delivery_count,
SUM(d.delivery_price) AS total_delivery_price
FROM main.delivery d
GROUP BY month, year
ORDER BY year, month; 

--7. Представление, скрывающее персональные данные и технические поля таблицы main.customer:
CREATE VIEW main.customer_info AS
SELECT customer_id,
CONCAT(SUBSTR(customer_name, 1, 1), REPEAT('*', LENGTH(customer_name) - 1)) AS name,
delivery_count
FROM main.customer;