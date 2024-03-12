-- Процедура:
CREATE OR REPLACE PROCEDURE p_insert_order(customer_id_param 
INT, date_param DATE, total_amount_param DECIMAL(10, 2)) 
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
SELECT * FROM "Order"

-- Функція:
CREATE OR REPLACE FUNCTION calculate_order_total(customer_id INT)
RETURNS DECIMAL
LANGUAGE plpgsql
AS $$
DECLARE
    total DECIMAL(10, 2);
BEGIN
    SELECT COALESCE(SUM(total_amount), 0.00) INTO total
    FROM "Order"
    WHERE "Order".customer_id = calculate_order_total.customer_id;

    RETURN total;
END;
$$;
SELECT calculate_order_total (1);


-- Тригер:
CREATE OR REPLACE FUNCTION update_order_date() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$
BEGIN
	UPDATE "Order"
	SET
	    date = CURRENT_DATE
	WHERE
	    order_id = NEW.order_id;
	RETURN NEW;
END;
$$; 

CREATE TRIGGER update_order_date_trigger
AFTER INSERT OR UPDATE ON "Order_Product" 
FOR EACH ROW EXECUTE FUNCTION update_order_date ();

SELECT * FROM "Order_Product";

UPDATE "Order_Product"
SET
    quantity = 333
WHERE
    order_id = 3
AND 
    product_id = 3;
SELECT * FROM "Order";

-- Транзакція:
BEGIN;
WITH
    inserted_customer AS (
        INSERT INTO
            "Customer" (name, email, phone)
        VALUES (
                'John Doe', 'john@example.com', '123-456-7890'
            )
        RETURNING
            customer_id
    )
INSERT INTO
    "Order" (
        customer_id, date, total_amount
    )
SELECT customer_id, CURRENT_DATE, 50.00
FROM inserted_customer;

COMMIT;

SELECT * FROM "Customer"

SELECT * FROM "Order"
