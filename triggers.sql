--Триггер на таблицу price_change, который будет устанавливать 
--значение поля data_price_change на текущую дату при вставке новой строки.
CREATE OR REPLACE FUNCTION main.set_data_price_change()   
RETURNS TRIGGER AS $$   
BEGIN   
  NEW.data_price_change = CURRENT_DATE;   
  RETURN NEW;   
END; 
$$ LANGUAGE plpgsql;   

CREATE TRIGGER update_data_price_change   
BEFORE INSERT ON main.price_change   
FOR EACH ROW   
EXECUTE FUNCTION main.set_data_price_change();


--Триггер на таблицу purchase, который будет уменьшать значение
-- поля product_count при каждой покупке.
CREATE OR REPLACE FUNCTION main.decrease_product_count()   
RETURNS TRIGGER AS $$   
BEGIN   
  UPDATE main.product SET product_count = product_count - NEW.product_count 
  WHERE product_id = NEW.product_id;   
  RETURN NEW;   
END;
$$ LANGUAGE plpgsql;   

CREATE TRIGGER update_product_count   
AFTER INSERT ON main.purchase   
FOR EACH ROW   
EXECUTE FUNCTION main.decrease_product_count();  
