BEGIN;

DROP TABLE IF EXISTS test CASCADE;

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    price MONEY NOT NULL DEFAULT 0,
    description TEXT DEFAULT NULL
);

CREATE TABLE carts (
    id TEXT UNIQUE NOT NULL PRIMARY KEY
);

CREATE TABLE cart_products (
    cart_id TEXT REFERENCES carts(id) ON DELETE CASCADE,
    product_id INTEGER REFERENCES products(id)
);

INSERT INTO products (name, price, description) VALUES
    ('Doohickey', '5', 'The essential doohickey, reimagined for 2022.'),
    ('Thingummybob', '1', 'No person is complete without one.'),
    ('Widget', '99', 'Get yours today.'),
    ('Whatsit', '10', 'Not to be confused with the orange snack.');

COMMIT;