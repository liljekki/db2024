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




BEGIN;
UPDATE "Product" SET price = 15.99 WHERE product_id = 1;
WITH
    inserted_order AS (
        INSERT INTO
            "Order" (
                customer_id, date, total_amount
            )
        VALUES (2, CURRENT_DATE, 0.00)
        RETURNING
            order_id
    )
INSERT INTO
    "Order_Product" (
        order_id, product_id, quantity
    )
VALUES (
        (
            SELECT order_id
            FROM inserted_order
        ), 1, 2
    );
COMMIT;


BEGIN;
DELETE FROM "Order_Product"
WHERE
    order_id IN (
        SELECT order_id
        FROM "Order"
        WHERE
            customer_id = 2
    );
DELETE FROM "Order" WHERE customer_id = 2;
DELETE FROM "Customer" WHERE customer_id = 2;
COMMIT;



CREATE INDEX idx_order_customer_id ON "Order" (customer_id);
CREATE INDEX idx_order_product_product_id ON "Order_Product" (product_id);

EXPLAIN SELECT * FROM "Order" WHERE customer_id = 123;

EXPLAIN ANALYZE SELECT * FROM "Order" WHERE customer_id = 123;