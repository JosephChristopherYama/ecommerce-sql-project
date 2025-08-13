DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS order_payments;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS product_category_name_translation;

CREATE TABLE product_category_name_translation (
    product_category_name VARCHAR(255),
    product_category_name_english VARCHAR(255)
);

CREATE TABLE products (
    product_id VARCHAR(255) PRIMARY KEY,
    product_category_name VARCHAR(255),
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);

CREATE TABLE customers (
    customer_id VARCHAR(255) PRIMARY KEY,
    customer_unique_id VARCHAR(255),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(255),
    customer_state VARCHAR(2)
);

CREATE TABLE orders (
    order_id VARCHAR(255) PRIMARY KEY,
    customer_id VARCHAR(255) REFERENCES customers(customer_id),
    order_status VARCHAR(50),
    order_purchase_timestamp TIMESTAMP
);

CREATE TABLE order_payments (
    order_id VARCHAR(255) REFERENCES orders(order_id),
    payment_sequential INT,
    payment_type VARCHAR(50),
    payment_installments INT,
    payment_value FLOAT
);

CREATE TABLE order_items (
    order_id VARCHAR(255) REFERENCES orders(order_id),
    order_item_id INT,
    product_id VARCHAR(255) REFERENCES products(product_id),
    price FLOAT,
    freight_value FLOAT
);

COPY product_category_name_translation FROM 'C:/Users/PawaN/ecommerce-sql-project/data/product_category_name_translation.csv' DELIMITER ',' CSV HEADER;
COPY products FROM 'C:/Users/PawaN/ecommerce-sql-project/data/olist_products_dataset.csv' DELIMITER ',' CSV HEADER;
COPY customers FROM 'C:/Users/PawaN/ecommerce-sql-project/data/olist_customers_dataset.csv' DELIMITER ',' CSV HEADER;
