-- Тригер:
CREATE TRIGGER update_order_date_trigger
AFTER INSERT
OR
UPDATE ON "Order_Product" FOR EACH ROW
EXECUTE FUNCTION update_order_date ();
SELECT * FROM "Order_Product";


CREATE OR REPLACE FUNCTION check_product_price() RETURNS TRIGGER
AS $$
BEGIN
	IF NEW.price < 0 THEN RAISE EXCEPTION 'Ціна продукту повинна бути не менше 0';
END
	IF;
	RETURN NEW;
END;
$$
LANGUAGE
plpgsql; 
CREATE TRIGGER tr_check_product_price BEFORE INSERT ON "Product" FOR EACH ROW
EXECUTE FUNCTION check_product_price ();
INSERT INTO "Product" (name, price) VALUES ('Test Product', -10.99);



CREATE OR REPLACE FUNCTION check_order_total() RETURNS 
TRIGGER AS 
$$
BEGIN
	IF NEW.total_amount < 0 THEN RAISE EXCEPTION 'Загальна сума замовлення повинна бути не менше 0';
END
	IF;
	RETURN NEW;
END;
$$
LANGUAGE
plpgsql; 
CREATE TRIGGER tr_check_order_total BEFORE INSERT ON "Order" FOR EACH ROW
EXECUTE FUNCTION check_order_total ();
INSERT INTO
    "Order" (
        customer_id, date, total_amount
    )
VALUES (1, CURRENT_DATE, -10.99);