-- Процедура для вставки нового замовлення в "Order"
CREATE OR REPLACE PROCEDURE insert_order(
	customer_id_param INT, 
	date_param DATE, 
	total_amount_param DECIMAL(10, 2)
	) 
LANGUAGE plpgsql AS 
$$
BEGIN
	INSERT INTO
	    "Order" (
	        customer_id, date, total_amount
	    )
	VALUES (
	        customer_id_param, date_param, total_amount_param
	    );
END;
$$; 

-- Виклик першої процедури
CALL insert_order (1, '2024-03-24', 299);

-- Процедура для вставки нового продукту в "Product"
CREATE OR REPLACE PROCEDURE insert_product(
	name_param VARCHAR(255), 
	price_param DECIMAL(10, 2)
	) 
LANGUAGE plpgsql AS 
$$
BEGIN
	INSERT INTO
	    "Product" (name, price)
	VALUES (name_param, price_param);
END;
$$; 

-- Виклик другої процедури
CALL insert_product ('Cheeseburger_2', 4.99);

-- Процедура для видалення замовлення по id
CREATE OR REPLACE PROCEDURE delete_order(
	order_id_param INT) 
LANGUAGE plpgsql AS 
$$
BEGIN
	DELETE FROM "Order"
	WHERE
	    order_id = order_id_param;
END;
$$; 

-- Виклик третьої процедури 
CALL delete_order (10);


SELECT * FROM "Order";
SELECT * FROM "Product";