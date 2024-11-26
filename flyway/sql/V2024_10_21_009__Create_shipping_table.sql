CREATE TABLE shipping(
    id SERIAL NOT NULL,
    order_id integer,
    shipping_address text NOT NULL,
    shipping_city varchar(100),
    shipping_country varchar(100),
    shipping_zip varchar(20),
    shipping_status varchar(50) NOT NULL,
    tracking_number varchar(100),
    PRIMARY KEY(id),
    CONSTRAINT shipping_order_id_fkey FOREIGN key(order_id) REFERENCES orders(id)
);
