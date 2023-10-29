-- (2) ORDER BY
SELECT 'products' as table_name, product_name, product_price, category_name
FROM main.product
JOIN main.category
ON product.category_id = category.category_id
WHERE product_price >= 600
ORDER BY product_price;
/*В результате этого запроса будет выведен
список продуктов, имеющих стоимость не меньше 600,
расположенных в порядке возрастания цены.
*/