CREATE TABLE products(
    id SERIAL NOT NULL,
    name varchar(255) NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    discount numeric(5,2),
    stock integer NOT NULL,
    image_url varchar(255),
    category_id integer,
    PRIMARY KEY(id),
    CONSTRAINT products_category_id_fkey FOREIGN key(category_id) REFERENCES categories(id)
);
