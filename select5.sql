-- (5) func() OVER(): ORDER BY
SELECT 'category_names' as table_name, category.category_name, product.product_name,
product.product_price, manufacture.manufacture_name,
DENSE_RANK() OVER(ORDER BY category.category_name) AS "category_num"
FROM main.product
JOIN main.category
ON product.category_id = category.category_id
JOIN main.manufacture
ON manufacture.manufacture_id = product.manufacture_id;
/*Ранжируем каждую строку окна без разрывов в нумерации при
равенстве значений (нумеруем название категорий)
Будут выведены: название категории, название продукта,
цена продукта, название производителя, номера категорий
*/