CREATE TABLE customer(
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
email VARCHAR(30) NOT NULL,
company VARCHAR(30) NOT NULL,
street VARCHAR(30) NOT NULL,
city VARCHAR(30) NOT NULL,
state CHAR(2) NOT NULL,
zip SMALLINT NOT NULL,
phone VARCHAR(30) NOT NULL,
birt_date DATE NULL,
sex CHAR(1) NOT NULL,
date_entered TIMESTAMP NOT NULL,
id SERIAL PRIMARY KEY);

CREATE TYPE sex_type as enum
('M','F');

ALTER TABLE customer
ALTER COLUMN sex TYPE sex_type USING sex::sex_type;


--############              another table          #############----------

CREATE TABLE sales_person(
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
email VARCHAR(60) NOT NULL,
street VARCHAR(50) NOT NULL,
city VARCHAR(40) NOT NULL,
state CHAR(2) NOT NULL DEFAULT 'PA',
zip SMALLINT NOT NULL,
phone VARCHAR(20) NOT NULL,
birt_date DATE NULL,
sex sex_type NOT NULL,
date_hired TIMESTAMP NOT NULL,
id SERIAL PRIMARY KEY);

--############              another table          #############----------

CREATE TABLE product_type(
name VARCHAR(30) NOT NULL,
id SERIAL PRIMARY KEY);

--############              another table          #############----------
drop table product cascade;
--------------------------------------------------------------------------
-- CREATE TABLE product(
-- type_id INTEGER REFERENCES product_type(id),
-- name VARCHAR(30) NOT NULL,
-- description TEXT NOT NULL,
-- id SERIAL PRIMARY KEY);

-- ALTER TABLE product ADD supplier VARCHAR(30);
-- ALTER TABLE product ALTER COLUMN supplier SET NOT NULL;
-------------------------------------------------------------------------


CREATE TABLE product(
type_id INTEGER REFERENCES product_type(id),
name VARCHAR(30) NOT NULL,
supplier VARCHAR(30) NOT NULL,
description TEXT NOT NULL,
id SERIAL PRIMARY KEY);
--############              another table          #############----------

CREATE TABLE item(
product_id INTEGER REFERENCES product(id),
size INTEGER NOT NULL,
color VARCHAR(30) NOT NULL,
picture VARCHAR(256) NOT NULL,
price NUMERIC(6,2) NOT NULL,
id SERIAL PRIMARY KEY);


--############              another table          #############----------

CREATE TABLE sales_order(
cust_id INTEGER REFERENCES customer(id),
sales_person_id INTEGER REFERENCES sales_person(id),
time_order_taken TIMESTAMP NOT NULL,
purchase_order_number INTEGER NOT NULL,
credit_card_number VARCHAR(16) NOT NULL,
credit_card_exper_month SMALLINT NOT NULL,
credit_card_exper_day SMALLINT NOT NULL,
credit_card_secret_code SMALLINT NOT NULL,
name_on_card VARCHAR(100) NOT NULL,
id SERIAL PRIMARY KEY);

--############              another table          #############----------

CREATE TABLE sales_item(
item_id INTEGER REFERENCES item(id),
sales_order_id INTEGER REFERENCES sales_order(id),
quantity INTEGER NOT NULL,
discount NUMERIC(3,5) NULL DEFAULT 0,
texable BOOLEAN NOT NULL DEFAULT FALSE,
sales_tax_rate NUMERIC(5,2) NOT NULL DEFAULT 0,
id SERIAL PRIMARY KEY);

------------------------------------------------------------------------------

ALTER TABLE sales_item ADD day_of_week VARCHAR(8);

ALTER TABLE sales_item ALTER COLUMN day_of_week SET NOT NULL;

ALTER TABLE sales_item RENAME day_of_week TO weekday;

ALTER TABLE sales_item DROP COLUMN weekday;

------------------------------------------------------------------------------

--############              another table          #############----------

CREATE TABLE transaction_type(
name VARCHAR(30) NOT NULL,
payment_type VARCHAR(30) NOT NULL,
id SERIAL PRIMARY KEY);

ALTER TABLE transaction_type RENAME TO transaction;

CREATE INDEX transaction_id ON transaction(name);

CREATE INDEX transaction_id_2 ON transaction(name, payment_type);

TRUNCATE TABLE transaction; -- it deletes all the data for eg:- a water bottle  if u drink water the bottle will be empty but still bottle exists but not water

DROP TABLE transaction;


