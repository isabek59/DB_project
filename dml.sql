SELECT * FROM main.delivery;

SELECT purchase_date
FROM main.purchase;

SELECT EXTRACT(MONTH FROM delivery_date) AS month
FROM main.delivery
WHERE EXTRACT(MONTH FROM delivery_date) >= 4;  

SELECT customer_name
FROM main.customer 
GROUP BY customer_name;

SELECT pr.product_name, COUNT(DISTINCT p.store_id) AS storecount
FROM main.product pr
JOIN main.purchase p ON pr.product_id = p.product_id
GROUP BY pr.product_name
HAVING COUNT(DISTINCT p.store_id) > 1;


INSERT INTO main.category (category_name) VALUES ('Monitors');
INSERT INTO main.customer (customer_name, delivery_count) VALUES ('Isabek', 0);

UPDATE main.store
SET store_name = 'CitiLink'
WHERE store_name = 'Citylink';

UPDATE main.customer
SET delivery_count = 1
WHERE customer_name = 'Egor';

DELETE 
FROM main.category
WHERE category_name = 'Cameras';