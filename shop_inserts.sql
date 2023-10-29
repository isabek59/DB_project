   -- Заполнение таблицы о производителях
  INSERT INTO main.manufacture (manufacture_name) VALUES
  ('Apple'),
  ('Sony'),
  ('Samsung'),
  ('Dell'),
  ('Hp'),
  ('Asus'),
  ('Acer'),
  ('Jbl'),
  ('Microsoft'),
  ('Nintendo');

  -- Заполнение таблицы о категориях товара
  INSERT INTO main.category (category_name) VALUES
  ('Laptops'),
  ('Smartphones'),
  ('Headphones'),
  ('Consoles'),
  ('Smart watches'),
  ('Tablets'),
  ('Cameras'),
  ('Accessories');

  -- Заполнение таблицы о покупателях
  INSERT INTO main.customer (customer_name, delivery_count) VALUES
  ('Ivan', 1),
  ('Ekaterina', 3),
  ('Egor', 2), 
  ('Rustam', 1),
  ('Ahmet', 5),
  ('Aidan', 2),
  ('Anastasiya', 1),
  ('Mariya', 2),
  ('Irina', 3);

  -- Заполение таблицы о магазинах
  INSERT INTO main.store (store_name) VALUES
  ('DNS'),
  ('M.Video'),
  ('Eldorado'),
  ('BigGeek'),
  ('TechnoPark'),
  ('Citylink'),
  ('MegaPhone'),
  ('ComputerUniverse');

  -- Заполнение таблицы о продуктах
  INSERT INTO main.product (product_name, product_price, manufacture_id, category_id) VALUES 
  ('iPhone 12', 650, (SELECT manufacture_id FROM main.manufacture WHERE manufacture_name = 'Apple'),
    (SELECT category_id FROM main.category WHERE category_name = 'Smartphones')),
  ('Galaxy S21', 610, (SELECT manufacture_id FROM main.manufacture WHERE manufacture_name = 'Samsung'),
    (SELECT category_id FROM main.category WHERE category_name = 'Smartphones')),
  ('MacBook Air', 1220, (SELECT manufacture_id FROM main.manufacture WHERE manufacture_name = 'Apple'),
    (SELECT category_id FROM main.category WHERE category_name = 'Laptops')),
  ('Dell Laptop 4', 620, (SELECT manufacture_id FROM main.manufacture WHERE manufacture_name = 'Dell'),
    (SELECT category_id FROM main.category WHERE category_name = 'Laptops')),
  ('iPad Pro', 990, (SELECT manufacture_id FROM main.manufacture WHERE manufacture_name = 'Apple'),
    (SELECT category_id FROM main.category WHERE category_name = 'Tablets')),
  ('Hp 240 G8', 740, (SELECT manufacture_id FROM main.manufacture WHERE manufacture_name = 'Hp'),
    (SELECT category_id FROM main.category WHERE category_name = 'Laptops')),
  ('Acer 5', 800,(SELECT manufacture_id FROM main.manufacture WHERE manufacture_name = 'Acer'),
    (SELECT category_id FROM main.category WHERE category_name = 'Laptops')),
  ('Galaxy Tab S7', 600,(SELECT manufacture_id FROM main.manufacture WHERE manufacture_name = 'Samsung'),
    (SELECT category_id FROM main.category WHERE category_name = 'Tablets')),
  ('Nintendo Switch', 420,(SELECT manufacture_id FROM main.manufacture WHERE manufacture_name = 'Nintendo'),
    (SELECT category_id FROM main.category WHERE category_name = 'Consoles')),
  ('Jbl Tune', 320, (SELECT manufacture_id FROM main.manufacture WHERE manufacture_name = 'Jbl'),
    (SELECT category_id FROM main.category WHERE category_name = 'Headphones'));

      -- Заполнение таблицы об изменениях цены
  INSERT INTO main.price_change (product_id, data_price_change, new_price) VALUES
  ((SELECT product_id FROM main.product WHERE product_name = 'iphone 12'), '2021-01-01', 700),
  ((SELECT product_id FROM main.product WHERE product_name = 'Galaxy S21'), '2021-02-15', 650),
  ((SELECT product_id FROM main.product WHERE product_name = 'MacBook Air'), '2021-03-10', 1200),
  ((SELECT product_id FROM main.product WHERE product_name = 'Dell Laptop 4'), '2021-04-20', 600),
  ((SELECT product_id FROM main.product WHERE product_name = 'iPad Pro'), '2021-05-05', 1000),
  ((SELECT product_id FROM main.product WHERE product_name = 'Hp 240 G8'), '2021-06-12', 760),
  ((SELECT product_id FROM main.product WHERE product_name = 'Acer 5'), '2021-07-25', 850),
  ((SELECT product_id FROM main.product WHERE product_name = 'Galaxy Tab S7'), '2021-08-18', 590),
  ((SELECT product_id FROM main.product WHERE product_name = 'Nintendo Switch'), '2021-09-01', 400),
  ((SELECT product_id FROM main.product WHERE product_name = 'Jbl Tune'), '2021-10-10', 300);  

  -- Заполнение таблицы о покупках
  INSERT INTO main.purchase (product_id, product_count, customer_id, store_id, purchase_date) VALUES
  ((SELECT product_id FROM main.product WHERE product_name = 'Iphone 12'), 1, 
   (SELECT customer_id FROM main.customer WHERE customer_name = 'Egor'), 
   (SELECT store_id FROM main.store WHERE store_name = 'BigGeek'), '2022-01-12'),
  ((SELECT product_id FROM main.product WHERE product_name = 'Galaxy S21'), 1,
   (SELECT customer_id FROM main.customer WHERE customer_name = 'Ahmet'), 
   (SELECT store_id FROM main.store WHERE store_name = 'Technopark'), '2022-04-02'),
  ((SELECT product_id FROM main.product WHERE product_name = 'MacBook Air'), 1, 
   (SELECT customer_id FROM main.customer WHERE customer_name = 'Rustam'), 
   (SELECT store_id FROM main.store WHERE store_name = 'BigGeek'), '2022-12-21'),
  ((SELECT product_id FROM main.product WHERE product_name = 'Dell Laptop 4'), 1, 
   (SELECT customer_id FROM main.customer WHERE customer_name = 'Anastasiya'), 
   (SELECT store_id FROM main.store WHERE store_name = 'Citylink'), '2022-07-11'),
  ((SELECT product_id FROM main.product WHERE product_name = 'Iphone 12'), 1, 
   (SELECT customer_id FROM main.customer WHERE customer_name = 'Rustam'), 
   (SELECT store_id FROM main.store WHERE store_name = 'BigGeek'), '2022-08-16'),
  ((SELECT product_id FROM main.product WHERE product_name = 'Acer 5'), 1,
   (SELECT customer_id FROM main.customer WHERE customer_name = 'Irina'),
   (SELECT store_id FROM main.store WHERE store_name = 'DNS'), '2022-10-09'),
  ((SELECT product_id FROM main.product WHERE product_name = 'Galaxy S21'), 1,
   (SELECT customer_id FROM main.customer WHERE customer_name = 'Mariya'),
   (SELECT store_id FROM main.store WHERE store_name = 'Eldorado'), '2022-11-06'),
  ((SELECT product_id FROM main.product WHERE product_name = 'Iphone 12'), 1,
   (SELECT customer_id FROM main.customer WHERE customer_name = 'Aidan'),
   (SELECT store_id FROM main.store WHERE store_name = 'BigGeek'), '2022-06-24'),
  ((SELECT product_id FROM main.product WHERE product_name = 'Ipad Pro'), 1, 
   (SELECT customer_id FROM main.customer WHERE customer_name = 'Ivan'),
   (SELECT store_id FROM main.store WHERE store_name = 'CityLink'), '2022-03-03'),
  ((SELECT product_id FROM main.product WHERE product_name = 'MacBook Air'), 1,
   (SELECT customer_id FROM main.customer WHERE customer_name = 'Ekaterina'),
   (SELECT store_id FROM main.store WHERE store_name = 'M.Video'), '2022-05-27');
  
  -- Заполение таблицы о поставках
  INSERT INTO main.delivery (product_id, delivery_price, store_id, delivery_date, customer_id) VALUES
  ((SELECT product_id FROM main.product WHERE product_name = ' '),
   200, (SELECT store_id FROM main.store WHERE store_name = 'BigGeek'), 
   '2022-01-16', (SELECT customer_id FROM main.customer WHERE customer_name = 'Egor')),
  ((SELECT product_id FROM main.product WHERE product_name = ' '),
   300, (SELECT store_id FROM main.store WHERE store_name = 'TechnoPark'), 
   '2022-04-06', (SELECT customer_id FROM main.customer WHERE customer_name = 'Ahmet')),
  ((SELECT product_id FROM main.product WHERE product_name = ' '),
   200, (SELECT store_id FROM main.store WHERE store_name = 'BigGeek'), 
   '2022-12-24', (SELECT customer_id FROM main.customer WHERE customer_name = 'Rustam')),
  ((SELECT product_id FROM main.product WHERE product_name = ' '),
   250, (SELECT store_id FROM main.store WHERE store_name = 'Citylink'), 
   '2022-07-14', (SELECT customer_id FROM main.customer WHERE customer_name = 'Anastasiya')),
  ((SELECT product_id FROM main.product WHERE product_name = ' '),
   350, (SELECT store_id FROM main.store WHERE store_name = 'BigGeek'), 
   '2022-08-21', (SELECT customer_id FROM main.customer WHERE customer_name = 'Rustam')),
  ((SELECT product_id FROM main.product WHERE product_name = ' '),
   300, (SELECT store_id FROM main.store WHERE store_name = 'DNS'), 
   '2022-10-14', (SELECT customer_id FROM main.customer WHERE customer_name = 'Irina')),
  ((SELECT product_id FROM main.product WHERE product_name = ' '),
   150, (SELECT store_id FROM main.store WHERE store_name = 'Eldorado'), 
   '2022-11-10', (SELECT customer_id FROM main.customer WHERE customer_name = 'Mariya')),
  ((SELECT product_id FROM main.product WHERE product_name = ' '),
   250, (SELECT store_id FROM main.store WHERE store_name = 'BigGeek'), 
   '2022-06-29', (SELECT customer_id FROM main.customer WHERE customer_name = 'Aidan')),
  ((SELECT product_id FROM main.product WHERE product_name = ' '),
   200, (SELECT store_id FROM main.store WHERE store_name = 'Citylink'), 
   '2022-03-05', (SELECT customer_id FROM main.customer WHERE customer_name = 'Ivan')),
  ((SELECT product_id FROM main.product WHERE product_name = ' '),
   300, (SELECT store_id FROM main.store WHERE store_name = 'M.Video'), 
   '2022-05-29', (SELECT customer_id FROM main.customer WHERE customer_name = 'Ekaterina'));