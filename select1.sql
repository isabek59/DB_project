-- (1) GROUP BY + HAVING
SELECT distinct(customer_name) as name, 'customer' as table_name
FROM main.delivery d
JOIN main.customer c
ON d.customer_id = c.customer_id
JOIN main.store s
ON d.store_id = s.store_id
WHERE store_name = 'BigGeek' OR store_name = 'CityLink'
GROUP BY customer_name, delivery_price
HAVING delivery_price >= 200;
/*Этот запрос выбирает покупателей , которые заказали доставку
из магазина 'BigGeek' или 'CityLink', а также имеют стоимость
доставки, не меньше 200.
*/