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
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (41, "Coffee Sticker", "Laptop Sticker.", 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (42, "Home Sticker", "Laptop sticker.", 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (43, "HTML Sticker", "Laptop Sticker.", 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (44, "Blackbelt Sticker", "Laptop sticker.", 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (45, "Nike Sticker", "Laptop sticker.", 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (46, "Titanic Sticker", "Laptop sticker.", 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (47, "False Sticker", "Laptop sticker.", 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (48, "Java Sticker", "Laptop sticker.", 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (49, "Combo Stickers", "Laptop stickers.", 14.99, 0.99, 50, 0, 3);


    --Tickets
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (50, "HTML Ticket", "Ticket for workshop to learn to code in HTML.", 1.99, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (51, "CSS Ticket", "Ticket for workshop to learn to code in  CSS.", 0.99, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (52, "Java Ticket", "Ticket for workshop to learn to code in JAVA.", 4.99, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (53, "C/C++ Ticket", "Ticket for workshop to learn to code in C/C++.", 4.99, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (54, "Python Ticket", "Ticket for workshop to learn to code in Python.", 1.99, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (55, "SQL Ticket", "Ticket for workshop to learn to code in SQL.", 1.99, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (56, "Dr.Scheme Ticket", "Ticket for workshop to learn to code in Dr.Scheme.", 0.00, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (57, "Google Talks", "Ticket for lecture with Google engineer.", 9.99, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (58, "PPIN Talks", "Ticket for lecture to learn about personal and interpersonal proficiency.", 0.00, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (59, "PHP Ticket", "Ticket for workshop to learn to code in PHP", 1.99, 0.99, 50, 0, 5);
    --Mouse Pads
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (60, "MIEIC Mouse Pad", "Mouse pad for MIEIC students.", 9.99, 1.99, 50, 0, 6);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (61, "FEUP Mouse Pad", "Mouse pad for FEUP students", 9.99, 1.99, 50, 0, 6);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (62, "Go Away I'm Coding Mouse Pad", "Funny mouse pad. For programmers.", 9.99, 1.99, 50, 0, 6);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (63, "Errors Mouse Pad", "Funny mouse pad. For programmers.", 9.99, 1.99, 50, 0, 6);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (64, "Breaking Bad Mouse Pad", "Funny mouse pad. For programmers.", 9.99, 1.99, 50, 0, 6);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (65, "Eat Sleep Code Mouse Pad", "Funny mouse pad. For programmers.", 9.99, 1.99, 50, 0, 6);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (66, "Not A Bug Mouse Pad", "Funny mouse pad. For programmers.", 9.99, 1.99, 50, 0, 6);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (67, "Not A Robot Mouse Pad", "Funny mouse pad. For programmers.", 9.99, 1.99, 50, 0, 6);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (68, "Ninja Mouse Pad", "Funny mouse pad. For programmers.", 9.99, 1.99, 50, 0, 6);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (69, "Trust Me Mouse Pad", "Funny mouse pad. For programmers.", 9.99, 1.99, 50, 0, 6);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (70, "Best Programmer Ever Mouse Pad", "Funny mouse pad. For programmers.", 9.99, 1.99, 50, 0, 6);

    --Mugs
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (71, "MIEIC Mug", "Mug for MIEIC students.", 9.99, 1.99, 50, 0, 7);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (72, "FEUP Mug", "Mug for FEUP students.", 9.99, 1.99, 50, 0, 7);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (73, "I'm A Programmer Mug", "Funny mug. For programmers.", 9.99, 1.99, 50, 0, 7);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (74, "CSS Mug", "Funny mug. For programmers.", 9.99, 1.99, 50, 0, 7);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (75, "Debug Mug", "Funny mug. For programmers.", 9.99, 1.99, 50, 0, 7);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (76, "Why Mug", "Funny mug. For programmers.", 9.99, 1.99, 50, 0, 7);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (77, "Gamer Mug", "Funny mug. For programmers.", 9.99, 1.99, 50, 0, 7);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (78, "Offline Mug", "Funny mug. For programmers.", 9.99, 1.99, 50, 0, 7);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (79, "Break Mug", "Funny mug. For programmers.", 9.99, 1.99, 50, 0, 7);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (80, "Coffee Mug", "Funny mug. For programmers.", 9.99, 1.99, 50, 0, 7);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (81, "Errors Mug", "Funny mug. For programmers.", 9.99, 1.99, 50, 0, 7);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (82, "Sleep Mug", "Funny mug. For programmers.", 9.99, 1.99, 50, 0, 7);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (83, "Go Away Mug", "Funny mug. For programmers.", 9.99, 1.99, 50, 0, 7);


-- Table: photo
INSERT INTO photo (id_photo, image_path, id_product) VALUES (1, "~/html/resources/images/apparel/hoodie_sudo_rm.jpg", 1);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (2, "~/html/resources/images/apparel/hoodie_sudo_rm_single.jpg", 1);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (3, "~/html/resources/images/apparel/hoodie_1.jpg", 2);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (4, "~/html/resources/images/apparel/hoodie_1_single.jpg", 2);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (5, "~/html/resources/images/apparel/hoodie_1_red.jpg", 3);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (6, "~/html/resources/images/apparel/hoodie_1_red_single.jpg", 3);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (7, "~/html/resources/images/apparel/hoodie_2.jpg", 4);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (8, "~/html/resources/images/apparel/hoodie_2_single.jpg", 4);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (9, "~/html/resources/images/apparel/hoodie_2_smiley.jpg", 5);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (10, "~/html/resources/images/apparel/hoodie_2_smiley_single.jpg", 5);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (11, "~/html/resources/images/apparel/hoodie_3.jpg", 6);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (12, "~/html/resources/images/apparel/hoodie_3_single.jpg", 6);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (13, "~/html/resources/images/apparel/hoodie_5.jpg", 7);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (14, "~/html/resources/images/apparel/hoodie_6.jpg", 8);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (15, "~/html/resources/images/apparel/hoodie_10.jpg", 9);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (16, "~/html/resources/images/apparel/hoodie_example.jpg", 10);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (17, "~/html/resources/images/apparel/nando.jpg", 11);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (18, "~/html/resources/images/apparel/programmer.jpg", 12);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (19, "~/html/resources/images/apparel/programmer2.jpg", 13);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (20, "~/html/resources/images/apparel/author_jacket.jpg", 14);

INSERT INTO photo (id_photo, image_path, id_product) VALUES (21, "~/html/resources/images/cases/case_example.jpg", 15);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (22, "~/html/resources/images/cases/case_example.jpg", 16);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (23, "~/html/resources/images/cases/case_example.jpg", 17);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (24, "~/html/resources/images/cases/case_example.jpg", 18);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (25, "~/html/resources/images/cases/case_example.jpg", 19);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (26, "~/html/resources/images/cases/case_example.jpg", 20);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (27, "~/html/resources/images/cases/case_example.jpg", 21);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (28, "~/html/resources/images/cases/case_example.jpg", 22);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (29, "~/html/resources/images/cases/case_example.jpg", 23);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (30, "~/html/resources/images/cases/case_example.jpg", 24);

INSERT INTO photo (id_photo, image_path, id_product) VALUES (31, "~/html/resources/images/posters/today.jpg", 25);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (32, "~/html/resources/images/posters/anonymous1.jpg", 26;
INSERT INTO photo (id_photo, image_path, id_product) VALUES (33, "~/html/resources/images/posters/anonymous2.jpg", 27);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (34, "~/html/resources/images/posters/hackerman.jpg", 28);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (35, "~/html/resources/images/posters/release.jpg", 29);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (36, "~/html/resources/images/posters/in code.jpg", 30);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (37, "~/html/resources/images/posters/keep calm.jpg", 31);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (38, "~/html/resources/images/posters/lovecoding.jpg", 32);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (39, "~/html/resources/images/posters/SETUP.jpg", 33);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (40, "~/html/resources/images/posters/eat.jpg", 34);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (41, "~/html/resources/images/posters/semi.jpg", 35);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (42, "~/html/resources/images/posters/super.jpg", 36);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (43, "~/html/resources/images/posters/world.jpg", 37);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (44, "~/html/resources/images/posters/war_poster.jpg", 38);

INSERT INTO photo (id_photo, image_path, id_product) VALUES (45, "~/html/resources/images/stickers/feup.jpg", 39);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (46, "~/html/resources/images/stickers/feup.jpg", 40);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (47, "~/html/resources/images/stickers/coffee.jpg", 41);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (48, "~/html/resources/images/stickers/home.png", 42);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (49, "~/html/resources/images/stickers/html.jpg", 43);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (50, "~/html/resources/images/stickers/blackbelt.jpg", 44);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (51, "~/html/resources/images/stickers/nike.jpg", 45);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (52, "~/html/resources/images/stickers/titanic.jpg", 46);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (53, "~/html/resources/images/stickers/true.jpg", 47);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (54, "~/html/resources/images/stickers/java.png", 48);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (55, "~/html/resources/images/stickers/stickers.jpg", 49);

INSERT INTO photo (id_photo, image_path, id_product) VALUES (56, "~/html/resources/images/tickets/ticket.jpg", 50);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (57, "~/html/resources/images/tickets/ticket.jpg", 51);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (58, "~/html/resources/images/tickets/ticket.jpg", 52);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (59, "~/html/resources/images/tickets/ticket.png", 53);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (60, "~/html/resources/images/tickets/ticket.jpg", 54);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (61, "~/html/resources/images/tickets/ticket.jpg", 55);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (62, "~/html/resources/images/tickets/ticket.jpg", 56);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (63, "~/html/resources/images/tickets/ticket.jpg", 57);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (64, "~/html/resources/images/tickets/ticket.png", 58);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (65, "~/html/resources/images/tickets/ticket.jpg", 59);

INSERT INTO photo (id_photo, image_path, id_product) VALUES (66, "~/html/resources/images/mousepads/feup.jpg", 60);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (67, "~/html/resources/images/mousepads/feup.jpg", 61);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (68, "~/html/resources/images/mousepads/goAway.png", 62);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (69, "~/html/resources/images/mousepads/more.jpg", 63);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (70, "~/html/resources/images/mousepads/breaking.jpg", 64);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (71, "~/html/resources/images/mousepads/eat.jpg", 65);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (72, "~/html/resources/images/mousepads/feature.jpg", 66);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (73, "~/html/resources/images/mousepads/robot.jpg", 67);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (74, "~/html/resources/images/mousepads/ninja.jpg", 68);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (75, "~/html/resources/images/mousepads/trust me.jpeg", 69);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (76, "~/html/resources/images/mousepads/bestever.jpg", 70);

INSERT INTO photo (id_photo, image_path, id_product) VALUES (77, "~/html/resources/images/mugs/feup.jpg", 71);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (78, "~/html/resources/images/mugs/feup.jpg", 72);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (79, "~/html/resources/images/mugs/programmer.jpg", 73);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (80, "~/html/resources/images/mugs/css.jpg", 74);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (81, "~/html/resources/images/mugs/debug.jpg", 75);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (82, "~/html/resources/images/mugs/why.jpg", 76);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (83, "~/html/resources/images/mugs/gamer.jpg", 77);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (84, "~/html/resources/images/mugs/offline.jpg", 78);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (85, "~/html/resources/images/mugs/break.jpg", 79);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (86, "~/html/resources/images/mugs/coffee.jpg", 80);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (87, "~/html/resources/images/mugs/errors.jpg", 81);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (88, "~/html/resources/images/mugs/sleep.jpg", 82);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (89, "~/html/resources/images/mugs/goaway.png", 83);


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


-- Table: color
INSERT INTO color (id_color, color) VALUE (1, "Black");
INSERT INTO color (id_color, color) VALUE (2, "Grey");
INSERT INTO color (id_color, color) VALUE (1, "White");
INSERT INTO color (id_color, color) VALUE (1, "Red");