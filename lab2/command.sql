-- Приклад 1
SELECT "Customer".name, "Order".date
FROM "Customer"
JOIN "Order" ON "Customer".customer_id = "Order".customer_id;
-- Отримайти імена клієнтів і відповідні дати їх замовлень.

-- Приклад 2
SELECT name, price FROM "Product";
-- Показати назви та ціни продуктів.

-- Приклад 3
SELECT * FROM "Customer" WHERE email = 'alice@example.com';
-- Знайти клієнта за електронною поштою.

-- Приклад 4
INSERT INTO
    "Order" (
        customer_id, date, total_amount
    )
VALUES (1, '2024-02-18', 25.99);
-- Додати нове замовлення.

-- Приклад 5
UPDATE "Product" SET price = 9.99 WHERE name = 'Big Mac';
-- Оновити ціну на продукт.

-- Приклад 6
DELETE FROM "Customer" WHERE customer_id = 3;
-- Видалити клієнта.

-- Приклад 7
SELECT * FROM "Order" WHERE date > '2024-02-01';
-- Показати замовлення після певної дати.

-- Приклад 8
SELECT COUNT(*) FROM "Product";
-- Підрахувати кількість продуктів.

-- Приклад 9
INSERT INTO
    "Customer" (name, email, phone)
VALUES (
        'John Doe', 'john.doe@example.com', '123-456-7890'
    );
-- Додати нового клієнта.

-- Приклад 10
SELECT MAX(total_amount) FROM "Order";
-- Показати максимальну суму замовлення.

-- Приклад 11
UPDATE "Order_Product"
SET
    quantity = 2
WHERE
    order_id = 1
    AND product_id = 5;
-- Оновити кількість товарів у замовленні.

-- Приклад 12
SELECT "Order".order_id, "Order".date, "Order".total_amount, "Customer".name
FROM "Order"
JOIN "Customer" ON "Order".customer_id = "Customer".customer_id;
-- Отримати деталі кожного замовлення разом із загальною сумою:

-- Приклад 13
SELECT AVG(total_amount) FROM "Order";
-- Показати середню суму замовлення.

-- Приклад 14
SELECT * FROM "Order_Product" ORDER BY quantity DESC;
-- Показати замовлення за кількістю товарів у спадаючому порядку.

-- Приклад 15
INSERT INTO "Product" (name, price) VALUES ('French Fries', 3.49);
-- Додати новий продукт.

-- Приклад 16
SELECT * FROM "Customer" ORDER BY name;
-- Показати клієнтів у впорядкованому за ім'ям порядку.

-- Приклад 17
UPDATE "Customer" SET phone = '987-654-3210' WHERE customer_id = 2;
-- Оновити номер телефону клієнта.

-- Приклад 18
DELETE FROM "Order_Product" WHERE order_id = 4 AND product_id = 7;
-- Видалити товар з конкретного замовлення.

-- Приклад 19
SELECT MIN(total_amount) FROM "Order";
-- Показати мінімальну суму замовлення.

-- Приклад 20
SELECT * FROM "Order" WHERE customer_id = 5;
-- Показати замовлення конкретного клієнта.

-- Приклад 21
INSERT INTO
    "Order_Product" (
        order_id, product_id, quantity
    )
VALUES (3, 6, 1);
-- Додати товар до замовлення.

-- Приклад 22
SELECT DISTINCT email FROM "Customer";
-- Показати унікальні електронні адреси клієнтів.

-- Приклад 23
UPDATE "Product" SET name = 'McChicken' WHERE product_id = 2;
-- Оновити назву продукту.

-- Приклад 24
DELETE FROM "Order" WHERE date < '2024-02-01';
-- Видалити замовлення до певної дати.

-- Приклад 25
SELECT * FROM "Order_Product" WHERE product_id = 10;
-- Показати замовлення для конкретного продукту.

-- Приклад 26
INSERT INTO
    "Customer" (name, email, phone)
VALUES (
        'Jane Smith', 'jane.smith@example.com', '555-1234'
    );
-- Додати нового клієнта.

-- Приклад 27
SELECT SUM(total_amount) FROM "Order";
-- Показати сумарну суму всіх замовлень.

-- Приклад 28
SELECT * FROM "Product" WHERE price BETWEEN 5.00 AND 10.00;
-- Показати продукти у заданому ціновому діапазоні.

-- Приклад 29
UPDATE "Order_Product"
SET
    quantity = quantity + 1
WHERE
    order_id = 2;
-- Збільшити кількість товарів у замовленні.

-- Приклад 30
DELETE FROM "Product" WHERE name = 'Salad' AND price > 4.99;
-- Видалити продукт за певними критеріями.

-- Приклад 31
SELECT * FROM "Order" WHERE total_amount > 50.00;
-- Показати замовлення з великою сумою.

-- Приклад 32
INSERT INTO "Product" (name, price) VALUES ('Apple Pie', 2.99);
-- Додати новий продукт.

-- Приклад 33
SELECT AVG(price) FROM "Product";
-- Показати середню ціну продуктів.

-- Приклад 34
SELECT * FROM "Order_Product" WHERE order_id = 5 AND quantity > 3;
-- Показати товари у великій кількості у конкретному замовленні.

-- Приклад 35
UPDATE "Customer"
SET
    email = 'new.email@example.com'
WHERE
    customer_id = 1;
-- Оновити електронну адресу клієнта.

-- Приклад 36
DELETE FROM "Order_Product" WHERE product_id = 8 AND order_id = 6;
-- Видалити товар з конкретного замовлення.

-- Приклад 37
SELECT * FROM "Customer" WHERE phone LIKE '555%';
-- Показати клієнтів за певним номером телефону.

-- Приклад 38
INSERT INTO
    "Order" (
        customer_id, date, total_amount
    )
VALUES (4, '2024-02-18', 15.50);
-- Додати нове замовлення.

-- Приклад 39
SELECT MIN(price), MAX(price) FROM "Product";
-- Показати мінімальну та максимальну ціну продуктів.

-- Приклад 40
SELECT * FROM "Order" WHERE customer_id IS NULL;
-- Показати замовлення без клієнта.

-- Приклад 41
UPDATE "Product" SET price = price * 1.1;
-- Збільшити ціни на всі продукти на 10%.

-- Приклад 42
DELETE FROM "Customer" WHERE name = 'John Doe';
-- Видалити клієнта за ім'ям.

-- Приклад 43
SELECT * FROM "Product" ORDER BY price;
-- Показати продукти у впорядкованому за ціною порядку.

-- Приклад 44
INSERT INTO
    "Order_Product" (
        order_id, product_id, quantity
    )
VALUES (2, 4, 3);
-- Додати товар до замовлення.

-- Приклад 45
SELECT COUNT(DISTINCT customer_id) FROM "Order";
-- Підрахувати кількість унікальних клієнтів.

-- Приклад 46
SELECT *
FROM "Order_Product"
WHERE
    order_id = 3
ORDER BY quantity DESC;
-- Показати замовлення за кількістю товарів у спадаючому порядку для конкретного замовлення.

-- Приклад 47
UPDATE "Order"
SET
    total_amount = total_amount * 0.9
WHERE
    date < '2024-02-10';
-- Зменшити суму замовлення на 10% для замовлень до певної дати.

-- Приклад 48
DELETE FROM "Order_Product" WHERE order_id = 1;
-- Видалити всі товари з конкретного замовлення.

-- Приклад 49
SELECT *
FROM "Order"
WHERE
    total_amount = (
        SELECT MAX(total_amount)
        FROM "Order"
    );
-- Показати замовлення з максимальною сумою.

-- Приклад 50
INSERT INTO "Product" (name, price) VALUES ('Smoothie', 4.99);
-- Додати новий продукт.

-- Приклад 51
SELECT * FROM "Order_Product" WHERE product_id = 12 AND quantity > 0;
-- Показати замовлення для конкретного продукту з кількістю товарів більше 0.

-- Приклад 52
UPDATE "Customer" SET name = 'New Name' WHERE customer_id = 6;
-- Оновити ім'я клієнта.

-- Приклад 53
DELETE FROM "Product" WHERE name LIKE '%Burger%';
-- Видалити продукти з назвою, що містить "Burger".

-- Приклад 54
SELECT * FROM "Order" WHERE date = '2024-02-07';
-- Показати замовлення на певну дату.

-- Приклад 55
INSERT INTO
    "Order_Product" (
        order_id, product_id, quantity
    )
VALUES (5, 8, 2);
-- Додати товар до замовлення.

-- Приклад 56
SELECT * FROM "Customer" WHERE email LIKE '%example.com%';
-- Показати клієнтів з електронною адресою, що містить "example.com".

-- Приклад 57
UPDATE "Order_Product"
SET
    quantity = quantity - 1
WHERE
    order_id = 3;
-- Зменшити кількість товарів у замовленні.

-- Приклад 58
DELETE FROM "Order" WHERE total_amount < 10.00;
-- Видалити замовлення з низькою сумою.

-- Приклад 59
SELECT *
FROM "Product"
WHERE
    price = (
        SELECT MIN(price)
        FROM "Product"
    );
-- Показати продукт з мінімальною ціною.

-- Приклад 60
INSERT INTO
    "Order" (
        customer_id, date, total_amount
    )
VALUES (2, '2024-02-18', 30.00);
-- Додати нове замовлення.

-- Приклад 61
SELECT * FROM "Order_Product" WHERE product_id = 6 AND quantity >= 5;
-- Показати замовлення для конкретного продукту з кількістю товарів 5 або більше.

-- Приклад 62
UPDATE "Product" SET price = price * 0.8 WHERE price > 5.00;
-- Зменшити ціни на продукти, які коштують більше 5.00.

-- Приклад 63
DELETE FROM "Customer" WHERE phone IS NULL;
-- Видалити клієнтів без номера телефону.

-- Приклад 64
SELECT *
FROM "Order_Product"
WHERE
    quantity = (
        SELECT MAX(quantity)
        FROM "Order_Product"
    );
-- Показати замовлення з максимальною кількістю товарів.

-- Приклад 65
INSERT INTO "Product" (name, price) VALUES ('Milkshake', 3.50);
-- Додати новий продукт.

-- Приклад 66
SELECT *
FROM "Order"
WHERE
    date BETWEEN '2024-02-05' AND '2024-02-10';
-- Показати замовлення у певному періоді.

-- Приклад 67
UPDATE "Order_Product"
SET
    quantity = quantity * 2
WHERE
    order_id = 4;
-- Збільшити кількість товарів у замовленні.

-- Приклад 68
DELETE FROM "Order_Product" WHERE quantity = 0;
-- Видалити товари з кількістю 0.

-- Приклад 69
SELECT * FROM "Product" WHERE name ILIKE 'chicken%';
-- Показати продукти з назвою, що починається на "chicken".

-- Приклад 70
INSERT INTO
    "Customer" (name, email, phone)
VALUES (
        'Bob Johnson', 'bob.johnson@example.com', '555-5678'
    );
-- Додати нового клієнта.

-- Приклад 71
SELECT * FROM "Order_Product" WHERE order_id = 2 AND product_id = 3;
-- Показати конкретний товар у замовленні.

-- Приклад 72
UPDATE "Customer"
SET
    email = 'john.doe@gmail.com'
WHERE
    name = 'John Doe';
-- Оновити електронну адресу клієнта за ім'ям.

-- Приклад 73
DELETE FROM "Order" WHERE customer_id = 8;
-- Видалити всі замовлення конкретного клієнта.

-- Приклад 74
SELECT * FROM "Product" WHERE price = ANY (ARRAY[4.99, 9.99, 14.99]);
-- Показати продукти за конкретними цінами.

-- Приклад 75
INSERT INTO
    "Order_Product" (
        order_id, product_id, quantity
    )
VALUES (6, 7, 4);
-- Додати товар до замовлення.

-- Приклад 76
SELECT *
FROM "Order"
WHERE
    total_amount > (
        SELECT AVG(total_amount)
        FROM "Order"
    );
-- Показати замовлення з вищою сумою, ніж середня сума замовлень.

-- Приклад 77
UPDATE "Product" SET price = price * 1.05;
-- Збільшити ціни на всі продукти на 5%.

-- Приклад 78
DELETE FROM "Order_Product" WHERE product_id = 11 AND order_id = 5;
-- Видалити товар з конкретного замовлення.

-- Приклад 79
SELECT * FROM "Customer" WHERE name LIKE 'A%';
-- Показати клієнтів з іменем, що починається на "A".

-- Приклад 80
INSERT INTO "Product" (name, price) VALUES ('Iced Coffee', 2.49);
-- Додати новий продукт.

-- Приклад 81
SELECT * FROM "Order_Product" WHERE quantity = 1 AND product_id = 9;
-- Показати замовлення з одиничною кількістю конкретного товару.

-- Приклад 82
UPDATE "Order"
SET
    total_amount = total_amount * 1.2
WHERE
    date > '2024-02-15';
-- Збільшити суму замовлення на 20% для замовлень після певної дати.

-- Приклад 83
DELETE FROM "Product"
WHERE
    price = (
        SELECT MIN(price)
        FROM "Product"
    );
-- Видалити продукт з мінімальною ціною.

-- Приклад 84
SELECT * FROM "Customer" WHERE customer_id IN (2, 5, 7);
-- Показати конкретних клієнтів за ідентифікаторами.

-- Приклад 85
INSERT INTO
    "Order_Product" (
        order_id, product_id, quantity
    )
VALUES (7, 10, 2);
-- Додати товар до замовлення.

-- Приклад 86
SELECT * FROM "Product" WHERE name NOT LIKE '%Coke%';
-- Показати продукти, які не містять "Coke" в назві.

-- Приклад 87
UPDATE "Order_Product"
SET
    quantity = quantity - 2
WHERE
    order_id = 1;
-- Зменшити кількість товарів у замовленні.

-- Приклад 88
DELETE FROM "Customer" WHERE email = 'jane.smith@example.com';
-- Видалити клієнта за електронною адресою.

-- Приклад 89
SELECT *
FROM "Order"
WHERE
    customer_id = (
        SELECT customer_id
        FROM "Customer"
        WHERE
            name = 'Bob Johnson'
    );
-- Показати замовлення конкретного клієнта за ім'ям.

-- Приклад 90
INSERT INTO "Product" (name, price) VALUES ('Tea', 1.99);
-- Додати новий продукт.

-- Приклад 91
SELECT * FROM "Order_Product" WHERE order_id = 6 AND quantity >= 3;
-- Показати замовлення для конкретного замовлення з кількістю товарів 3 або більше.

-- Приклад 92
UPDATE "Product" SET price = price * 1.15 WHERE price < 3.00;
-- Збільшити ціни на продукти, які коштують менше 3.00.

-- Приклад 93
DELETE FROM "Order_Product" WHERE product_id = 5 AND order_id = 3;
-- Видалити товар з конкретного замовлення.

-- Приклад 94
SELECT * FROM "Customer" WHERE phone IS NOT NULL;
-- Показати клієнтів з номером телефону.

-- Приклад 95
INSERT INTO
    "Order" (
        customer_id, date, total_amount
    )
VALUES (3, '2024-02-18', 20.00);
-- Додати нове замовлення.

-- Приклад 96
SELECT * FROM "Product" WHERE price = ANY (ARRAY[1.99, 3.99, 5.99]);
-- Показати продукти за конкретними цінами.

-- Приклад 97
UPDATE "Customer" SET name = 'Bob Doe' WHERE name = 'Bob Johnson';
-- Оновити ім'я клієнта за ім'ям.

-- Приклад 98
SELECT "Customer".name, "Product".name as product_name, "Order_Product".quantity
FROM "Customer"
JOIN "Order" ON "Customer".customer_id = "Order".customer_id
JOIN "Order_Product" ON "Order".order_id = "Order_Product".order_id
JOIN "Product" ON "Order_Product".product_id = "Product".product_id;
-- Вивід назв та кількость з використанням JOIN

-- Приклад 99
SELECT *
FROM "Order_Product"
WHERE
    quantity < (
        SELECT AVG(quantity)
        FROM "Order_Product"
    );
-- Показати замовлення з кількістю товарів менше, ніж середня кількість.

-- Приклад 100
INSERT INTO
    "Order_Product" (
        order_id, product_id, quantity
    )
VALUES (8, 12, 1);
-- Додати товар до замовлення.


SELECT SUM(total_amount) as total
FROM "Order"
WHERE customer_id = 1
AND "date" BETWEEN '2024-02-19' AND '2024-02-04';

SELECT * FROM "Order"



SELECT SUM(total_amount) as total
FROM "Order"
WHERE customer_id = 1
AND "date" BETWEEN '2024-02-04' AND '2024-02-19';






--------------------------------------------------------


SELECT customer_id, SUM(total_amount) as total_spent
FROM "Order"
GROUP BY customer_id;
-- Загальна сума замовлень для кожного клієнта:

SELECT customer_id, AVG(total_amount) as avg_order
FROM "Order"
GROUP BY
    customer_id
HAVING
    AVG(total_amount) > 20;
-- Середній чек для кожного клієнта, який витратив більше 20 : 


SELECT customer_id, COUNT(DISTINCT order_id) as order_count
FROM "Order"
GROUP BY
    customer_id
HAVING
    COUNT(DISTINCT order_id) > 1;
-- Кількість клієнтів, які здійснили більше одного замовлення:


