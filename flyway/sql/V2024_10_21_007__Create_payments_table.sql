CREATE TABLE payments(
    id SERIAL NOT NULL,
    order_id integer,
    payment_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    amount numeric(10,2) NOT NULL,
    payment_method varchar(50) NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT payments_order_id_fkey FOREIGN key(order_id) REFERENCES orders(id)
);
