BEGIN;

DROP TABLE IF EXISTS test CASCADE;

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    price MONEY NOT NULL DEFAULT 0,
    description TEXT DEFAULT NULL
);

CREATE TABLE sessions (
    sid TEXT UNIQUE NOT NULL PRIMARY KEY,
    cart_id INTEGER REFERENCES carts(id) ON DELETE CASCADE
);

CREATE TABLE carts (
    id SERIAL PRIMARY KEY
);

CREATE TABLE cart_products (
    cart_id INTEGER REFERENCES carts(id),
    product_id INTEGER REFERENCES products(id)
);

INSERT INTO products (name, price, description) VALUES
    ('Doohickey'),
    ('Thingummybob'),
    ('Widget'),
    ('Whatsit');

COMMIT;