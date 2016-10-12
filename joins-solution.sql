-- 1. Get all customers and their addresses.
SELECT * FROM customers
JOIN addresses ON addresses.customer_id = customers.id;
 --OR

SELECT * FROM customers, addresses
WHERE address.customer_id = customers.id;

-- 2. Get all orders and their line items.
SELECT * FROM orders
JOIN line_items ON line_items.order_id = orders.id;

-- 3. Which warehouses have cheetos?
SELECT * FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
JOIN products ON products.id = warehouse_product.product_id
WHERE product_id = '5';

-- 4. Which warehouses have diet pepsi?
SELECT * FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
JOIN products ON products.id = warehouse_product.product_id
WHERE description = 'diet pepsi';

-- OR if you just want warehouse name

SELECT warehouse FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
JOIN products ON products.id = warehouse_product.product_id
WHERE description = 'diet pepsi';


-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT first_name, last_name, COUNT(orders) FROM customers
JOIN addresses ON addresses.customer_id = customers.id
JOIN orders ON orders.address_id = addresses.id
GROUP BY customers.first_name, customers.last_name;


-- 6. How many customers do we have?
SELECT COUNT(customers) FROM customers;


-- 7. How many products do we carry?
SELECT COUNT(products) FROM products;


-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM(on_hand) FROM warehouse_product
JOIN products ON products.id = warehouse_product.product_id
WHERE product_id = 6;

--OR

SELECT SUM(on_hand) FROM warehouse_product
JOIN products ON products.id = warehouse_product.product_id
WHERE description = 'diet pepsi';
