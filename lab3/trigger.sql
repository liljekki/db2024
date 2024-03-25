-- Тригер для оновлення дати в таблиці "Order" при зміні значень в "Order_Product"
CREATE OR REPLACE FUNCTION update_order_date() 
RETURNS TRIGGER AS 
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
CREATE OR REPLACE TRIGGER update_order_date_trigger
AFTER UPDATE ON "Order_Product" 
FOR EACH ROW EXECUTE FUNCTION update_order_date ();
SELECT * FROM "Order";
SELECT * FROM "Order_Product";
UPDATE "Order_Product" 
SET quantity = 5000
WHERE order_id = 5 AND product_id = 5;


-- Тригер для виклику помилки при спробі ввести від'ємне значення ціни в таблиці "Product"
CREATE OR REPLACE FUNCTION check_product_price() 
RETURNS TRIGGER AS 
$$
BEGIN
	IF NEW.price < 0 THEN RAISE EXCEPTION 'Ціна продукту повинна бути не менше 0';
END
	IF;
	RETURN NEW;
END;
$$
LANGUAGE
plpgsql; 
CREATE OR REPLACE TRIGGER tr_check_product_price 
BEFORE INSERT ON "Product" FOR EACH ROW
EXECUTE FUNCTION check_product_price ();
INSERT INTO "Product" (name, price) VALUES ('Test Product', -10.99);


-- Аналогічний тригер, але для таблиці "Order"
CREATE OR REPLACE FUNCTION check_order_total() 
RETURNS TRIGGER AS 
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
CREATE OR REPLACE TRIGGER tr_check_order_total 
BEFORE INSERT ON "Order" 
FOR EACH ROW EXECUTE FUNCTION check_order_total ();
INSERT INTO
    "Order" (
        customer_id, date, total_amount
    )
VALUES (1, CURRENT_DATE, -10.99);

