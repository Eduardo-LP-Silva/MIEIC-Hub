PRAGMA foreign_keys = on;

-- Table: user
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (1, "up201604503", "up201604503@fe.up.pt", "123456789", 1998-07-31, TRUE, FALSE, FALSE, FALSE, 1, "I'm the best !");


-- Table: category
INSERT INTO category (id_category, category) VALUES (1, "Apparel");
INSERT INTO category (id_category, category) VALUES (2, "Phone Cases");
INSERT INTO category (id_category, category) VALUES (3, "Stickers");
INSERT INTO category (id_category, category) VALUES (4, "Posters");
INSERT INTO category (id_category, category) VALUES (5, "Tickets");
INSERT INTO category (id_category, category) VALUES (6, "Mouse Pads");
INSERT INTO category (id_category, category) VALUES (7, "Mugs");


-- Table: product

    -- Apparel
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (1, "Sudo Rm Hoodie", "Funny hoodie allusive to LINUX commands. For MIEIC students. 100% poliester.", 14.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (2, "FEUP Hoodie", "Black hoodie for FEUP students. 100% poliester.", 14.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (3, "Hard Code Hoodie", "Funny hoodie allusive to Hard Rock Caffe. For MIEIC students. 100% poliester.", 14.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (4, "StarCode Hoodie", "Funny hoodie allusive to Starbucks Caffe. For MIEIC students. 100% poliester.", 14.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (5, "MIEIC Jacket", "Black jacket for MIEIC students. 100% poliester.", 19.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (6, "Mouse Hoodie", "Hoodie with a mouse for MIEIC students. 100% poliester.", 14.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (7, "Loading Hoodie", "Funny hoodie with loading bar. For MIEIC students. 100% poliester.", 14.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (8, "Floppy Disk Hoodie", "Hoodie with a floppy disk. For MIEIC students. 100% poliester.", 14.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (9, "E HTML Jacket", "Jacket with loading and E instead the classic 5 on HTML logo. For MIEIC students. 100% poliester.", 19.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (10, "FEUP Hoodie 2", "Hoodie for FEUP students. 100% poliester.", 14.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (11, "Fernando Pessoa Hoodie", "Hoodie for MIEIC students. 100% poliester.", 14.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (12, "Programmer Hoodie", "Grey hoodie for MIEIC students. 100% poliester.", 14.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (13, "Semi Colon Hoodie", "Hoodie for MIEIC students. 100% poliester.", 14.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (14, "Author Jacket", "Jacket for MIEIC students. 100% poliester.", 19.99, 2.99, 50, 0, 1);

    --Phone Cases
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (15, "MIEIC Case", "Case for MIEIC students. Water resistant.", 9.99, 1.99, 50, 0, 2);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (16, "FEUP Case", "Case for FEUP students. Water resistant.", 9.99, 1.99, 50, 0, 2);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (17, "Eat Sleep Code Repeat Case", "Case for MIEIC students. Water resistant.", 9.99, 1.99, 50, 0, 2);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (18, "Bill Gates Case", "Case for MIEIC students. Water resistant.", 9.99, 1.99, 50, 0, 2);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (19, "E HTML Case", "Case for MIEIC students. Water resistant.", 9.99, 1.99, 50, 0, 2);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (20, "MIEIC Army Case", "Case for MIEIC students. Water resistant.", 9.99, 1.99, 50, 0, 2);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (21, "MIEIC Army 2 Case", "Case for MIEIC students. Water resistant.", 9.99, 1.99, 50, 0, 2);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (22, "MIEIC Case", "Case for MIEIC students. Water resistant.", 9.99, 1.99, 50, 0, 2);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (23, "Coding Case", "Case for MIEIC students. Water resistant.", 9.99, 2.99, 50, 0, 2);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (24, "The HTML to my CSS Case", "Case for MIEIC students. Water resistant.", 9.99, 2.99, 50, 0, 2);
    
    --Posters
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (25, "Today Poster", "A3 poster related to programmers", 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (26, "Anonymous1 Poster", "A3 poster related to programmers", 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (27, "Anonymous2 Poster", "A3 poster related to programmers", 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (28, "Hackerman Poster", "A3 poster related to programmers", 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (29, "TensionRelease Poster", "A3 poster related to programmers", 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (30, "In Code We Trust Poster", "A3 poster related to programmers", 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (31, "Keep Calm Poster", "A3 poster related to programmers", 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (32, "I Love Coding Poster", "A3 poster related to programmers", 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (33, "SETUP Poster", "A3 poster related to programmers", 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (34, "Eat Sleep Code Repeat Poster", "A3 poster related to programmers", 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (35, "Semi Colon Poster", "A3 poster related to programmers", 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (36, "Super Bock Poster", "A3 poster related to programmers", 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (37, "World Poster", "A3 poster related to programmers", 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (38, "MIEIC Army Poster", "A3 poster related to programmers", 9.99, 2.99, 50, 0, 4);

    --Stickers
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (39, "MIEIC Sticker", "Laptop Sticker.", 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (40, "FEUP Sticker", "Laptop sticker.", 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (39, "Coffee Sticker", "Laptop Sticker.", 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (40, "Home Sticker", "Laptop sticker.", 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (41, "HTML Sticker", "Laptop Sticker.", 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (42, "Blackbelt Sticker", "Laptop sticker.", 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (43, "Nike Sticker", "Laptop sticker.", 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (44, "Titanic Sticker", "Laptop sticker.", 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (45, "False Sticker", "Laptop sticker.", 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (46, "Java Sticker", "Laptop sticker.", 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (47, "Combo Stickers", "Laptop stickers.", 14.99, 0.99, 50, 0, 3);


    --Tickets
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (48, "HTML Ticket", "Ticket for workshop to learn to code in HTML.", 1.99, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (49, "CSS Ticket", "Ticket for workshop to learn to code in  CSS.", 0.99, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (50, "Java Ticket", "Ticket for workshop to learn to code in JAVA.", 4.99, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (51, "C/C++ Ticket", "Ticket for workshop to learn to code in C/C++.", 4.99, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (52, "Python Ticket", "Ticket for workshop to learn to code in Python.", 1.99, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (53, "SQL Ticket", "Ticket for workshop to learn to code in SQL.", 1.99, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (54, "Dr.Scheme Ticket", "Ticket for workshop to learn to code in Dr.Scheme.", 0.00, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (55, "Google Talks", "Ticket for lecture with Google engineer.", 9.99, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (56, "PPIN Talks", "Ticket for lecture to learn about personal and interpersonal proficiency.", 0.00, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (57, "PHP Ticket", "Ticket for workshop to learn to code in PHP", 1.99, 0.99, 50, 0, 5);

    --Mouse Pads
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (58, "PPIN Talks", "Ticket for lecture to learn about personal and interpersonal proficiency.", 0.00, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (59, "PHP Ticket", "Ticket for workshop to learn to code in PHP", 1.99, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (60, "PPIN Talks", "Ticket for lecture to learn about personal and interpersonal proficiency.", 0.00, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (61, "PHP Ticket", "Ticket for workshop to learn to code in PHP", 1.99, 0.99, 50, 0, 5);




-- Table: faq
INSERT INTO faq (id_question, question, answer) VALUES (1, "Question 1: How can I buy a product ?", "  To buy a product, you need to click 'Products' in the navigation bar to show the products dropdown.
  There, you can choose the type of the product that you want. You can also search for a product in the
  search bar of the navigation bar. When you get to one of this pages, you can choose one of the products.
  In that specific product page, you can buy the item immediately or you can add it to your cart and buy
  it later. Both of these actions can be accomplished through two buttons present on that page.");

INSERT INTO faq (id_question, question, answer) VALUES (2, "Question 2: How can I create an account ?", "To create an account, you need to press the User icon in the navigation bar, followed by the option Sign-up
in the dropdown that appeared.");


INSERT INTO faq (id_question, question, answer) VALUES (3, "Question 3: How can I add a product to my wishlist ?", "To add a product to your wishlist, you have to be logged in. In the product's page you should press the button
'Add to wishlist'.");

INSERT INTO faq (id_question, question, answer) VALUES (4, "Question 4: How can I create a design ?", "If you want to submit your own design, you have to be logged int and then press the 'Submit your design'
button on the navigation bar. There you have to fill the various fields regarding your desing and then submit it.");

INSERT INTO faq (id_question, question, answer) VALUES (5, "Question 5: How can I vote on a desing ?","To vote on a design, you have to log in and then click on the 'Upcomig' button on the navigation bar.
There you have several polls of designs made by other users. To vote on a design, you should press the heart
button that appears on the product that you put the cursor on. Your vote is registed when that button gains
color.");

-- Table: size
INSERT INTO size(id_size, size) VALUES (1, "Extra-Small");
INSERT INTO size(id_size, size) VALUES (2, "Small");
INSERT INTO size(id_size, size) VALUES (3, "Medium");
INSERT INTO size(id_size, size) VALUES (4, "Large");
INSERT INTO size(id_size, size) VALUES (5, "Extra-Large");
