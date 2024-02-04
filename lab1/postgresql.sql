CREATE TABLE "Order" (
  "order_id" INT PRIMARY KEY,
  "customer_id" INT,
  "date" DATE,
  "total_amount" DECIMAL(10,2)
);

CREATE TABLE "Product" (
  "product_id" INT PRIMARY KEY,
  "name" VARCHAR(255),
  "price" DECIMAL(10,2)
);

CREATE TABLE "Order_Product" (
  "order_id" INT,
  "product_id" INT,
  "quantity" INT,
  PRIMARY KEY ("order_id", "product_id")
);

CREATE TABLE "Customer" (
  "customer_id" INT PRIMARY KEY,
  "name" VARCHAR(255),
  "email" VARCHAR(255),
  "phone" VARCHAR(15)
);

ALTER TABLE "Order" ADD FOREIGN KEY ("customer_id") REFERENCES "Customer" ("customer_id");

ALTER TABLE "Order_Product" ADD FOREIGN KEY ("order_id") REFERENCES "Order" ("order_id");

ALTER TABLE "Order_Product" ADD FOREIGN KEY ("product_id") REFERENCES "Product" ("product_id");
