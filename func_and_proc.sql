--Хранимая процедура для добавления нового покупателя в базу данных
CREATE OR REPLACE PROCEDURE main.add_product(
  product_name VARCHAR(100),
  product_price INTEGER,
  man_name VARCHAR(100),
  cat_name VARCHAR(100)
)
LANGUAGE plpgsql
AS $$
BEGIN
  INSERT INTO main.product (product_name, product_price, manufacture_id, category_id)
  VALUES (product_name, product_price, 
  (SELECT manufacture_id FROM main.manufacture WHERE manufacture_name = man_name), 
   (SELECT category_id FROM main.category WHERE category_name = cat_name));
END;
$$;

--Пример использования
CALL main.add_product(
'Iphone 14 pro',
1200,
'Apple',
'Smartphones'
)

--Функция принимает на вход имя покупателя и возвращает общее количество товаров, которые он купил
CREATE OR REPLACE FUNCTION main.get_customer_purchase_count(customer_name VARCHAR) 
RETURNS INTEGER AS $$
DECLARE
    purchase_count INTEGER;
BEGIN
    SELECT SUM(product_count) INTO purchase_count FROM main.purchase p
    JOIN main.customer c ON p.customer_id = c.customer_id
    WHERE c.customer_name = $1;
    RETURN purchase_count;
END;
$$ LANGUAGE plpgsql;


--Пример использования
SELECT main.get_customer_purchase_count('Rustam');