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
DROP TRIGGER IF EXISTS update_purchase_price ON product_purchase;
DROP FUNCTION IF EXISTS update_product_review_delete();
DROP FUNCTION IF EXISTS update_product_review_insert();
DROP FUNCTION IF EXISTS add_submission_vote();
DROP FUNCTION IF EXISTS remove_submission_vote();
DROP FUNCTION IF EXISTS select_winner();
DROP FUNCTION IF EXISTS check_submission_vote();
DROP FUNCTION IF EXISTS update_purchase_total();

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
    delivery_cost FLOAT NOT NULL CHECK(delivery_cost > 0),
    stock INTEGER NOT NULL CHECK(stock >= 0),
    rating FLOAT NOT NULL CHECK(rating >= 0 AND rating <= 5),
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
    id_user SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    email TEXT UNIQUE NOT NULL,
    pw TEXT NOT NULL,
    birth_date DATE NOT NULL,
    active BOOLEAN NOT NULL, 
    stock_manager BOOLEAN NOT NULL,
    moderator BOOLEAN NOT NULL,
    submission_manager BOOLEAN NOT NULL,
    id_photo INTEGER NOT NULL REFERENCES photo ON UPDATE CASCADE ON DELETE CASCADE,
    user_description TEXT NOT NULL
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
    id_user INTEGER NOT NULL REFERENCES users ON UPDATE CASCADE,
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
    id_user INTEGER NOT NULL REFERENCES users ON UPDATE CASCADE,
    id_product INTEGER NOT NULL REFERENCES product ON UPDATE CASCADE,
    comment TEXT NOT NULL,
    review_date TIMESTAMP WITH TIME zone DEFAULT now() NOT NULL,
    rating INTEGER NOT NULL CHECK(rating > 0 AND rating <= 5),
    PRIMARY KEY (id_user, id_product)
);

CREATE TABLE cart
(
    id_user INTEGER NOT NULL REFERENCES users ON UPDATE CASCADE ON DELETE CASCADE,
    id_product INTEGER NOT NULL REFERENCES product ON UPDATE CASCADE,
    quantity INTEGER NOT NULL CHECK(quantity > 0),
    id_color INTEGER NOT NULL REFERENCES color ON UPDATE CASCADE,
    id_size INTEGER NOT NULL REFERENCES size ON UPDATE Cascade,
    PRIMARY KEY (id_user, id_product)
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
    poll_date DATE NOT NULL,
    expiration DATE NOT NULL,
    active BOOLEAN NOT NULL
);

CREATE TABLE submission
(
    id_submission SERIAL PRIMARY KEY,
    id_user INTEGER NOT NULL REFERENCES users ON UPDATE CASCADE,
    submission_name TEXT NOT NULL,
    id_category INTEGER NOT NULL REFERENCES category ON UPDATE CASCADE,
    submission_description TEXT NOT NULL,
    picture TEXT NOT NULL,
    submission_date TIMESTAMP WITH TIME zone DEFAULT now() NOT NULL,
    accepted BOOLEAN NOT NULL,
    votes INTEGER DEFAULT 0 NOT NULL CHECK(votes >= 0),
    winner BOOLEAN NOT NULL,
    id_poll INTEGER REFERENCES poll ON UPDATE CASCADE
);

CREATE TABLE user_sub_vote
(
    id_user INTEGER NOT NULL REFERENCES users ON UPDATE CASCADE ON DELETE CASCADE,
    id_sub INTEGER NOT NULL REFERENCES submission ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (id_user, id_sub)
);

-- Indexes

CREATE INDEX authenticate ON users(username, pw); 
CREATE INDEX id_category ON product USING hash(id_category); 
CREATE INDEX active_poll ON poll USING hash(active); 
CREATE INDEX sub_id_poll ON submission USING hash(id_poll); 
CREATE INDEX by_price ON product(price); 
CREATE INDEX search_users ON users USING GIST (to_tsvector('english', username || ' '));
CREATE INDEX search_products ON product USING GIST (to_tsvector('english', product_name || ' ' || product_description));

-- Triggers

CREATE FUNCTION add_submission_vote() RETURNS TRIGGER AS $BODY$
BEGIN
    UPDATE submission
    SET votes = votes + 1
    WHERE submission.id_submission = NEW.id_sub;
    RETURN NEW;
END; 
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER vote_on_design
AFTER INSERT ON user_sub_vote
FOR EACH ROW
EXECUTE PROCEDURE add_submission_vote();

CREATE FUNCTION remove_submission_vote() RETURNS TRIGGER AS $BODY$
BEGIN
    UPDATE submission
    SET votes = votes - 1
    WHERE submission.id_submission = OLD.id_sub;
    RETURN OLD;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER unvote_on_design
AFTER DELETE ON user_sub_vote
FOR EACH ROW
EXECUTE PROCEDURE remove_submission_vote();

CREATE FUNCTION update_product_review_insert() RETURNS TRIGGER AS $BODY$
BEGIN
    UPDATE product
    SET rating = 
    (
        SELECT AVG(review.rating)
        FROM review, product
        WHERE review.id_product = product.id_product AND review.id_product = NEW.id_product
    )
    WHERE NEW.id_product = product.id_product;
    RETURN NEW;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER review_insert
AFTER INSERT OR UPDATE ON review
FOR EACH ROW
EXECUTE PROCEDURE update_product_review_insert();

CREATE FUNCTION update_product_review_delete() RETURNS TRIGGER AS $BODY$
BEGIN
    UPDATE product
    SET rating = 
    (
        SELECT AVG(review.rating)
        FROM review, product
        WHERE review.id_product = product.id_product AND review.id_product = NEW.id_product
    )
    WHERE NEW.id_product = product.id_product;
    RETURN OLD;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER review_delete
AFTER DELETE ON review
FOR EACH ROW
EXECUTE PROCEDURE update_product_review_delete(); 

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
    IF NEW.active IS FALSE AND OLD.active IS TRUE THEN
        UPDATE submission
        SET winner = TRUE
        WHERE submission.id_poll = NEW.id_poll AND submission.votes = 
        (
            SELECT MAX(submission.votes)
            FROM submission, poll
            WHERE poll.id_poll = NEW.id_poll AND poll.id_poll = subission.id_poll
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
    UPDATE purchase
    SET total = 
    (
        SELECT sum(products_price)
        FROM
        (
            SELECT product_purchase.quantity * product_purchase.price AS products_price
            FROM product, purchase
            WHERE NEW.id_purchase = purchase.id_purchase AND purchase.id_product = product.id_product
        ) AS products_actual_price
    )
    WHERE NEW.id_purchase = purchase.id_purchase;
    RETURN NEW;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER update_purchase_price
AFTER INSERT OR UPDATE ON product_purchase
FOR EACH ROW
EXECUTE PROCEDURE update_purchase_total();
