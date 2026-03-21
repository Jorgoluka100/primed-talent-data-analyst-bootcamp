DROP TABLE IF EXISTS product_sales;

DROP TABLE IF EXISTS product_catalog;
 
CREATE TABLE product_catalog (
    product_id          SERIAL PRIMARY KEY,
    product_name        VARCHAR(100) NOT NULL,
    product_description TEXT,
    price               NUMERIC(10,2) NOT NULL,
    category            VARCHAR(50)
);
 
CREATE TABLE product_sales (
    sale_id     SERIAL PRIMARY KEY,
    product_id  INTEGER NOT NULL REFERENCES product_catalog(product_id),
    customer_id INTEGER NOT NULL,
    sale_date   DATE NOT NULL,
    quantity    INTEGER NOT NULL DEFAULT 1
);
 
INSERT INTO product_catalog (product_name, product_description, price, category)
VALUES
    ('Laptop Pro 15',          'High-performance laptop with 16GB RAM and 512GB SSD', 1299.99, 'Electronics'),
    ('Wireless Mouse',          NULL,                                                    29.99, 'Electronics'),
    ('Office Chair',            'Ergonomic chair with lumbar support and adjustable height', 449.99, 'Furniture'),
    ('USB-C Hub',               NULL,                                                    45.00, 'Electronics'),
    ('Standing Desk',           'Electric height-adjustable desk, 60 inch wide',        699.00, 'Furniture'),
    ('Noise-Cancel Headphones', NULL,                                                   349.99, 'Electronics'),
    ('Webcam HD',               'Full HD 1080p webcam with built-in microphone',         89.99, 'Electronics'),
    ('Monitor 27 inch',         '4K UHD monitor with USB-C connectivity',               599.99, 'Electronics'),
    ('Keyboard Mechanical',     NULL,                                                   159.99, 'Electronics'),
    ('Desk Lamp LED',           'Adjustable LED desk lamp with 5 brightness levels',     54.99, 'Office Supplies');
 
INSERT INTO product_sales (product_id, customer_id, sale_date, quantity)
VALUES
    (1,  201, '2024-01-10', 1),
    (1,  202, '2024-01-12', 1),
    (2,  201, '2024-01-15', 2),
    (3,  203, '2024-01-18', 1),

    (4,  204, '2024-01-20', 3),

    (5,  205, '2024-02-01', 1),

    (5,  201, '2024-02-05', 1),

    (6,  206, '2024-02-10', 1),

    (6,  203, '2024-02-12', 1),

    (7,  207, '2024-02-15', 1),

    (8,  202, '2024-02-18', 2),

    (8,  208, '2024-02-20', 1),

    (9,  201, '2024-03-01', 1),

    (9,  209, '2024-03-05', 1),

    (10, 210, '2024-03-08', 2),

    (3,  206, '2024-03-10', 1),

    (1,  203, '2024-03-12', 1),

    (2,  204, '2024-03-15', 1),

    (7,  201, '2024-03-18', 2),

    (5,  202, '2024-03-20', 1);
 