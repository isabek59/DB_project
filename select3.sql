-- (3) func() OVER(): PARTITION BY
SELECT 'avg_prices' as table_name, product_name, manufacture_name, product_price,
AVG(product.product_price) OVER(PARTITION BY manufacture.manufacture_id) AS avg_price
FROM main.product
JOIN main.manufacture
ON product.manufacture_id = manufacture.manufacture_id
/*В результате этого запроса будет найдена средняя
цена товара для каждого производителя
Будут выведены: название товара, производитель, цена,
средняя цена товара производителя
*/