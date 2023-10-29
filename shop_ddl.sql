CREATE SCHEMA main;

  -- Информация о производителях
  CREATE TABLE main.manufacture (
    manufacture_id SERIAL PRIMARY KEY,  
    manufacture_name VARCHAR(50) NOT NULL
  ); 

  -- Информация о категориях товара
  CREATE TABLE main.category (
    category_id SERIAL PRIMARY KEY,  
    category_name VARCHAR(100) NOT NULL
  );

  -- Информация о покупателе
  CREATE TABLE main.customer (
    customer_id SERIAL PRIMARY KEY, 
    customer_name VARCHAR(50) NOT NULL,  
    delivery_count INTEGER DEFAULT 1
  );

  -- Информация о филиалах
  CREATE TABLE main.store (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL
  );

  -- Информация о товарах
  CREATE TABLE main.product (
    product_id SERIAL PRIMARY KEY,  
    product_name VARCHAR(100) NOT NULL,
	product_price INTEGER NOT NULL,
    manufacture_id INTEGER REFERENCES main.manufacture(manufacture_id),
	category_id INTEGER REFERENCES main.category(category_id)
  );
  
   -- Информация об изменениях цены
  CREATE TABLE main.price_change (
    product_id INTEGER REFERENCES main.product(product_id),
    data_price_change DATE NOT NULL,
    new_price INTEGER NOT NULL  
  );

  -- Информация о покупках
  CREATE TABLE main.purchase (    
    purchase_id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES main.product(product_id),  
    product_count INTEGER NOT NULL,
    customer_id INTEGER REFERENCES main.customer(customer_id),  
    store_id INTEGER REFERENCES main.store(store_id),
    purchase_date DATE NOT NULL 
  );

  -- Информация о поставках
  CREATE TABLE main.delivery (
	product_id INTEGER REFERENCES main.product,
    delivery_price INTEGER NOT NULL,
    store_id INTEGER REFERENCES main.store(store_id),
    delivery_date DATE NOT NULL,
    customer_id INTEGER REFERENCES main.customer(customer_id)
  );