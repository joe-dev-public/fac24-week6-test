BEGIN;

DROP TABLE IF EXISTS products, carts, cart_products CASCADE;

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    -- Sadly this doesn't work for some reason:
    -- price MONEY NOT NULL DEFAULT 0 CHECK (price >= 0),
    price MONEY NOT NULL DEFAULT 0,
    description TEXT DEFAULT NULL
);

-- Like a session (unique, unguessable id)
CREATE TABLE carts (
    id TEXT UNIQUE NOT NULL PRIMARY KEY
);

-- One cart to many products
CREATE TABLE cart_products (
    cart_id TEXT REFERENCES carts(id) ON DELETE CASCADE,
    -- For a given cart_id, product_id should be unique. Can we constrain easily in schema?
    product_id INTEGER REFERENCES products(id),
    quantity INTEGER NOT NULL DEFAULT 1 CHECK (quantity > 0)
);

INSERT INTO products (name, price, description) VALUES
    ('Doohickey', 5, 'The essential doohickey, reimagined for 2022.'),
    ('Thingummybob', 1, 'No person is complete without one.'),
    ('Widget', 99, 'Get yours today.');

-- Test the default price
INSERT INTO products (name, description) VALUES
    ('Whatsit', 'Not to be confused with the orange snack.');

INSERT INTO carts (id) VALUES
    ('auniquecartid1'),
    ('auniquecartid2');

-- Test default quantity
INSERT INTO cart_products (cart_id, product_id) VALUES
    ('auniquecartid1', 1),
    ('auniquecartid1', 4),
    ('auniquecartid2', 3);

-- Specify quantity
INSERT INTO cart_products (cart_id, product_id, quantity) VALUES
    ('auniquecartid1', 2, 3),
    ('auniquecartid2', 4, 42),
    ('auniquecartid2', 1, 1);

COMMIT;