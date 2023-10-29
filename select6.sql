-- (6) GROUP BY + HAVING, ORDER BY
SELECT 'manufacture_names' AS table_name, main.manufacture.manufacture_name, main.category.category_name,
AVG(main.product.product_price) as avg_price
FROM main.manufacture
JOIN main.product ON main.manufacture.manufacture_id = main.product.manufacture_id
JOIN main.category ON main.product.category_id = main.category.category_id
GROUP BY main.manufacture.manufacture_name, main.category.category_name
HAVING AVG(main.product.product_price) > 1000
ORDER BY avg_price DESC;
/*Этот запрос выведет среднюю цену товаров каждого производителя и категории,
у которых средняя цена больше 1000. Результаты будут отсортированы по убыванию средней цены.
*/