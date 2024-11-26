CREATE TABLE orders(
    id SERIAL NOT NULL,
    customer_id integer,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status varchar(50) NOT NULL,
    total_price numeric(10,2) NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT orders_customer_id_fkey FOREIGN key(customer_id) REFERENCES customers(id)
);
