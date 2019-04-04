DROP TYPE IF EXISTS package_status CASCADE;

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS category CASCADE;
DROP TABLE IF EXISTS color CASCADE;
DROP TABLE IF EXISTS size CASCADE;
DROP TABLE IF EXISTS product CASCADE;
DROP TABLE IF EXISTS photo CASCADE;
DROP TABLE IF EXISTS product_color CASCADE;
DROP TABLE IF EXISTS product_size CASCADE;
DROP TABLE IF EXISTS city CASCADE;
DROP TABLE IF EXISTS delivery_info CASCADE;
DROP TABLE IF EXISTS purchase CASCADE;
DROP TABLE IF EXISTS product_purchase CASCADE;
DROP TABLE IF EXISTS review CASCADE;
DROP TABLE IF EXISTS cart CASCADE;
DROP TABLE IF EXISTS wishlist CASCADE;
DROP TABLE IF EXISTS faq CASCADE;
DROP TABLE IF EXISTS poll CASCADE;
DROP TABLE IF EXISTS submission CASCADE;
DROP TABLE IF EXISTS user_sub_vote CASCADE;

CREATE TYPE package_status AS ENUM ('awaiting_payment', 'processing', 'in_transit', 'delivered', 'canceled');

CREATE TABLE users
(
    id_user SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    email TEXT UNIQUE NOT NULL,
    pw TEXT NOT NULL,
    birth_date DATE NOT NULL,
    active BOOLEAN NOT NULL, 
    stock_manager BOOLEAN NOT NULL,
    moderator BOOLEAN NOT NULL,
    submission_manager BOOLEAN NOT NULL
);

CREATE TABLE category
(
    id_category SERIAL PRIMARY KEY,
    category TEXT UNIQUE NOT NULL
);

CREATE TABLE product
(
    id_product SERIAL PRIMARY KEY,
    product_name TEXT NOT NULL,
    product_description TEXT NOT NULL,
    price FLOAT NOT NULL CHECK(price > 0),
    stock INTEGER NOT NULL CHECK(stock >= 0),
    rating FLOAT NOT NULL CHECK(rating >= 0 AND rating <= 5),
    id_category INTEGER NOT NULL REFERENCES category ON UPDATE CASCADE
);

CREATE TABLE color
(
    id_color SERIAL PRIMARY KEY,
    color TEXT UNIQUE NOT NULL
);

CREATE TABLE size
(
    id_size SERIAL PRIMARY KEY,
    size TEXT UNIQUE NOT NULL
);

CREATE TABLE photo 
(
    id_photo SERIAL PRIMARY KEY,
    image_path TEXT UNIQUE NOT NULL,
    id_product INTEGER NOT NULL REFERENCES product ON UPDATE CASCADE
);

CREATE TABLE product_color
(
    id_product INTEGER NOT NULL REFERENCES product ON UPDATE CASCADE ON DELETE CASCADE,
    id_color INTEGER NOT NULL REFERENCES color ON UPDATE CASCADE,
    PRIMARY KEY (id_product, id_color) 
);

CREATE TABLE product_size
(
    id_product INTEGER NOT NULL REFERENCES product ON UPDATE CASCADE ON DELETE CASCADE,
    id_size INTEGER NOT NULL REFERENCES size ON UPDATE CASCADE,
    PRIMARY KEY (id_product, id_size)
);

CREATE TABLE city
(
    id_city SERIAL PRIMARY KEY,
    city TEXT NOT NULL
);

CREATE TABLE delivery_info
(
    id_delivery_info SERIAL PRIMARY KEY,
    id_city INTEGER NOT NULL REFERENCES city ON UPDATE CASCADE,
    contact TEXT NOT NULL,
    delivery_address TEXT NOT NULL
);

CREATE TABLE user_delivery_info
(
    id_delivery_info INTEGER NOT NULL REFERENCES delivery_info ON UPDATE CASCADE,
    id_user INTEGER NOT NULL REFERENCES Users ON UPDATE CASCADE,
    PRIMARY KEY (id_delivery_info, id_user)
);

CREATE TABLE purchase
(
    id_purchase SERIAL PRIMARY KEY,
    id_user INTEGER NOT NULL REFERENCES Users ON UPDATE CASCADE,
    id_deli_info INTEGER NOT NULL REFERENCES delivery_info ON UPDATE CASCADE,
    purchase_date TIMESTAMP WITH TIME zone DEFAULT now() NOT NULL,
    total FLOAT NOT NULL CHECK(total >= 0),
    status package_status NOT NULL
);

CREATE TABLE product_purchase
(
    id_product INTEGER NOT NULL REFERENCES product ON UPDATE CASCADE,
    id_purchase INTEGER NOT NULL REFERENCES purchase ON UPDATE CASCADE,
    quantity INTEGER NOT NULL CHECK(quantity > 0),
    price FLOAT NOT NULL CHECK(price > 0),
    id_size INTEGER REFERENCES size ON UPDATE CASCADE,
    id_color INTEGER REFERENCES color ON UPDATE CASCADE,
    PRIMARY KEY (id_product, id_purchase)
);

CREATE TABLE review
(
    id_user INTEGER NOT NULL REFERENCES Users ON UPDATE CASCADE,
    id_product INTEGER NOT NULL REFERENCES product ON UPDATE CASCADE,
    comment TEXT NOT NULL,
    review_date TIMESTAMP WITH TIME zone DEFAULT now() NOT NULL,
    rating INTEGER NOT NULL CHECK(rating > 0 AND rating <= 5),
    PRIMARY KEY (id_user, id_product)
);

CREATE TABLE cart
(
    id_user INTEGER NOT NULL REFERENCES Users ON UPDATE CASCADE ON DELETE CASCADE,
    id_product INTEGER NOT NULL REFERENCES product ON UPDATE CASCADE,
    quantity INTEGER NOT NULL CHECK(quantity > 0),
    id_color INTEGER NOT NULL REFERENCES color ON UPDATE CASCADE,
    id_size INTEGER NOT NULL REFERENCES size ON UPDATE Cascade,
    PRIMARY KEY (id_user, id_product)
);

CREATE TABLE wishlist
(
    id_user INTEGER NOT NULL REFERENCES Users ON UPDATE CASCADE ON DELETE CASCADE,
    id_product INTEGER NOT NULL REFERENCES product ON UPDATE CASCADE,
    PRIMARY KEY (id_user, id_product)
);

CREATE TABLE faq
(
    id_question SERIAL PRIMARY KEY,
    question TEXT UNIQUE NOT NULL,
    answer TEXT NOT NULL 
);

CREATE TABLE poll
(
    id_poll SERIAL PRIMARY KEY,
    poll_name TEXT UNIQUE NOT NULL,
    poll_date DATE NOT NULL,
    expiration DATE NOT NULL,
    active BOOLEAN NOT NULL
);

CREATE TABLE submission
(
    id_submission SERIAL PRIMARY KEY,
    id_user INTEGER NOT NULL REFERENCES Users ON UPDATE CASCADE,
    submission_name TEXT NOT NULL,
    id_category INTEGER NOT NULL REFERENCES category ON UPDATE CASCADE,
    submission_description TEXT NOT NULL,
    picture TEXT NOT NULL,
    submission_date TIMESTAMP WITH TIME zone DEFAULT now() NOT NULL,
    accepted BOOLEAN NOT NULL,
    votes INTEGER DEFAULT 0 NOT NULL CHECK(votes >= 0),
    winner BOOLEAN NOT NULL,
    id_poll INTEGER NOT NULL REFERENCES poll ON UPDATE CASCADE
);

CREATE TABLE user_sub_vote
(
    id_user INTEGER NOT NULL REFERENCES Users ON UPDATE CASCADE,
    id_sub INTEGER NOT NULL REFERENCES submission ON UPDATE CASCADE,
    PRIMARY KEY (id_user, id_sub)
);

CREATE INDEX email ON users USING hash (email);
