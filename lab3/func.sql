-- Функція:
CREATE OR REPLACE FUNCTION calculate_order_total(customer_id 
INT) RETURNS DECIMAL 
LANGUAGE plpgsql AS 
$$
DECLARE
	total DECIMAL(10, 2);
BEGIN
	  SELECT COALESCE ( SUM ( total_amount ) , 0 . 00 ) INTO total FROM "Order" WHERE "Order" . customer_id = calculate_order_total . customer_id;
	RETURN total;
END;
$$; 

SELECT calculate_order_total (1);


CREATE OR REPLACE FUNCTION get_customer_info_wrapper
(customer_id INT) RETURNS TABLE(customer_name VARCHAR
, customer_email VARCHAR) 
LANGUAGE plpgsql AS 
$$
BEGIN
	RETURN QUERY
	SELECT name, email
	FROM "Customer"
	WHERE
	    "Customer".customer_id = get_customer_info_wrapper.customer_id;
END;
$$; 
SELECT * FROM get_customer_info_wrapper (1);


CREATE OR REPLACE FUNCTION update_order_date() RETURNS 
TRIGGER 
LANGUAGE plpgsql AS 
$$
BEGIN
	UPDATE "Order"
	SET
	    date = CURRENT_DATE
	WHERE
	    order_id = NEW.order_id;
	RETURN NEW;
END;
$$; 