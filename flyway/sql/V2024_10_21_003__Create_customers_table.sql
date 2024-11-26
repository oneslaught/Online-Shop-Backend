CREATE TABLE customers(
    id SERIAL NOT NULL,
    first_name varchar(100) NOT NULL,
    last_name varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    phone varchar(20),
    address text,
    city varchar(100),
    country varchar(100),
    zip_code varchar(20),
    PRIMARY KEY(id)
);
