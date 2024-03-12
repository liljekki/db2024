CREATE OR REPLACE PROCEDURE p_insert_order(customer_id_param 
INT, date_param DATE, total_amount_param DECIMAL(10, 2
)) 
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
CALL p_insert_order (1, '2024-03-11', 25.99);


CREATE OR REPLACE PROCEDURE p_insert_product(name_param 
VARCHAR(255), price_param DECIMAL(10, 2)) 
LANGUAGE plpgsql AS 
$$
BEGIN
	INSERT INTO
	    "Product" (name, price)
	VALUES (name_param, price_param);
END;
$$; 
CALL p_insert_product ('Cheeseburger', 4.99);


CREATE OR REPLACE PROCEDURE p_delete_order_by_id(order_id_param 
INT) 
LANGUAGE plpgsql AS 
$$
BEGIN
	DELETE FROM "Order" WHERE order_id = order_id_param;
END;
$$; 
CALL p_delete_order_by_id (1);

