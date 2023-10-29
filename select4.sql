-- (4) func() OVER(): ORDER BY
SELECT 'price_changing' as table_name, main.product.product_name, main.price_change.data_price_change,
main.price_change.new_price,
AVG(main.price_change.new_price) OVER (PARTITION BY main.product.product_name
ORDER BY main.price_change.data_price_change DESC) as avg_price
FROM main.product
JOIN main.price_change
ON main.product.product_id = main.price_change.product_id
ORDER BY avg_price DESC;
/*Этот запрос выведет название товара, дату изменения цены, новую цену и среднюю
цену за товар с помощью функции OVER(), которая будет считать среднюю цену для каждого
товара в порядке убывания даты изменения цены. Результаты будут отсортированы по убыванию средней цены.
*/