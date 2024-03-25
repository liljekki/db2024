-- Функція для розрахунку загальної суми замовлення по айді
CREATE OR REPLACE FUNCTION calculate_order(customer_id INT) 
RETURNS DECIMAL 
LANGUAGE plpgsql AS 
$$
DECLARE
	total DECIMAL(10, 2);
BEGIN
	SELECT SUM(total_amount) INTO total FROM "Order" WHERE "Order".customer_id = calculate_order.customer_id;
	RETURN total;
END;
$$; 
SELECT calculate_order (1);
SELECT * FROM "Order"

-- Функція для отримання інформації про ім'я та пошту по айді
CREATE OR REPLACE FUNCTION get_info(customer_id INT) 
RETURNS TABLE(customer_name VARCHAR, customer_email VARCHAR) 
LANGUAGE plpgsql AS 
$$
BEGIN
	RETURN QUERY
	SELECT name, email
	FROM "Customer"
	WHERE
		"Customer".customer_id = get_info.customer_id;
END;
$$; 
SELECT * FROM get_info (1);


-- Функція для отримання всій інформації по айді
CREATE OR REPLACE FUNCTION get_details(order_id_param INT)
RETURNS TABLE(
	order_id INT, 
	customer_id INT, 
	date DATE, 
	total_amount DECIMAL(10, 2), 
	product_name VARCHAR(255), 
	product_price DECIMAL(10, 2), 
	quantity INT) 
LANGUAGE plpgsql AS 
$$
BEGIN
	RETURN QUERY
	SELECT
		o.order_id,
		o.customer_id,
		o.date,
		o.total_amount,
		p.name AS product_name,
		p.price AS product_price,
		op.quantity
	FROM
		"Order" o
		JOIN "Order_Product" op ON o.order_id = op.order_id
		JOIN "Product" p ON op.product_id = p.product_id
	WHERE
		o.order_id = order_id_param;
END;
$$; 

SELECT * FROM get_details(2);
