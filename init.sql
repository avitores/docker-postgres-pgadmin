-- create database
SELECT 'CREATE DATABASE ava_example_db' 
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'ava_example_db')\gexec

-- create entities table
CREATE TABLE IF NOT EXISTS entities (
    id VARCHAR(50) PRIMARY KEY,
    id_number VARCHAR(30),
    name VARCHAR(100),
    surname VARCHAR(100),
    address VARCHAR(150),
    post_code VARCHAR(20),
    town VARCHAR(50),
    community VARCHAR(50),
    country VARCHAR(5)
);

-- insert initial entity
INSERT INTO entities (id, id_number, name) VALUES ('200101000000000000aba000','00000000A', 'AVA');