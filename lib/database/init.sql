BEGIN;

DROP TABLE IF EXISTS test CASCADE;

CREATE TABLE test (
    id SERIAL PRIMARY KEY,
    text TEXT UNUE NOT NULL,
);

INSERT INTO users (text) VALUES
    ('Hello world'),
    ('Just testing'),
    ('3/4'),
    ('Last one');

COMMIT;