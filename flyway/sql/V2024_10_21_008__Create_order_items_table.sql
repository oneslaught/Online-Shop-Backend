CREATE TABLE order_items(
    id SERIAL NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT order_items_order_id_fkey FOREIGN key(order_id) REFERENCES orders(id),
    CONSTRAINT order_items_product_id_fkey FOREIGN key(product_id) REFERENCES products(id)
);
