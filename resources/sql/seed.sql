DROP TABLE IF EXISTS cards CASCADE;
DROP TABLE IF EXISTS items CASCADE;

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
DROP TABLE IF EXISTS user_delivery_info CASCADE;
DROP TABLE IF EXISTS purchase CASCADE;
DROP TABLE IF EXISTS product_purchase CASCADE;
DROP TABLE IF EXISTS review CASCADE;
DROP TABLE IF EXISTS cart CASCADE;
DROP TABLE IF EXISTS wishlist CASCADE;
DROP TABLE IF EXISTS faq CASCADE;
DROP TABLE IF EXISTS poll CASCADE;
DROP TABLE IF EXISTS submission CASCADE;
DROP TABLE IF EXISTS user_sub_vote CASCADE;
DROP TABLE IF EXISTS password_resets CASCADE;
DROP INDEX IF EXISTS authenticate;
DROP INDEX IF EXISTS id_category;
DROP INDEX IF EXISTS active_poll;
DROP INDEX IF EXISTS sub_id_poll;
DROP INDEX IF EXISTS by_price;
DROP INDEX IF EXISTS search_users;
DROP INDEX IF EXISTS search_products;
DROP TRIGGER IF EXISTS vote_on_design ON user_sub_vote;
DROP TRIGGER IF EXISTS unvote_on_design ON user_sub_vote;
DROP TRIGGER IF EXISTS review_delete ON review;
DROP TRIGGER IF EXISTS review_insert ON review;
DROP TRIGGER IF EXISTS elect_winner ON poll;
DROP TRIGGER IF EXISTS control_submission_vote ON user_sub_vote;
DROP TRIGGER IF EXISTS update_purchase_price_insert ON product_purchase;
DROP TRIGGER IF EXISTS update_purchase_price_delete ON product_purchase;
DROP TRIGGER IF EXISTS calculate_product_purchase_price ON product_purchase;
DROP TRIGGER IF EXISTS update_product_purchase_price ON product;
DROP TRIGGER IF EXISTS delete_user ON users;
DROP FUNCTION IF EXISTS update_product_review();
DROP FUNCTION IF EXISTS update_submission_vote();
DROP FUNCTION IF EXISTS select_winner();
DROP FUNCTION IF EXISTS check_submission_vote();
DROP FUNCTION IF EXISTS update_purchase_total();
DROP FUNCTION IF EXISTS calculate_new_product_purchase_price();
DROP FUNCTION IF EXISTS recalculate_product_purchase_price();
DROP FUNCTION IF EXISTS erase_user();

CREATE TYPE package_status AS ENUM ('awaiting_payment', 'processing', 'in_transit', 'delivered', 'canceled');

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
    delivery_cost FLOAT NOT NULL CHECK(delivery_cost >= 0),
    stock INTEGER NOT NULL CHECK(stock >= 0),
    rating FLOAT NOT NULL CHECK(rating >= 0 AND rating <= 5) DEFAULT 0,
    id_category INTEGER NOT NULL REFERENCES category ON UPDATE CASCADE
);

CREATE TABLE photo
(
    id_photo SERIAL PRIMARY KEY,
    image_path TEXT UNIQUE NOT NULL,
    id_product INTEGER REFERENCES product ON UPDATE CASCADE
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    birth_date DATE CHECK(birth_date < now()),
    active BOOLEAN NOT NULL DEFAULT TRUE,
    stock_manager BOOLEAN NOT NULL DEFAULT FALSE,
    moderator BOOLEAN NOT NULL DEFAULT FALSE,
    submission_manager BOOLEAN NOT NULL DEFAULT FALSE,
    id_photo INTEGER REFERENCES photo ON DELETE SET DEFAULT ON UPDATE CASCADE DEFAULT 1,
    user_description TEXT NOT NULL DEFAULT 'Hello! Proud MIEIC Hub member here!',
    remember_token VARCHAR
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
    id_user INTEGER NOT NULL REFERENCES users ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (id_delivery_info, id_user)
);

CREATE TABLE purchase
(
    id_purchase SERIAL PRIMARY KEY,
    id_user INTEGER NOT NULL REFERENCES Users ON UPDATE CASCADE ON DELETE NO ACTION,
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
    id_user INTEGER NOT NULL REFERENCES users ON UPDATE CASCADE ON DELETE NO ACTION,
    id_product INTEGER NOT NULL REFERENCES product ON UPDATE CASCADE,
    comment TEXT NOT NULL,
    review_date TIMESTAMP WITH TIME zone DEFAULT now() NOT NULL,
    rating INTEGER NOT NULL CHECK(rating > 0 AND rating <= 5),
    PRIMARY KEY (id_user, id_product)
);

CREATE TABLE cart
(
    id_cart SERIAL PRIMARY KEY,
    id_user INTEGER NOT NULL REFERENCES users ON UPDATE CASCADE ON DELETE CASCADE,
    id_product INTEGER NOT NULL REFERENCES product ON UPDATE CASCADE,
    quantity INTEGER NOT NULL CHECK(quantity > 0),
    id_color INTEGER NOT NULL REFERENCES color ON UPDATE CASCADE,
    id_size INTEGER NOT NULL REFERENCES size ON UPDATE Cascade
);

CREATE TABLE wishlist
(
    id_user INTEGER NOT NULL REFERENCES users ON UPDATE CASCADE ON DELETE CASCADE,
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
    poll_date DATE DEFAULT now() NOT NULL,
    expiration DATE NOT NULL,
    active BOOLEAN NOT NULL
);

CREATE TABLE submission
(
    id_submission SERIAL PRIMARY KEY,
    id_user INTEGER NOT NULL REFERENCES users ON UPDATE CASCADE ON DELETE NO ACTION,
    submission_name TEXT NOT NULL,
    id_category INTEGER NOT NULL REFERENCES category ON UPDATE CASCADE,
    submission_description TEXT NOT NULL,
    picture TEXT NOT NULL,
    submission_date TIMESTAMP WITH TIME zone DEFAULT now() NOT NULL,
    accepted BOOLEAN NOT NULL,
    votes INTEGER DEFAULT 0 NOT NULL CHECK(votes >= 0),
    winner BOOLEAN NOT NULL,
    id_poll INTEGER REFERENCES poll ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE user_sub_vote
(
    id_user INTEGER NOT NULL REFERENCES users ON UPDATE CASCADE ON DELETE NO ACTION,
    id_sub INTEGER NOT NULL REFERENCES submission ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (id_user, id_sub)
);

CREATE TABLE password_resets
(
	email TEXT PRIMARY KEY,
	token TEXT,
	created_at TIMESTAMP WITH TIME zone
);

-- Indexes

CREATE INDEX authenticate ON users USING hash(name);
CREATE INDEX id_category ON product USING hash(id_category);
CREATE INDEX sub_id_poll ON submission(id_poll);
CLUSTER submission USING sub_id_poll;
CREATE INDEX by_price ON product(price);
CLUSTER product USING by_price;
CREATE INDEX search_products ON product USING GIST (to_tsvector('english', product_name || ' ' || product_description));

-- Triggers

CREATE FUNCTION update_submission_vote() RETURNS TRIGGER AS $BODY$
BEGIN
    IF TG_OP = 'INSERT' THEN
        UPDATE submission
        SET votes =
        (
            SELECT count(*)
            FROM user_sub_vote
            WHERE NEW.id_sub = user_sub_vote.id_sub
        )
        WHERE submission.id_submission = NEW.id_sub;
        RETURN NEW;
    ELSEIF TG_OP = 'DELETE' THEN
        UPDATE submission
        SET votes =
        (
            SELECT count(*)
            FROM user_sub_vote
            WHERE OLD.id_sub = user_sub_vote.id_sub
        )
        WHERE submission.id_submission = OLD.id_sub;
        RETURN OLD;
    END IF;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER vote_on_design
AFTER INSERT ON user_sub_vote
FOR EACH ROW
EXECUTE PROCEDURE update_submission_vote();

CREATE TRIGGER unvote_on_design
AFTER DELETE ON user_sub_vote
FOR EACH ROW
EXECUTE PROCEDURE update_submission_vote();

CREATE FUNCTION update_product_review() RETURNS TRIGGER AS $BODY$
BEGIN
    IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
        UPDATE product
        SET rating =
        (
            SELECT AVG(review.rating)
            FROM review, product
            WHERE review.id_product = product.id_product AND review.id_product = NEW.id_product
        )
        WHERE NEW.id_product = product.id_product;
        RETURN NEW;
    ELSEIF TG_OP = 'DELETE' THEN
        UPDATE product
        SET rating =
        (
            SELECT AVG(review.rating)
            FROM review, product
            WHERE review.id_product = product.id_product AND review.id_product = OLD.id_product
        )
        WHERE OLD.id_product = product.id_product;
        RETURN OLD;
    END IF;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER review_insert
AFTER INSERT OR UPDATE ON review
FOR EACH ROW
EXECUTE PROCEDURE update_product_review();

CREATE TRIGGER review_delete
AFTER DELETE ON review
FOR EACH ROW
EXECUTE PROCEDURE update_product_review();

CREATE FUNCTION check_submission_vote() RETURNS TRIGGER AS $BODY$
BEGIN
    IF EXISTS
    (
        SELECT poll.id_poll
        FROM poll, submission, user_sub_vote
        WHERE NEW.id_sub = submission.id_submission AND submission.id_poll = poll.id_poll
        AND poll.active IS FALSE
    )
    THEN RAISE EXCEPTION  'Users can no longer vote on an inactive/expired poll';
    END IF;
    RETURN NEW;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER control_submission_vote
BEFORE INSERT ON user_sub_vote
FOR EACH ROW
EXECUTE PROCEDURE check_submission_vote();

CREATE FUNCTION select_winner() RETURNS TRIGGER AS $BODY$
BEGIN
    IF NEW.active IS FALSE THEN
        UPDATE submission
        SET winner = TRUE
        WHERE submission.id_poll = NEW.id_poll AND submission.votes =
        (
            SELECT MAX(submission.votes)
            FROM submission, poll
            WHERE poll.id_poll = NEW.id_poll AND poll.id_poll = submission.id_poll
        );
    END IF;
    RETURN NEW;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER elect_winner
AFTER UPDATE ON poll
FOR EACH ROW
EXECUTE PROCEDURE select_winner();

CREATE FUNCTION update_purchase_total() RETURNS TRIGGER AS $BODY$
BEGIN
    IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
        UPDATE purchase
        SET total =
        (
            SELECT sum(products_price)
            FROM
            (
                SELECT product_purchase.quantity * product_purchase.price AS products_price
                FROM product, purchase, product_purchase
                WHERE NEW.id_purchase = purchase.id_purchase AND NEW.id_product = product.id_product
                AND product_purchase.id_purchase = NEW.id_purchase AND product_purchase.id_product = NEW.id_product
            ) AS products_actual_price
        )
        WHERE NEW.id_purchase = purchase.id_purchase;
        RETURN NEW;
    ELSEIF TG_OP = 'DELETE' THEN
        UPDATE purchase
        SET total =
        (
            SELECT sum(products_price)
            FROM
            (
                SELECT product_purchase.quantity * product_purchase.price AS products_price
                FROM product, purchase, product_purchase
                WHERE OLD.id_purchase = purchase.id_purchase AND OLD.id_product = product.id_product
                AND product_purchase.id_purchase = OLD.id_purchase AND product_purchase.id_product = OLD.id_product
            ) AS products_actual_price
        )
        WHERE OLD.id_purchase = purchase.id_purchase;
        RETURN OLD;
    END IF;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER update_purchase_price_insert
AFTER INSERT OR UPDATE ON product_purchase
FOR EACH ROW
EXECUTE PROCEDURE update_purchase_total();

CREATE TRIGGER update_purchase_price_delete
AFTER DELETE ON product_purchase
FOR EACH ROW
EXECUTE PROCEDURE update_purchase_total();

CREATE FUNCTION calculate_new_product_purchase_price() RETURNS TRIGGER AS $BODY$
BEGIN
    UPDATE product_purchase
    SET price =
    (
        SELECT product.price + product.delivery_cost as total_product_price
        FROM product, product_purchase
        WHERE product.id_product = product_purchase.id_product
        AND product_purchase.id_product = NEW.id_product
        AND product_purchase.id_purchase = NEW.id_purchase
    )
    WHERE product_purchase.id_product = NEW.id_product
    AND product_purchase.id_purchase = NEW.id_purchase;
    RETURN NEW;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER new_product_purchase_price
AFTER INSERT ON product_purchase
FOR EACH ROW
EXECUTE PROCEDURE calculate_new_product_purchase_price();

CREATE FUNCTION recalculate_product_purchase_price() RETURNS TRIGGER AS $BODY$
BEGIN
    UPDATE product_purchase
    SET price =
    (
        SELECT product.price + product.delivery_cost as total_product_price
        FROM product, product_purchase
        WHERE product.id_product = product_purchase.id_product
        AND product.id_product = NEW.id_product
        LIMIT 1
    )
    WHERE product_purchase.id_product = NEW.id_product;
    RETURN NEW;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER update_product_purchase_price
AFTER UPDATE ON product
FOR EACH ROW
EXECUTE PROCEDURE recalculate_product_purchase_price();

CREATE FUNCTION erase_user() RETURNS TRIGGER AS $BODY$
DECLARE
    next_id INTEGER := nextval(pg_get_serial_sequence('users', 'id'));
    new_name TEXT := 'John Doe' || MD5(OLD.name);
BEGIN
    INSERT INTO users (id, name, email, password, birth_date, active, stock_manager, moderator, submission_manager,
    id_photo, user_description)
    VALUES (next_id, new_name , 'mieichubsupport@gmail.com','123masfiasfnakslfmas', '1994-01-01', FALSE, FALSE, FALSE,
    FALSE, 1, 'Just a regular user, nothing to see here...');

    UPDATE review
    SET id_user = next_id
    WHERE review.id_user = OLD.id;

    UPDATE submission
    SET id_user = next_id
    WHERE submission.id_user = OLD.id;

    UPDATE user_sub_vote
    SET id_user = next_id
    WHERE user_sub_vote.id_user = OLD.id;

    UPDATE purchase
    SET id_user = next_id
    WHERE purchase.id_user = OLD.id;

    RETURN OLD;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER delete_user
BEFORE DELETE ON users
FOR EACH ROW
EXECUTE PROCEDURE erase_user();

-- Table: category
INSERT INTO category (category) VALUES ('Apparel');
INSERT INTO category (category) VALUES ('Phone Case');
INSERT INTO category (category) VALUES ('Sticker');
INSERT INTO category (category) VALUES ('Poster');
INSERT INTO category (category) VALUES ('Ticket');
INSERT INTO category (category) VALUES ('Mouse Pad');
INSERT INTO category (category) VALUES ('Mug');

-- Table: product

    -- Apparel
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('MIEIC Hoodie', 'Black hoodie for MIEIC students. 100% poliester.', 14.99, 2.99, 50, 0, 1);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Sudo Rm Hoodie', 'Funny hoodie allusive to LINUX commands. For MIEIC students. 100% poliester.', 14.99, 2.99, 50, 0, 1);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Hard Code Hoodie', 'Funny hoodie allusive to Hard Rock Caffe. For MIEIC students. 100% poliester.', 14.99, 2.99, 50, 0, 1);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('StarCode Hoodie', 'Funny hoodie allusive to Starbucks Caffe. For MIEIC students. 100% poliester.', 14.99, 2.99, 50, 0, 1);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('MIEIC Jacket', 'Black jacket for MIEIC students. 100% poliester.', 19.99, 2.99, 50, 0, 1);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Mouse Hoodie', 'Hoodie with a mouse for MIEIC students. 100% poliester.', 14.99, 2.99, 50, 0, 1);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Loading Hoodie', 'Funny hoodie with loading bar. For MIEIC students. 100% poliester.', 14.99, 2.99, 50, 0, 1);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Floppy Disk Hoodie', 'Hoodie with a floppy disk. For MIEIC students. 100% poliester.', 14.99, 2.99, 50, 0, 1);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('E HTML Jacket', 'Jacket with loading and E instead the classic 5 on HTML logo. For MIEIC students. 100% poliester.', 19.99, 2.99, 50, 0, 1);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('FEUP Hoodie 2', 'Hoodie for FEUP students. 100% poliester.', 14.99, 2.99, 50, 0, 1);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Fernando Pessoa Hoodie', 'Hoodie for MIEIC students. 100% poliester.', 14.99, 2.99, 50, 0, 1);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Programmer Hoodie', 'Grey hoodie for MIEIC students. 100% poliester.', 14.99, 2.99, 50, 0, 1);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Semi Colon Hoodie', 'Hoodie for MIEIC students. 100% poliester.', 14.99, 2.99, 50, 0, 1);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Author Jacket', 'Jacket for MIEIC students. 100% poliester.', 19.99, 2.99, 50, 0, 1);

    --Phone Cases
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Programmer Case', 'Case related to programmers. Water resistant.', 9.99, 1.99, 50, 0, 2);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Love Programming Case', 'Case related to programmers. Water resistant.', 9.99, 1.99, 50, 0, 2);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Viva La Programacion Case', 'Case related to programmers. Water resistant.', 9.99, 1.99, 50, 0, 2);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('GitKraken Case', 'Case related to programmers. Water resistant.', 9.99, 1.99, 50, 0, 2);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('It is a feature Case', 'Case related to programmers. Water resistant.', 9.99, 1.99, 50, 0, 2);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Debugging Stages Case', 'Case related to programmers. Water resistant.', 9.99, 1.99, 50, 0, 2);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Hello World Case', 'Case related to programmers. Water resistant.', 9.99, 1.99, 50, 0, 2);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Coffee to Code Case', 'Case related to programmers. Water resistant.', 9.99, 1.99, 50, 0, 2);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Just Code It Case', 'Case related to programmers. Water resistant.', 9.99, 2.99, 50, 0, 2);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Awsome Case', 'Case related to programmers. Water resistant.', 9.99, 2.99, 50, 0, 2);

    --Posters
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Today Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Anonymous1 Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Anonymous2 Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Hackerman Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('TensionRelease Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('In Code We Trust Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Keep Calm Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('I Love Coding Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('SETUP Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Eat Sleep Code Repeat Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Semi Colon Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Super Bock Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('World Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('No coffee No code Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);

    --Stickers
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('FEUP Sticker', 'Laptop Sticker.', 2.99, 0.99, 50, 0, 3);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Unexpected Sticker', 'Laptop sticker.', 2.99, 0.99, 50, 0, 3);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Coffee Sticker', 'Laptop Sticker.', 2.99, 0.99, 50, 0, 3);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Home Sticker', 'Laptop sticker.', 2.99, 0.99, 50, 0, 3);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('HTML Sticker', 'Laptop Sticker.', 2.99, 0.99, 50, 0, 3);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Blackbelt Sticker', 'Laptop sticker.', 2.99, 0.99, 50, 0, 3);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Nike Sticker', 'Laptop sticker.', 2.99, 0.99, 50, 0, 3);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Titanic Sticker', 'Laptop sticker.', 2.99, 0.99, 50, 0, 3);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('False Sticker', 'Laptop sticker.', 2.99, 0.99, 50, 0, 3);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Java Sticker', 'Laptop sticker.', 2.99, 0.99, 50, 0, 3);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Combo Stickers', 'Laptop stickers.', 14.99, 0.99, 50, 0, 3);


    --Tickets
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('HTML Ticket', 'Ticket for workshop to learn to code in HTML.', 1.99, 0.99, 50, 0, 5);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('CSS Ticket', 'Ticket for workshop to learn to code in  CSS.', 0.99, 0.99, 50, 0, 5);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Java Ticket', 'Ticket for workshop to learn to code in JAVA.', 4.99, 0.99, 50, 0, 5);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('C/C++ Ticket', 'Ticket for workshop to learn to code in C/C++.', 4.99, 0.99, 50, 0, 5);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Python Ticket', 'Ticket for workshop to learn to code in Python.', 1.99, 0.99, 50, 0, 5);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('SQL Ticket', 'Ticket for workshop to learn to code in SQL.', 1.99, 0.99, 50, 0, 5);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Dr.Scheme Ticket', 'Ticket for workshop to learn to code in Dr.Scheme.', 0.99, 0.99, 50, 0, 5);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Google Talks', 'Ticket for lecture with Google engineer.', 9.99, 0.99, 50, 0, 5);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('PPIN Talks', 'Ticket for lecture to learn about personal and interpersonal proficiency.', 0.99, 0.99, 50, 0, 5);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('PHP Ticket', 'Ticket for workshop to learn to code in PHP', 1.99, 0.99, 50, 0, 5);
    --Mouse Pads
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('MIEIC Mouse Pad', 'Mouse pad for MIEIC students.', 9.99, 1.99, 50, 0, 6);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('FEUP Mouse Pad', 'Mouse pad for FEUP students', 9.99, 1.99, 50, 0, 6);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Go Away I am Coding Mouse Pad', 'Funny mouse pad. For programmers.', 9.99, 1.99, 50, 0, 6);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Errors Mouse Pad', 'Funny mouse pad. For programmers.', 9.99, 1.99, 50, 0, 6);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Breaking Bad Mouse Pad', 'Funny mouse pad. For programmers.', 9.99, 1.99, 50, 0, 6);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Eat Sleep Code Mouse Pad', 'Funny mouse pad. For programmers.', 9.99, 1.99, 50, 0, 6);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Not A Bug Mouse Pad', 'Funny mouse pad. For programmers.', 9.99, 1.99, 50, 0, 6);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Not A Robot Mouse Pad', 'Funny mouse pad. For programmers.', 9.99, 1.99, 50, 0, 6);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Ninja Mouse Pad', 'Funny mouse pad. For programmers.', 9.99, 1.99, 50, 0, 6);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Trust Me Mouse Pad', 'Funny mouse pad. For programmers.', 9.99, 1.99, 50, 0, 6);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Best Programmer Ever Mouse Pad', 'Funny mouse pad. For programmers.', 9.99, 1.99, 50, 0, 6);

    --Mugs
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Development Process Mug', 'Mug for MIEIC students.', 9.99, 1.99, 50, 0, 7);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Binary Mug', 'Mug for FEUP students.', 9.99, 1.99, 50, 0, 7);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('I am A Programmer Mug', 'Funny mug. For programmers.', 9.99, 1.99, 50, 0, 7);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('CSS Mug', 'Funny mug. For programmers.', 9.99, 1.99, 50, 0, 7);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Debug Mug', 'Funny mug. For programmers.', 9.99, 1.99, 50, 0, 7);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Why Mug', 'Funny mug. For programmers.', 9.99, 1.99, 50, 0, 7);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Gamer Mug', 'Funny mug. For programmers.', 9.99, 1.99, 50, 0, 7);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Offline Mug', 'Funny mug. For programmers.', 9.99, 1.99, 50, 0, 7);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Break Mug', 'Funny mug. For programmers.', 9.99, 1.99, 50, 0, 7);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Coffee Mug', 'Funny mug. For programmers.', 9.99, 1.99, 50, 0, 7);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Errors Mug', 'Funny mug. For programmers.', 9.99, 1.99, 50, 0, 7);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Sleep Mug', 'Funny mug. For programmers.', 9.99, 1.99, 50, 0, 7);
INSERT INTO product (product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES ('Go Away Mug', 'Funny mug. For programmers.', 9.99, 1.99, 50, 0, 7);

-- Table: photo

--Users
INSERT INTO photo (image_path, id_product) VALUES ('img/users/default.png', NULL);
INSERT INTO photo (image_path, id_product) VALUES ('img/users/Eduardo-Silva.jpg', NULL);
INSERT INTO photo (image_path, id_product) VALUES ('img/users/Tomás Novo.png', NULL);
INSERT INTO photo (image_path, id_product) VALUES ('img/users/Joana Ramos.png', NULL);
INSERT INTO photo (image_path, id_product) VALUES ('img/users/Miguel Carvalho.jpg', NULL);

    --Apparel
INSERT INTO photo (image_path, id_product) VALUES ('img/apparel/inph.jpg', 1);
INSERT INTO photo (image_path, id_product) VALUES ('img/apparel/hoddie_sudo_rm.jpg', 2);
INSERT INTO photo (image_path, id_product) VALUES ('img/apparel/hoddie_sudo_rm_single.jpg', 2);
INSERT INTO photo (image_path, id_product) VALUES ('img/apparel/hoodie_1_red.jpg', 3);
INSERT INTO photo (image_path, id_product) VALUES ('img/apparel/hoodie_1_red_single.jpg', 3);
INSERT INTO photo (image_path, id_product) VALUES ('img/apparel/hoodie_2.jpg', 4);
INSERT INTO photo (image_path, id_product) VALUES ('img/apparel/hoodie_2_single.jpg', 4);
INSERT INTO photo (image_path, id_product) VALUES ('img/apparel/hoodie_2_smiley.jpg', 5);
INSERT INTO photo (image_path, id_product) VALUES ('img/apparel/hoodie_2_smiley_single.jpg', 5);
INSERT INTO photo (image_path, id_product) VALUES ('img/apparel/hoodie_3.jpg', 6);
INSERT INTO photo (image_path, id_product) VALUES ('img/apparel/hoodie_3_single.jpg', 6);
INSERT INTO photo (image_path, id_product) VALUES ('img/apparel/hoodie_5.jpg', 7);
INSERT INTO photo (image_path, id_product) VALUES ('img/apparel/hoodie_6.jpg', 8);
INSERT INTO photo (image_path, id_product) VALUES ('img/apparel/hoodie_10.jpg', 9);
INSERT INTO photo (image_path, id_product) VALUES ('img/apparel/hoodie_example.jpg', 10);
INSERT INTO photo (image_path, id_product) VALUES ('img/apparel/nando.jpg', 11);
INSERT INTO photo (image_path, id_product) VALUES ('img/apparel/programmer.jpg', 12);
INSERT INTO photo (image_path, id_product) VALUES ('img/apparel/programmer2.jpg', 13);
INSERT INTO photo (image_path, id_product) VALUES ('img/apparel/author_jacket.jpg', 14);

    --Cases
INSERT INTO photo (image_path, id_product) VALUES ('img/cases/programmer.jpg', 15);
INSERT INTO photo (image_path, id_product) VALUES ('img/cases/loveprogramming.jpg', 16);
INSERT INTO photo (image_path, id_product) VALUES ('img/cases/programacion.png', 17);
INSERT INTO photo (image_path, id_product) VALUES ('img/cases/gitkraken.jpeg', 18);
INSERT INTO photo (image_path, id_product) VALUES ('img/cases/feature.jpeg', 19);
INSERT INTO photo (image_path, id_product) VALUES ('img/cases/debug.jpg', 20);
INSERT INTO photo (image_path, id_product) VALUES ('img/cases/hello.jpeg', 21);
INSERT INTO photo (image_path, id_product) VALUES ('img/cases/coffee.jpeg', 22);
INSERT INTO photo (image_path, id_product) VALUES ('img/cases/justcodeit.jpeg', 23);
INSERT INTO photo (image_path, id_product) VALUES ('img/cases/awsome.jpg', 24);

    --Posters
INSERT INTO photo (image_path, id_product) VALUES ('img/posters/today.jpg', 25);
INSERT INTO photo (image_path, id_product) VALUES ('img/posters/anonymous1.jpg', 26);
INSERT INTO photo (image_path, id_product) VALUES ('img/posters/anonymous2.jpg', 27);
INSERT INTO photo (image_path, id_product) VALUES ('img/posters/hackerman.jpg', 28);
INSERT INTO photo (image_path, id_product) VALUES ('img/posters/release.jpg', 29);
INSERT INTO photo (image_path, id_product) VALUES ('img/posters/in code.jpg', 30);
INSERT INTO photo (image_path, id_product) VALUES ('img/posters/keep calm.jpg', 31);
INSERT INTO photo (image_path, id_product) VALUES ('img/posters/lovecoding.jpg', 32);
INSERT INTO photo (image_path, id_product) VALUES ('img/posters/SETUP.jpg', 33);
INSERT INTO photo (image_path, id_product) VALUES ('img/posters/eat.jpg', 34);
INSERT INTO photo (image_path, id_product) VALUES ('img/posters/semi.jpg', 35);
INSERT INTO photo (image_path, id_product) VALUES ('img/posters/super.jpg', 36);
INSERT INTO photo (image_path, id_product) VALUES ('img/posters/world.jpg', 37);
INSERT INTO photo (image_path, id_product) VALUES ('img/posters/nocoffee.jpeg', 38);

    --Stickers
INSERT INTO photo (image_path, id_product) VALUES ('img/stickers/feup.jpg', 39);
INSERT INTO photo (image_path, id_product) VALUES ('img/stickers/unexpected.jpg', 40);
INSERT INTO photo (image_path, id_product) VALUES ('img/stickers/coffee.jpg', 41);
INSERT INTO photo (image_path, id_product) VALUES ('img/stickers/home.png', 42);
INSERT INTO photo (image_path, id_product) VALUES ('img/stickers/html.jpg', 43);
INSERT INTO photo (image_path, id_product) VALUES ('img/stickers/blackbelt.jpg', 44);
INSERT INTO photo (image_path, id_product) VALUES ('img/stickers/nike.jpg', 45);
INSERT INTO photo (image_path, id_product) VALUES ('img/stickers/titanic.jpg', 46);
INSERT INTO photo (image_path, id_product) VALUES ('img/stickers/true.jpg', 47);
INSERT INTO photo (image_path, id_product) VALUES ('img/stickers/java.png', 48);
INSERT INTO photo (image_path, id_product) VALUES ('img/stickers/stickers.jpg', 49);

    --Tickets
INSERT INTO photo (image_path, id_product) VALUES ('img/tickets/ticket.png', 50);
INSERT INTO photo (image_path, id_product) VALUES ('img/tickets/ticket2.png', 51);
INSERT INTO photo (image_path, id_product) VALUES ('img/tickets/ticket3.png', 52);
INSERT INTO photo (image_path, id_product) VALUES ('img/tickets/ticket4.png', 53);
INSERT INTO photo (image_path, id_product) VALUES ('img/tickets/ticket5.png', 54);
INSERT INTO photo (image_path, id_product) VALUES ('img/tickets/ticket6.png', 55);
INSERT INTO photo (image_path, id_product) VALUES ('img/tickets/ticket7.png', 56);
INSERT INTO photo (image_path, id_product) VALUES ('img/tickets/ticket8.png', 57);
INSERT INTO photo (image_path, id_product) VALUES ('img/tickets/ticket9.png', 58);
INSERT INTO photo (image_path, id_product) VALUES ('img/tickets/ticket10.png', 59);

    --Mouse Pads
INSERT INTO photo (image_path, id_product) VALUES ('img/mousepads/feup.jpg', 60);
INSERT INTO photo (image_path, id_product) VALUES ('img/mousepads/feup2.jpg', 61);
INSERT INTO photo (image_path, id_product) VALUES ('img/mousepads/goAway.png', 62);
INSERT INTO photo (image_path, id_product) VALUES ('img/mousepads/more.jpg', 63);
INSERT INTO photo (image_path, id_product) VALUES ('img/mousepads/breaking.jpg', 64);
INSERT INTO photo (image_path, id_product) VALUES ('img/mousepads/eat.jpg', 65);
INSERT INTO photo (image_path, id_product) VALUES ('img/mousepads/feature.jpg', 66);
INSERT INTO photo (image_path, id_product) VALUES ('img/mousepads/robot.jpg', 67);
INSERT INTO photo (image_path, id_product) VALUES ('img/mousepads/ninja.jpg', 68);
INSERT INTO photo (image_path, id_product) VALUES ('img/mousepads/trust me.jpeg', 69);
INSERT INTO photo (image_path, id_product) VALUES ('img/mousepads/bestever.jpg', 70);

    --Mugs
INSERT INTO photo (image_path, id_product) VALUES ('img/mugs/process.jpeg', 71);
INSERT INTO photo (image_path, id_product) VALUES ('img/mugs/binary.jpeg', 72);
INSERT INTO photo (image_path, id_product) VALUES ('img/mugs/programmer.jpg', 73);
INSERT INTO photo (image_path, id_product) VALUES ('img/mugs/css.jpg', 74);
INSERT INTO photo (image_path, id_product) VALUES ('img/mugs/debug.jpg', 75);
INSERT INTO photo (image_path, id_product) VALUES ('img/mugs/why.jpg', 76);
INSERT INTO photo (image_path, id_product) VALUES ('img/mugs/gamer.jpg', 77);
INSERT INTO photo (image_path, id_product) VALUES ('img/mugs/offline.jpg', 78);
INSERT INTO photo (image_path, id_product) VALUES ('img/mugs/break.jpg', 79);
INSERT INTO photo (image_path, id_product) VALUES ('img/mugs/coffee.jpg', 80);
INSERT INTO photo (image_path, id_product) VALUES ('img/mugs/errors.jpg', 81);
INSERT INTO photo (image_path, id_product) VALUES ('img/mugs/sleep.jpg', 82);
INSERT INTO photo (image_path, id_product) VALUES ('img/mugs/goaway.png', 83);
-- Table: user

-- Regular users

INSERT INTO users VALUES (
  DEFAULT,
  'John Doe',
  'john@example.com',
  '$2y$10$HfzIhGCCaxqyaIdGgjARSuOKAcm1Uy82YfLuNaajn6JrjLWy9Sj/W'
); -- Password is 1234. Generated using (Bcrypt) Hash::make('1234')



INSERT INTO users (name, email, password) VALUES('Chandler Bing', 'lbaw1825@gmail.com', '$2y$10$kOQHd3CIu4.UQRQ6OzcjouJQTF7GLUdd9g.sGRVDghn6kvDOEcjcW');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES ('Miguel Carvalho', 'up201605757@fe.up.pt','$2y$12$7M1rWpEnZg/qj6AfT2JXue1BfDG/IixigKNs7WUkMcA.VNKp20NAi', '1998-12-25', TRUE, TRUE, TRUE, TRUE, 5, 'Owner of MIEIC Hub');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES ('Eduardo Silva', 'up201603135@fe.up.pt','$2y$12$L1d1H1PllySA.y43Dks4depIIEk4fGMQDRzZOP01dJ8VsErmyx.0a', '1998-01-22', TRUE, TRUE, TRUE, TRUE, 2, 'Co-Founder of MIEIC Hub');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES ('Tomás Novo', 'up201604503@fe.up.pt','A9709902614CB2D8F66D811D4032B79FBD311AA73E9D0FE41A9B9B93464CC6FB', '1998-07-31', TRUE, TRUE, TRUE, TRUE, 3, 'The best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES ('Joana Ramos', 'up201605017@fe.up.pt', '$2y$12$xrvhzVNl6zN8KKa19n/gj.NZMnFGkT9ftRrrhe7L7T9roqAm6FvMK', '1998-11-02', TRUE, TRUE, TRUE, TRUE, 4, 'Co-Founder of MIEIC Hub');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Zé Luís', 'up201287644@fe.up.pt', 'DA34262C62CDE67274D3452AECCCE39676A73249800FA9316532D8B8F2E5055B', '1994-02-11', TRUE, FALSE, FALSE, FALSE, 'MEEEC student at 2nd grade. Love music !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Susana Castro', 'up201503453@fe.up.pt', '5B8346507DDFD4AEF39C12521ECA6ED82689C7090A3E7312F0BA3D17421BB3B2', '1997-04-15', TRUE, FALSE, FALSE, FALSE, ' Quemistry student, the one who knocks !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('José António', 'up201703443@fe.up.pt', 'C86FD59FBCE597E2534E56EACE209EF7139529BC5B1624AD700673FDCA88B33D', '1998-02-11', TRUE, FALSE, FALSE, FALSE, 'I love computers !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Rolando Escada Abaixo', 'up201304453@fe.up.pt', '46445B968117080EB11361F904342868D5A19B69291B876901FA7C6BCA65F5FA', '1994-03-21', TRUE, FALSE, FALSE, FALSE, 'CIVIL < INFORMATICA !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Andreia Ramalho', 'up201603853@fe.up.pt', 'CB5738AFA52AB674CAC31008B17016033E0C165D75A07AD67133D05E468DD3AF', '1993-12-13', TRUE, FALSE, FALSE, FALSE, 'MIEIC Student !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('João Saraiva', 'up201703453@fe.up.pt', 'C86FD59FBCE597E2534E56EACE209EF7139529BC5B1624AD700673FDCA88B33D', '1996-02-10', TRUE, FALSE, FALSE, FALSE, 'MIEIC Student AT 1ST grade !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Luísa Josefa', 'up201406753@fe.up.pt', '5B8346507DDFD4AEF39C12521ECA6ED82689C7090A3E7312F0BA3D17421BB3B2', '1999-03-31', TRUE, FALSE, FALSE, FALSE, 'MIEIC Student');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Alfredo Granjão', 'up201706173@fe.up.pt', 'EDF755F83215D530C9BD95767A13BB7BD5BDB8F5D5108ACEFCD605A00FBEE1F1', '1995-02-11', TRUE, FALSE, FALSE, FALSE, 'MIEIC Student 5th grade! SOU FINALISTAAAA');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Ada Beliza', 'up201302123@fe.up.pt', 'CB5738AFA52AB674CAC31008B17016033E0C165D75A07AD67133D05E468DD3AF', '1996-03-09', TRUE, FALSE, FALSE, FALSE, 'MIEIC student at 3rd grade !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Zebedeu Garcia', 'user11@fe.up.pt', 'EAAC49260A132A794309878B2CBB31FAB67DA5E4893487FBCC829C625E734FA0', '1998-11-07', TRUE, FALSE, FALSE, FALSE, 'The 11th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Anacleto Miquelino', 'user12@fe.up.pt', 'HB5738AFA52AB674CAC31008B17016033E0C165D75A07AD67133D05E468DD3AF', '1997-10-01', TRUE, FALSE, FALSE, FALSE, 'The 12th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Joana Silva', 'user13@fe.up.pt', 'C86FD59FBCE597E2534E56EACE209EF7139529BC5B1624AD700673FDCA88B33D', '1997-07-03', TRUE, FALSE, FALSE, FALSE, 'The 13th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('João Ferreia', 'user14@fe.up.pt', '46445B968117080EB11361F904342868D5A19B69291B876901FA7C6BCA65F5FA', '1993-08-11', TRUE, FALSE, FALSE, FALSE, 'The 14th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Amadeu Prazeres', 'user15@fe.up.pt', 'A9709902614CB2D8F66D811D4032B79FBD311AA73E9D0FE41A9B9B93464CC6FB', '1992-04-16', TRUE, FALSE, FALSE, FALSE, 'The 15th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Nuno Lopes', 'user16@fe.up.pt', '5B8346507DDFD4AEF39C12521ECA6ED82689C7090A3E7312F0BA3D17421BB3B2', '1998-03-22', TRUE, FALSE, FALSE, FALSE, 'The 16th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Alexandra Mendes', 'user17@fe.up.pt', 'EAAC49260A132A794309878B2CBB31FAB67DA5E4893487FBCC829C625E734FA0', '1999-01-30', TRUE, FALSE, FALSE, FALSE, 'The 17th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Carolina Soares', 'user18@fe.up.pt', 'DA34262C62CDE67274D3452AECCCE39676A73249800FA9316532D8B8F2E5055B', '1994-09-27', TRUE, FALSE, FALSE, FALSE, 'The 18th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Christopher Abreu', 'user19@fe.up.pt', 'CB5738AFA52AB674CAC31008B17016033E0C165D75A07AD67133D05E468DD3AF', '1996-10-23', TRUE, FALSE, FALSE, FALSE, 'The 19th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Tiago Cardoso', 'user20@fe.up.pt', '46445B968117080EB11361F904342868D5A19B69291B876901FA7C6BCA65F5FA', '1994-11-22', TRUE, FALSE, FALSE, FALSE, 'The 20th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('João Franco', 'user21@fe.up.pt', 'EAAC49260A132A794309878B2CBB31FAB67DA5E4893487FBCC829C625E734FA0', '1993-12-21', TRUE, FALSE, FALSE, FALSE, 'The 21st best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Rui Alves', 'user22@fe.up.pt', 'A9709902614CB2D8F66D811D4032B79FBD311AA73E9D0FE41A9B9B93464CC6FB', '1997-01-26', TRUE, FALSE, FALSE, FALSE, 'The 22nd best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Francisco Ferreira', 'user23@fe.up.pt', 'CB5738AFA52AB674CAC31008B17016033E0C165D75A07AD67133D05E468DD3AF', '1998-02-16', TRUE, FALSE, FALSE, FALSE, 'The 23rd best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('João Amaral', 'user24@fe.up.pt', '5B8346507DDFD4AEF39C12521ECA6ED82689C7090A3E7312F0BA3D17421BB3B2', '1997-03-15', TRUE, FALSE, FALSE, FALSE, 'The 24th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Pedro Padrão', 'user25@fe.up.pt', 'EDF755F83215D530C9BD95767A13BB7BD5BDB8F5D5108ACEFCD605A00FBEE1F1', '1995-04-25', TRUE, FALSE, FALSE, FALSE, 'The 25th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('João Martins', 'user26@fe.up.pt', 'DA34262C62CDE67274D3452AECCCE39676A73249800FA9316532D8B8F2E5055B', '1998-05-22', TRUE, FALSE, FALSE, FALSE, 'The 26th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Diogo Cadavez', 'user27@fe.up.pt', 'CB5738AFA52AB674CAC31008B17016033E0C165D75A07AD67133D05E468DD3AF', '1998-06-26', TRUE, FALSE, FALSE, FALSE, 'The 27th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('José Carlos', 'user28@fe.up.pt', 'EAAC49260A132A794309878B2CBB31FAB67DA5E4893487FBCC829C625E734FA0', '1998-07-30', TRUE, FALSE, FALSE, FALSE, 'The 28th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Filipe Martins', 'user29@fe.up.pt', 'A9709902614CB2D8F66D811D4032B79FBD311AA73E9D0FE41A9B9B93464CC6FB', '1996-08-21', TRUE, FALSE, FALSE, FALSE, 'The 29th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Luís Freitas', 'user30@fe.up.pt', '46445B968117080EB11361F904342868D5A19B69291B876901FA7C6BCA65F5FA', '1999-04-12', TRUE, FALSE, FALSE, FALSE, 'The 30th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Nuno Fernandes', 'user31@fe.up.pt', '5B8346507DDFD4AEF39C12521ECA6ED82689C7090A3E7312F0BA3D17421BB3B2', '1993-12-21', TRUE, FALSE, FALSE, FALSE, 'The 31st best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Luís Lombo', 'user32@fe.up.pt', 'DA34262C62CDE67274D3452AECCCE39676A73249800FA9316532D8B8F2E5055B', '1993-01-26', TRUE, FALSE, FALSE, FALSE, 'The 32nd best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Pedro Nunes', 'user33@fe.up.pt', 'C86FD59FBCE597E2534E56EACE209EF7139529BC5B1624AD700673FDCA88B33D', '1992-02-16', TRUE, FALSE, FALSE, FALSE, 'The 33rd best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Jorge Rodrigues', 'user34@fe.up.pt', 'EDF755F83215D530C9BD95767A13BB7BD5BDB8F5D5108ACEFCD605A00FBEE1F1', '1993-03-15', TRUE, FALSE, FALSE, FALSE, 'The 34th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Manuel Prata', 'user35@fe.up.pt', 'A9709902614CB2D8F66D811D4032B79FBD311AA73E9D0FE41A9B9B93464CC6FB', '1990-04-25', TRUE, FALSE, FALSE, FALSE, 'The 35th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Ângela Pereira', 'user36@fe.up.pt', '5B8346507DDFD4AEF39C12521ECA6ED82689C7090A3E7312F0BA3D17421BB3B2', '1991-05-22', TRUE, FALSE, FALSE, FALSE, 'The 36th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Cavaco Silva', 'user37@fe.up.pt', 'EDF755F83215D530C9BD95767A13BB7BD5BDB8F5D5108ACEFCD605A00FBEE1F1', '1992-06-26', TRUE, FALSE, FALSE, FALSE, 'The 37th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Ricardo Pereira', 'user38@fe.up.pt', 'D10AD22165F21254074DA55C9E5FEE50A2D1DD16286B6B0EAD1698AA6AFB930F', '1993-07-30', TRUE, FALSE, FALSE, FALSE, 'The 38th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('André Almeida', 'user39@fe.up.pt', 'C86FD59FBCE597E2534E56EACE209EF7139529BC5B1624AD700673FDCA88B33D', '1994-08-21', TRUE, FALSE, FALSE, FALSE, 'The 39th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Maria Rito', 'user40@fe.up.pt', 'A9709902614CB2D8F66D811D4032B79FBD311AA73E9D0FE41A9B9B93464CC6FB', '1995-04-12', TRUE, FALSE, FALSE, FALSE, 'The 40th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Sara Morais', 'user41@fe.up.pt', '46445B968117080EB11361F904342868D5A19B69291B876901FA7C6BCA65F5FA', '1992-11-21', TRUE, FALSE, FALSE, FALSE, 'The 41st best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Maria Beatriz', 'user42@fe.up.pt', '5B8346507DDFD4AEF39C12521ECA6ED82689C7090A3E7312F0BA3D17421BB3B2', '1993-11-26', TRUE, FALSE, FALSE, FALSE, 'The 42nd best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Bruno Guerra', 'user43@fe.up.pt', 'DA34262C62CDE67274D3452AECCCE39676A73249800FA9316532D8B8F2E5055B', '1995-03-16', TRUE, FALSE, FALSE, FALSE, 'The 43rd best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Gonçalo Raposo', 'user44@fe.up.pt', 'D10AD22165F21254074DA55C9E5FEE50A2D1DD16286B6B0EAD1698AA6AFB930F', '1994-02-15', TRUE, FALSE, FALSE, FALSE, 'The 44th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Tiago Oliveira', 'user45@fe.up.pt', 'A9709902614CB2D8F66D811D4032B79FBD311AA73E9D0FE41A9B9B93464CC6FB', '1990-04-28', TRUE, FALSE, FALSE, FALSE, 'The 45th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Raul Pires', 'user46@fe.up.pt', 'D10AD22165F21254074DA55C9E5FEE50A2D1DD16286B6B0EAD1698AA6AFB930F', '1991-05-12', TRUE, FALSE, FALSE, FALSE, 'The 46th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Isabel Graça', 'user47@fe.up.pt', 'C86FD59FBCE597E2534E56EACE209EF7139529BC5B1624AD700673FDCA88B33D', '1992-12-16', TRUE, FALSE, FALSE, FALSE, 'The 47th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Cristiano Reinaldo', 'user48@fe.up.pt', 'DA34262C62CDE67274D3452AECCCE39676A73249800FA9316532D8B8F2E5055B', '1995-07-31', TRUE, FALSE, FALSE, FALSE, 'The 48th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Lionel Messias', 'user49@fe.up.pt', 'A9709902614CB2D8F66D811D4032B79FBD311AA73E9D0FE41A9B9B93464CC6FB', '1997-02-22', TRUE, FALSE, FALSE, FALSE, 'The 49th best !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Kylian Mdoipé', 'user50@fe.up.pt', 'D10AD22165F21254074DA55C9E5FEE50A2D1DD16286B6B0EAD1698AA6AFB930F', '1999-03-05', TRUE, FALSE, FALSE, FALSE, 'The 50th best !');

    --Stock Manager
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Luís Alexandre', 'sm1@fe.up.pt', '544F96FB9F4647141FA50A040D37712E67EC374EAAB231193B5FB56E8EA774F0', '1998-03-30', TRUE, TRUE, FALSE, FALSE, 'I am StockManager1 !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Inês Faustino', 'sm2@fe.up.pt', '544F96FB9F4647141FA50A040D37712E67EC374EAAB231193B5FB56E8EA774F0', '1996-04-21', TRUE, TRUE, FALSE, FALSE, 'I am StockManager2 !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Leonor Silva', 'sm3@fe.up.pt', '544F96FB9F4647141FA50A040D37712E67EC374EAAB231193B5FB56E8EA774F0', '1999-06-12', TRUE, TRUE, FALSE, FALSE, 'I am StockManager3 !');

    --Moderator
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('João Alves', 'm1@fe.up.pt', 'CFDE2CA5188AFB7BDD0691C7BEF887BABA78B709AADDE8E8C535329D5751E6FE', '1995-07-30', TRUE, FALSE, TRUE, FALSE, 'I am Moderator1 !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Adolfo Dias', 'm2@fe.up.pt', 'CFDE2CA5188AFB7BDD0691C7BEF887BABA78B709AADDE8E8C535329D5751E6FE', '1997-08-21', TRUE, FALSE, TRUE, FALSE, 'I am Moderator2 !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Tiago Castro', 'm3@fe.up.pt', 'CFDE2CA5188AFB7BDD0691C7BEF887BABA78B709AADDE8E8C535329D5751E6FE', '1993-05-12', TRUE, FALSE, TRUE, FALSE, 'I am Moderator3 !');

    --Submission Manager
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Diamantino da Silva', 'subm1@fe.up.pt', '940DA794CFFFF6CBC494C0AA767E7AF19F5C053466E45F1651CC47FFEDB2340B', '1998-04-02', TRUE, FALSE, FALSE, TRUE, 'I am SubmissionManager1 !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Joaquim Fausto', 'subm2@fe.up.pt', '940DA794CFFFF6CBC494C0AA767E7AF19F5C053466E45F1651CC47FFEDB2340B', '1996-08-22', TRUE, FALSE, FALSE, TRUE, 'I am SubmissionManager2 !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Quim Possível', 'subm3@fe.up.pt', '940DA794CFFFF6CBC494C0AA767E7AF19F5C053466E45F1651CC47FFEDB2340B', '1997-01-02', TRUE, FALSE, FALSE, TRUE, 'I am SubmissionManager3 !');

    --Admins
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Bruna Sousa', 'admin1@fe.up.pt', '8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918', '1998-02-02', TRUE, TRUE, TRUE, TRUE, 'I am Admin1 !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Antero Ferreira', 'admin2@fe.up.pt', '8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918', '1994-05-12', TRUE, TRUE, TRUE, TRUE, 'I am Admin2 !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Pedro Viveiros', 'admin3@fe.up.pt', '8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918', '1997-11-22', TRUE, TRUE, TRUE, TRUE, 'I am Admin3 !');
INSERT INTO users (name, email, password, birth_date, active, stock_manager, moderator, submission_manager, user_description) VALUES ('Jorge Novo', 'admin4@fe.up.pt', '8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918', '1998-10-30', TRUE, TRUE, TRUE, TRUE, 'I am Admin4 !');


-- Table: faq
INSERT INTO faq (question, answer) VALUES ('How can I buy a product ?', '  To buy a product, you need to click "Products" in the navigation bar to show the products dropdown.
  There, you can choose the type of the product that you want. You can also search for a product in the
  search bar of the navigation bar. When you get to one of this pages, you can choose one of the products.
  In that specific product page, you can buy the item immediately or you can add it to your cart and buy
  it later. Both of these actions can be accomplished through two buttons present on that page.');

INSERT INTO faq (question, answer) VALUES ('How can I create an account ?', 'To create an account, you need to press the User icon in the navigation bar, followed by the option Sign-up
in the dropdown that appeared.');


INSERT INTO faq (question, answer) VALUES ('How can I add a product to my wishlist ?', 'To add a product to your wishlist, you have to be logged in. In the products page you should press the button
"Add to wishlist."');

INSERT INTO faq (question, answer) VALUES ('How can I create a design ?', 'If you want to submit your own design, you have to be logged int and then press the "Submit your design"
button on the navigation bar. There you have to fill the various fields regarding your desing and then submit it.');

INSERT INTO faq (question, answer) VALUES ('How can I vote on a desing ?','To vote on a design, you have to log in and then click on the "Upcomig"button on the navigation bar.
There you have several polls of designs made by other users. To vote on a design, you should press the heart
button that appears on the product that you put the cursor on. Your vote is registed when that button gains
color.');

-- Table: size
INSERT INTO size (size) VALUES ('XS');
INSERT INTO size (size) VALUES ('S');
INSERT INTO size (size) VALUES ('M');
INSERT INTO size (size) VALUES ('L');
INSERT INTO size (size) VALUES ('XL');


-- Table: color
INSERT INTO color (color) VALUES ('Black');
INSERT INTO color (color) VALUES ('Grey');
INSERT INTO color (color) VALUES ('White');
INSERT INTO color (color) VALUES ('Red');

INSERT INTO product_color (id_product, id_color) VALUES (1, 1);
INSERT INTO product_color (id_product, id_color) VALUES (1, 2);
INSERT INTO product_color (id_product, id_color) VALUES (1, 3);
INSERT INTO product_color (id_product, id_color) VALUES (1, 4);

INSERT INTO product_size (id_product, id_size) VALUES (1, 1);
INSERT INTO product_size (id_product, id_size) VALUES (1, 2);
INSERT INTO product_size (id_product, id_size) VALUES (1, 3);
INSERT INTO product_size (id_product, id_size) VALUES (1, 4);
INSERT INTO product_size (id_product, id_size) VALUES (1, 5);

-- Table: wishlist
INSERT INTO wishlist (id_user,  id_product) VALUES (1, 1);
INSERT INTO wishlist (id_user,  id_product) VALUES (1, 3);
INSERT INTO wishlist (id_user,  id_product) VALUES (1, 13);
INSERT INTO wishlist (id_user,  id_product) VALUES (6, 3);
INSERT INTO wishlist (id_user,  id_product) VALUES (6, 5);
INSERT INTO wishlist (id_user,  id_product) VALUES (6, 6);
INSERT INTO wishlist (id_user,  id_product) VALUES (2, 50);
INSERT INTO wishlist (id_user,  id_product) VALUES (10, 32);
INSERT INTO wishlist (id_user,  id_product) VALUES (10, 31);
INSERT INTO wishlist (id_user,  id_product) VALUES (10, 2);
INSERT INTO wishlist (id_user,  id_product) VALUES (10, 1);
INSERT INTO wishlist (id_user,  id_product) VALUES (11, 1);
INSERT INTO wishlist (id_user,  id_product) VALUES (13, 40);
INSERT INTO wishlist (id_user,  id_product) VALUES (14, 64);
INSERT INTO wishlist (id_user,  id_product) VALUES (14, 74);
INSERT INTO wishlist (id_user,  id_product) VALUES (15, 48);
INSERT INTO wishlist (id_user,  id_product) VALUES (22, 13);
INSERT INTO wishlist (id_user,  id_product) VALUES (22, 14);
INSERT INTO wishlist (id_user,  id_product) VALUES (22, 15);
INSERT INTO wishlist (id_user,  id_product) VALUES (30, 77);
INSERT INTO wishlist (id_user,  id_product) VALUES (31, 75);
INSERT INTO wishlist (id_user,  id_product) VALUES (33, 47);
INSERT INTO wishlist (id_user,  id_product) VALUES (33, 15);
INSERT INTO wishlist (id_user,  id_product) VALUES (37, 5);
INSERT INTO wishlist (id_user,  id_product) VALUES (35, 9);
INSERT INTO wishlist (id_user,  id_product) VALUES (30, 4);
INSERT INTO wishlist (id_user,  id_product) VALUES (32, 3);
INSERT INTO wishlist (id_user,  id_product) VALUES (35, 1);
INSERT INTO wishlist (id_user,  id_product) VALUES (41, 80);
INSERT INTO wishlist (id_user,  id_product) VALUES (40, 56);
INSERT INTO wishlist (id_user,  id_product) VALUES (42, 33);
INSERT INTO wishlist (id_user,  id_product) VALUES (42, 72);
INSERT INTO wishlist (id_user,  id_product) VALUES (43, 60);
INSERT INTO wishlist (id_user,  id_product) VALUES (43, 40);
INSERT INTO wishlist (id_user,  id_product) VALUES (43, 10);

-- Table: cart
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (1, 1, 1, 1, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (1, 2, 2, 2, 2);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (2, 33, 3, 4, 3);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (2, 30, 1, 1, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (4, 40, 4, 2, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (7, 64, 1, 4, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (28, 74, 1, 1, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (26, 48, 3, 1, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (26, 13, 1, 1, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (1, 14, 3, 5, 2);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (40, 15, 1, 1, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (34, 77, 4, 3, 4);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (24, 75, 1, 3, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (28, 47, 2, 2, 2);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (13, 15, 1, 1, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (14, 1, 1, 4, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (15, 13, 2, 3, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (37, 1, 2, 3, 3);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (35, 12, 1, 1, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (7, 1, 1, 1, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (5, 31, 1, 1, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (2, 36, 2, 1, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (4, 42, 1, 1, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (12, 50, 3, 3, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (27, 54, 3, 1, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (33, 55, 4, 3, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (32, 1, 1, 1, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (33, 1, 2, 1, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (14, 22, 1, 1, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (15, 1, 2, 4, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (14, 23, 1, 5, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (7, 33, 1, 1, 2);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (3, 1, 1, 3, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (3, 2, 2, 2, 1);
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (3, 3, 3, 1, 2);

-- Table: city
INSERT INTO city (city) VALUES ('Viseu');
INSERT INTO city (city) VALUES ('Porto');
INSERT INTO city (city) VALUES ('Aveiro');
INSERT INTO city (city) VALUES ('Lisboa');
INSERT INTO city (city) VALUES ('Samil');
INSERT INTO city (city) VALUES ('Santarem');
INSERT INTO city (city) VALUES ('Braga');
INSERT INTO city (city) VALUES ('Ranhados');
INSERT INTO city (city) VALUES ('Faro');
INSERT INTO city (city) VALUES ('Fatima');
INSERT INTO city (city) VALUES ('Viana do Castelo');

-- Table: delivery_info
INSERT INTO delivery_info (id_city, contact, delivery_address) VALUES (1, '967112935', 'Rua de Viseu, lote 1');
INSERT INTO delivery_info (id_city, contact, delivery_address) VALUES (2, '922376127', 'Rua de Paranhos, 276');
INSERT INTO delivery_info (id_city, contact, delivery_address) VALUES (2, '922322271', 'Quinta do Jose, 3, 2D');
INSERT INTO delivery_info (id_city, contact, delivery_address) VALUES (2, '962111127', 'Rua dos Santos, 17');
INSERT INTO delivery_info (id_city, contact, delivery_address) VALUES (4, '965374811', 'Rua das Garrafas, 11, 3 direito');
INSERT INTO delivery_info (id_city, contact, delivery_address) VALUES (4, '966653748', 'Rua de Lisboa, 1');
INSERT INTO delivery_info (id_city, contact, delivery_address) VALUES (3, '922234522', 'Rua em Aveiro, lote 77, Aveiro');
INSERT INTO delivery_info (id_city, contact, delivery_address) VALUES (5, '914646463', 'Rua do Tomas, lote 69');
INSERT INTO delivery_info (id_city, contact, delivery_address) VALUES (7, '911113242', 'Rua tres, lote 3');
INSERT INTO delivery_info (id_city, contact, delivery_address) VALUES (8, '966969696', 'Quinta dos tomilhos, lt 12, 2o direto');
INSERT INTO delivery_info (id_city, contact, delivery_address) VALUES (2, '926969696', 'Avenida da Liberdade, lt 150');
INSERT INTO delivery_info (id_city, contact, delivery_address) VALUES (2, '969696773', 'Rua Joao Pedro, 111');
INSERT INTO delivery_info (id_city, contact, delivery_address) VALUES (1, '962222222', 'Urbanizacao Ze Chilo, lote 35, 2 direito');

-- Table: purchase
INSERT INTO purchase (id_user, id_deli_info, purchase_date, total, status) VALUES (1, 1, '2019-02-03 12:40:24', 1, 'processing');
INSERT INTO purchase (id_user, id_deli_info, purchase_date, total, status) VALUES (2, 2, '2019-01-05 03:22:05', 1, 'awaiting_payment');
INSERT INTO purchase (id_user, id_deli_info, purchase_date, total, status) VALUES (10, 3, '2019-03-30 15:10:10', 1, 'in_transit');
INSERT INTO purchase (id_user, id_deli_info, purchase_date, total, status) VALUES (22, 4, '2019-02-01 19:34:22', 1, 'delivered');
INSERT INTO purchase (id_user, id_deli_info, purchase_date, total, status) VALUES (22, 4, '2019-01-02 20:56:12', 1, 'canceled');
INSERT INTO purchase (id_user, id_deli_info, purchase_date, total, status) VALUES (33, 6, '2019-02-09 07:32:43', 1, 'delivered');
INSERT INTO purchase (id_user, id_deli_info, purchase_date, total, status) VALUES (36, 7, '2019-03-14 12:41:56', 1, 'awaiting_payment');
INSERT INTO purchase (id_user, id_deli_info, purchase_date, total, status) VALUES (37, 8, '2019-01-29 11:12:31', 1, 'processing');
INSERT INTO purchase (id_user, id_deli_info, purchase_date, total, status) VALUES (30, 9, '2019-02-13 10:06:33', 1, 'awaiting_payment');
INSERT INTO purchase (id_user, id_deli_info, purchase_date, total, status) VALUES (6, 10, '2019-01-05 14:54:45', 1, 'in_transit');
INSERT INTO purchase (id_user, id_deli_info, purchase_date, total, status) VALUES (8, 11, '2019-03-06 17:44:55', 1, 'in_transit');
INSERT INTO purchase (id_user, id_deli_info, purchase_date, total, status) VALUES (10, 3, '2019-02-12 18:33:43', 1, 'processing');
INSERT INTO purchase (id_user, id_deli_info, purchase_date, total, status) VALUES (31, 12, '2019-01-10 14:12:36', 1, 'delivered');
INSERT INTO purchase (id_user, id_deli_info, purchase_date, total, status) VALUES (1, 1, '2019-02-20 12:06:30', 1, 'processing');

-- Table: product_purchase
INSERT INTO product_purchase (id_product, id_purchase, quantity, price, id_size, id_color) VALUES (1, 4, 1, 1, 1, 2);
INSERT INTO product_purchase (id_product, id_purchase, quantity, price, id_size, id_color) VALUES (4, 6, 1, 1, 2, 3);
INSERT INTO product_purchase (id_product, id_purchase, quantity, price, id_size, id_color) VALUES (15, 1, 2, 1, 4, 2);
INSERT INTO product_purchase (id_product, id_purchase, quantity, price, id_size, id_color) VALUES (70, 3, 1, 1, 3, 1);
INSERT INTO product_purchase (id_product, id_purchase, quantity, price, id_size, id_color) VALUES (52, 14, 1, 1, 1, 2);
INSERT INTO product_purchase (id_product, id_purchase, quantity, price, id_size, id_color) VALUES (11, 13, 1, 1, 1, 1);
INSERT INTO product_purchase (id_product, id_purchase, quantity, price, id_size, id_color) VALUES (11, 12, 2, 1, 2, 2);
INSERT INTO product_purchase (id_product, id_purchase, quantity, price, id_size, id_color) VALUES (15, 10, 1, 1, 2, 1);
INSERT INTO product_purchase (id_product, id_purchase, quantity, price, id_size, id_color) VALUES (26, 5, 1, 1, 2, 1);
INSERT INTO product_purchase (id_product, id_purchase, quantity, price, id_size, id_color) VALUES (30, 2, 1, 1, 3, 2);
INSERT INTO product_purchase (id_product, id_purchase, quantity, price, id_size, id_color) VALUES (66, 8, 3, 1, 3, 4);
INSERT INTO product_purchase (id_product, id_purchase, quantity, price, id_size, id_color) VALUES (69, 9, 1, 1, 1, 3);
INSERT INTO product_purchase (id_product, id_purchase, quantity, price, id_size, id_color) VALUES (7, 7, 1, 1, 4, 3);
INSERT INTO product_purchase (id_product, id_purchase, quantity, price, id_size, id_color) VALUES (9, 11, 1, 1, 1, 1);

-- Table: review
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (1,1, 'Great hoodie. Beautiful. MIEIC is awsome','2019-02-08 15:40:24', 4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (2,4, 'Liked the hoodie.','2019-02-05 07:22:05', 3.5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (10,15, 'Funny phone case ! The water resistant is amazing. I recommend !','2019-04-05 18:10:10', 4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (22,70, 'Funny mousepad. But not very resistent','2019-02-06 14:34:22', 2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (22,52, 'Totally worth this workshop. I learned so much.','2019-01-04 21:56:12', 4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (33,11, 'This hoodie is amazing and confortable','2019-02-19 07:32:43', 4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (36,11, 'Nice hoodie to wear in winter and represent the programmers.','2019-03-19 12:41:56', 4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (37,15, 'Liked this case so much ! And it is resistent !!.','2019-01-29 13:12:31', 4.5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (30,26, 'My room is incredible with this poster ! Amazing.','2019-04-29 16:12:31', 5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (6,30, 'I offered this poster to my roommate and he loved it','2019-04-02 13:22:31', 4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (8,66, 'Nice mousepad but came with defect','2019-04-03 18:22:31', 3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (10,69, 'Funny mousepad, I really recommend it !','2019-04-06 02:22:31', 4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (31,7, 'I wear this hoodie almost everyday. Nice to use while programming','2019-04-09 07:22:31', 4.5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (1,9, 'Liked this hoodie a lot. I recommend it','2019-04-19 17:22:31', 4);

-- Table: poll
INSERT INTO poll(poll_name, poll_date, expiration, active) VALUES ('Hoodies 2019', '2019-03-01', '2019-07-15', TRUE);
INSERT INTO poll(poll_name, poll_date, expiration, active) VALUES ('Mugs 2019', '2019-05-03', '2019-09-17', TRUE);
INSERT INTO poll(poll_name, poll_date, expiration, active) VALUES ('Pads 2019', '2019-03-02', '2019-07-16', TRUE);
INSERT INTO poll(poll_name, poll_date, expiration, active) VALUES ('Various 2019', '2019-03-02', '2019-07-16', TRUE);

-- Table: submission
INSERT INTO submission(id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (3, 'Awsome Hoodie', 1, 'Hoodie just for awsomes', 'img/submissions/awsomeHoodie.jpg', '2019-01-08', TRUE, 0, FALSE, 1);
INSERT INTO submission(id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (12, 'Feature Mug', 4, 'No bugs, only features mug !', 'img/submissions/feature.jpg', '2019-06-06', TRUE, 0, FALSE, 2);
INSERT INTO submission(id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (27, 'CSS Mug', 4, 'Funny mug about css', 'img/submissions/css.jpeg', '2019-01-06', TRUE, 0, FALSE, 2);
INSERT INTO submission(id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (7, 'Quiet Sticker', 2, 'Silence, a programmer is working', 'img/submissions/quiet.png', '2019-01-01', TRUE, 0, FALSE, 4);
INSERT INTO submission(id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (14, 'MyMachine Mug', 4, 'It works on my machine !', 'img/submissions/myMachine.jpg', '2019-02-04', TRUE, 0, FALSE, 2);
INSERT INTO submission(id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (16, 'Math Pad', 5, 'Good with Math !', 'img/submissions/math.jpeg', '2019-02-11', TRUE, 0, FALSE, 3);
INSERT INTO submission(id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (9, 'Coding Case', 6, 'Brackets phone case', 'img/submissions/coding.jpg', '2019-01-12', TRUE, 0, FALSE, 4);
INSERT INTO submission(id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (32, 'Coders Case', 6, 'Coder gonna code !', 'img/submissions/coders.jpg', '2019-01-02', FALSE, 0, FALSE, NULL);

INSERT INTO submission(id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (1, 'Cloud Sticker', 2, 'Binary sticker with cloud', 'img/submissions/cloud.jpg', '2019-01-04', TRUE, 0, FALSE, 4);
INSERT INTO submission(id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (7, 'Love Case', 6, 'I love you case', 'img/submissions/love.jpeg', '2019-02-13', TRUE, 0, FALSE, 4);
INSERT INTO submission(id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (4, 'Feature Poster', 3, 'Features ftw', 'img/submissions/feature.jpeg', '2019-02-07', TRUE, 0, FALSE, 4);
INSERT INTO submission(id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (2, 'Friends Pad', 5, 'Pivot mixed with Friends mouse pad', 'img/submissions/friends.jpg', '2019-01-13', TRUE, 0, FALSE, 3);
INSERT INTO submission(id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (30, 'Keep Calm Poster', 3, 'Keep calm poster', 'img/submissions/loveprogramming.png', '2019-06-07', FALSE, 0, FALSE, 4);
INSERT INTO submission(id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (33, 'Challenge Accepted Pad', 1, 'Will you accept it ?', 'img/submissions/challenge.jpeg', '2019-02-12', FALSE, 0, FALSE, NULL);

INSERT INTO submission(id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (10, 'Black Belt Hoodie', 1, 'Black belt in programming', 'img/submissions/blackbelt.jpeg', '2019-05-15', TRUE, 0, FALSE, 1);
INSERT INTO submission(id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (7, 'Eat Sleep Code Hoodie', 1, 'Eat. Sleep. Code. Repeat.', 'img/submissions/esc.jpg', '2019-02-17', TRUE, 0, FALSE, 1);
INSERT INTO submission(id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (10, 'Coffee to Code Hoodie', 1, 'Best conversion', 'img/submissions/coffee.jpg', '2019-03-05', TRUE, 0, FALSE, 1);
INSERT INTO submission(id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (2, 'Binary Poster', 3, '011101010110010', 'img/submissions/binary.jpg', '2019-02-13', TRUE, 0, FALSE, 4);
INSERT INTO submission(id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (23, 'Still Alive Case', 6, 'While alive: sleep eat code repeat !', 'img/submissions/stillAlive.jpg', '2019-01-25', TRUE, 0, FALSE, 4);
INSERT INTO submission(id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (45, 'Code Pad', 5, 'I write code', 'img/submissions/code.jpg', '2019-02-25', FALSE, 0, FALSE, 3);

-- Table: user_sub_vote
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (10, 2);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (15, 3);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (20, 4);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (23, 7);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (45, 15);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (11, 12);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (7, 7);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (3, 15);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (12, 13);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (2, 20);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (17, 1);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (29, 6);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (41, 7);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (20, 13);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (37, 9);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (29, 8);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (25, 7);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (36, 18);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (41, 19);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (39, 12);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (19, 2);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (5, 2);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (2, 3);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (1, 4);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (11, 7);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (9, 17);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (15, 16);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (23, 6);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (47, 5);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (36, 15);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (33, 8);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (28, 11);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (15, 1);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (44, 3);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (22, 2);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (33, 2);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (31, 5);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (47, 8);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (45, 9);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (30, 19);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (20, 17);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (10, 3);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (16, 1);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (43, 13);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (49, 20);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (45, 14);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (33, 1);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (38, 5);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (28, 6);
INSERT INTO user_sub_vote (id_user, id_sub) VALUES (18, 7);
