CREATE INDEX idx_order_customer_id ON "Order" (customer_id);
CREATE INDEX idx_order_product_product_id ON "Order_Product" (product_id);

EXPLAIN ANALYZE SELECT * FROM "Order" WHERE customer_id = 123;