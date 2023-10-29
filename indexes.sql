CREATE INDEX IF NOT EXISTS product_index on main.product(product_id);
CREATE INDEX IF NOT EXISTS purchase_index on main.purchase(purchase_id);

/*Индексы - это специальные объекты базы данных, предназначенные в основном для ускорения доступа к данным.
Я индексировал product_id и purchase_id, так как у нас большой обЪем данных в таблицах товара и покупок,
что важно для ускорения доступа к данным. Так как это вспомогательные структуры, то любой индекс можно
удалить и восстановить заново по информации в таблице.
*/