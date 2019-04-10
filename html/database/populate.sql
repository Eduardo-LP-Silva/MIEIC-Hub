--PRAGMA foreign_keys = ON;

-- Table: category
INSERT INTO category (id_category, category) VALUES (1, 'Apparel');
INSERT INTO category (id_category, category) VALUES (2, 'Phone Cases');
INSERT INTO category (id_category, category) VALUES (3, 'Stickers');
INSERT INTO category (id_category, category) VALUES (4, 'Posters');
INSERT INTO category (id_category, category) VALUES (5, 'Tickets');
INSERT INTO category (id_category, category) VALUES (6, 'Mouse Pads');
INSERT INTO category (id_category, category) VALUES (7, 'Mugs');

-- Table: product

    -- Apparel
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (1, 'Sudo Rm Hoodie', 'Funny hoodie allusive to LINUX commands. For MIEIC students. 100% poliester.', 14.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (2, 'FEUP Hoodie', 'Black hoodie for FEUP students. 100% poliester.', 14.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (3, 'Hard Code Hoodie', 'Funny hoodie allusive to Hard Rock Caffe. For MIEIC students. 100% poliester.', 14.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (4, 'StarCode Hoodie', 'Funny hoodie allusive to Starbucks Caffe. For MIEIC students. 100% poliester.', 14.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (5, 'MIEIC Jacket', 'Black jacket for MIEIC students. 100% poliester.', 19.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (6, 'Mouse Hoodie', 'Hoodie with a mouse for MIEIC students. 100% poliester.', 14.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (7, 'Loading Hoodie', 'Funny hoodie with loading bar. For MIEIC students. 100% poliester.', 14.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (8, 'Floppy Disk Hoodie', 'Hoodie with a floppy disk. For MIEIC students. 100% poliester.', 14.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (9, 'E HTML Jacket', 'Jacket with loading and E instead the classic 5 on HTML logo. For MIEIC students. 100% poliester.', 19.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (10, 'FEUP Hoodie 2', 'Hoodie for FEUP students. 100% poliester.', 14.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (11, 'Fernando Pessoa Hoodie', 'Hoodie for MIEIC students. 100% poliester.', 14.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (12, 'Programmer Hoodie', 'Grey hoodie for MIEIC students. 100% poliester.', 14.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (13, 'Semi Colon Hoodie', 'Hoodie for MIEIC students. 100% poliester.', 14.99, 2.99, 50, 0, 1);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (14, 'Author Jacket', 'Jacket for MIEIC students. 100% poliester.', 19.99, 2.99, 50, 0, 1);

    --Phone Cases
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (15, 'MIEIC Case', 'Case for MIEIC students. Water resistant.', 9.99, 1.99, 50, 0, 2);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (16, 'FEUP Case', 'Case for FEUP students. Water resistant.', 9.99, 1.99, 50, 0, 2);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (17, 'Eat Sleep Code Repeat Case', 'Case for MIEIC students. Water resistant.', 9.99, 1.99, 50, 0, 2);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (18, 'Bill Gates Case', 'Case for MIEIC students. Water resistant.', 9.99, 1.99, 50, 0, 2);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (19, 'E HTML Case', 'Case for MIEIC students. Water resistant.', 9.99, 1.99, 50, 0, 2);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (20, 'MIEIC Army Case', 'Case for MIEIC students. Water resistant.', 9.99, 1.99, 50, 0, 2);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (21, 'MIEIC Army 2 Case', 'Case for MIEIC students. Water resistant.', 9.99, 1.99, 50, 0, 2);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (22, 'MIEIC Case', 'Case for MIEIC students. Water resistant.', 9.99, 1.99, 50, 0, 2);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (23, 'Coding Case', 'Case for MIEIC students. Water resistant.', 9.99, 2.99, 50, 0, 2);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (24, 'The HTML to my CSS Case', 'Case for MIEIC students. Water resistant.', 9.99, 2.99, 50, 0, 2);

    --Posters
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (25, 'Today Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (26, 'Anonymous1 Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (27, 'Anonymous2 Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (28, 'Hackerman Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (29, 'TensionRelease Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (30, 'In Code We Trust Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (31, 'Keep Calm Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (32, 'I Love Coding Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (33, 'SETUP Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (34, 'Eat Sleep Code Repeat Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (35, 'Semi Colon Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (36, 'Super Bock Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (37, 'World Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (38, 'MIEIC Army Poster', 'A3 poster related to programmers', 9.99, 2.99, 50, 0, 4);

    --Stickers
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (39, 'MIEIC Sticker', 'Laptop Sticker.', 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (40, 'FEUP Sticker', 'Laptop sticker.', 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (41, 'Coffee Sticker', 'Laptop Sticker.', 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (42, 'Home Sticker', 'Laptop sticker.', 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (43, 'HTML Sticker', 'Laptop Sticker.', 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (44, 'Blackbelt Sticker', 'Laptop sticker.', 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (45, 'Nike Sticker', 'Laptop sticker.', 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (46, 'Titanic Sticker', 'Laptop sticker.', 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (47, 'False Sticker', 'Laptop sticker.', 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (48, 'Java Sticker', 'Laptop sticker.', 2.99, 0.99, 50, 0, 3);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (49, 'Combo Stickers', 'Laptop stickers.', 14.99, 0.99, 50, 0, 3);


    --Tickets
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (50, 'HTML Ticket', 'Ticket for workshop to learn to code in HTML.', 1.99, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (51, 'CSS Ticket', 'Ticket for workshop to learn to code in  CSS.', 0.99, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (52, 'Java Ticket', 'Ticket for workshop to learn to code in JAVA.', 4.99, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (53, 'C/C++ Ticket', 'Ticket for workshop to learn to code in C/C++.', 4.99, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (54, 'Python Ticket', 'Ticket for workshop to learn to code in Python.', 1.99, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (55, 'SQL Ticket', 'Ticket for workshop to learn to code in SQL.', 1.99, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (56, 'Dr.Scheme Ticket', 'Ticket for workshop to learn to code in Dr.Scheme.', 0.99, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (57, 'Google Talks', 'Ticket for lecture with Google engineer.', 9.99, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (58, 'PPIN Talks', 'Ticket for lecture to learn about personal and interpersonal proficiency.', 0.99, 0.99, 50, 0, 5);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (59, 'PHP Ticket', 'Ticket for workshop to learn to code in PHP', 1.99, 0.99, 50, 0, 5);
    --Mouse Pads
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (60, 'MIEIC Mouse Pad', 'Mouse pad for MIEIC students.', 9.99, 1.99, 50, 0, 6);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (61, 'FEUP Mouse Pad', 'Mouse pad for FEUP students', 9.99, 1.99, 50, 0, 6);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (62, 'Go Away I am Coding Mouse Pad', 'Funny mouse pad. For programmers.', 9.99, 1.99, 50, 0, 6);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (63, 'Errors Mouse Pad', 'Funny mouse pad. For programmers.', 9.99, 1.99, 50, 0, 6);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (64, 'Breaking Bad Mouse Pad', 'Funny mouse pad. For programmers.', 9.99, 1.99, 50, 0, 6);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (65, 'Eat Sleep Code Mouse Pad', 'Funny mouse pad. For programmers.', 9.99, 1.99, 50, 0, 6);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (66, 'Not A Bug Mouse Pad', 'Funny mouse pad. For programmers.', 9.99, 1.99, 50, 0, 6);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (67, 'Not A Robot Mouse Pad', 'Funny mouse pad. For programmers.', 9.99, 1.99, 50, 0, 6);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (68, 'Ninja Mouse Pad', 'Funny mouse pad. For programmers.', 9.99, 1.99, 50, 0, 6);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (69, 'Trust Me Mouse Pad', 'Funny mouse pad. For programmers.', 9.99, 1.99, 50, 0, 6);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (70, 'Best Programmer Ever Mouse Pad', 'Funny mouse pad. For programmers.', 9.99, 1.99, 50, 0, 6);

    --Mugs
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (71, 'MIEIC Mug', 'Mug for MIEIC students.', 9.99, 1.99, 50, 0, 7);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (72, 'FEUP Mug', 'Mug for FEUP students.', 9.99, 1.99, 50, 0, 7);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (73, 'I am A Programmer Mug', 'Funny mug. For programmers.', 9.99, 1.99, 50, 0, 7);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (74, 'CSS Mug', 'Funny mug. For programmers.', 9.99, 1.99, 50, 0, 7);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (75, 'Debug Mug', 'Funny mug. For programmers.', 9.99, 1.99, 50, 0, 7);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (76, 'Why Mug', 'Funny mug. For programmers.', 9.99, 1.99, 50, 0, 7);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (77, 'Gamer Mug', 'Funny mug. For programmers.', 9.99, 1.99, 50, 0, 7);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (78, 'Offline Mug', 'Funny mug. For programmers.', 9.99, 1.99, 50, 0, 7);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (79, 'Break Mug', 'Funny mug. For programmers.', 9.99, 1.99, 50, 0, 7);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (80, 'Coffee Mug', 'Funny mug. For programmers.', 9.99, 1.99, 50, 0, 7);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (81, 'Errors Mug', 'Funny mug. For programmers.', 9.99, 1.99, 50, 0, 7);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (82, 'Sleep Mug', 'Funny mug. For programmers.', 9.99, 1.99, 50, 0, 7);
INSERT INTO product (id_product, product_name, product_description, price, delivery_cost, stock, rating, id_category) VALUES (83, 'Go Away Mug', 'Funny mug. For programmers.', 9.99, 1.99, 50, 0, 7);



-- Table: photo
    --Apparel
INSERT INTO photo (id_photo, image_path, id_product) VALUES (1, '~/html/resources/images/apparel/hoodie_sudo_rm.jpg', 1);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (2, '~/html/resources/images/apparel/hoodie_sudo_rm_single.jpg', 1);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (3, '~/html/resources/images/apparel/hoodie_1.jpg', 2);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (4, '~/html/resources/images/apparel/hoodie_1_single.jpg', 2);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (5, '~/html/resources/images/apparel/hoodie_1_red.jpg', 3);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (6, '~/html/resources/images/apparel/hoodie_1_red_single.jpg', 3);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (7, '~/html/resources/images/apparel/hoodie_2.jpg', 4);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (8, '~/html/resources/images/apparel/hoodie_2_single.jpg', 4);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (9, '~/html/resources/images/apparel/hoodie_2_smiley.jpg', 5);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (10, '~/html/resources/images/apparel/hoodie_2_smiley_single.jpg', 5);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (11, '~/html/resources/images/apparel/hoodie_3.jpg', 6);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (12, '~/html/resources/images/apparel/hoodie_3_single.jpg', 6);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (13, '~/html/resources/images/apparel/hoodie_5.jpg', 7);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (14, '~/html/resources/images/apparel/hoodie_6.jpg', 8);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (15, '~/html/resources/images/apparel/hoodie_10.jpg', 9);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (16, '~/html/resources/images/apparel/hoodie_example.jpg', 10);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (17, '~/html/resources/images/apparel/nando.jpg', 11);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (18, '~/html/resources/images/apparel/programmer.jpg', 12);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (19, '~/html/resources/images/apparel/programmer2.jpg', 13);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (20, '~/html/resources/images/apparel/author_jacket.jpg', 14);

    --Cases
INSERT INTO photo (id_photo, image_path, id_product) VALUES (21, '~/html/resources/images/cases/case_example1.jpg', 15);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (22, '~/html/resources/images/cases/case_example2.jpg', 16);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (23, '~/html/resources/images/cases/case_example3.jpg', 17);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (24, '~/html/resources/images/cases/case_example4.jpg', 18);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (25, '~/html/resources/images/cases/case_example5.jpg', 19);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (26, '~/html/resources/images/cases/case_example6.jpg', 20);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (27, '~/html/resources/images/cases/case_example7.jpg', 21);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (28, '~/html/resources/images/cases/case_example8.jpg', 22);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (29, '~/html/resources/images/cases/case_example9.jpg', 23);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (30, '~/html/resources/images/cases/case_example10.jpg', 24);

    --Posters
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

    --Stickers
INSERT INTO photo (id_photo, image_path, id_product) VALUES (45, '~/html/resources/images/stickers/feup.jpg', 39);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (46, '~/html/resources/images/stickers/feup2.jpg', 40);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (47, '~/html/resources/images/stickers/coffee.jpg', 41);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (48, '~/html/resources/images/stickers/home.png', 42);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (49, '~/html/resources/images/stickers/html.jpg', 43);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (50, '~/html/resources/images/stickers/blackbelt.jpg', 44);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (51, '~/html/resources/images/stickers/nike.jpg', 45);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (52, '~/html/resources/images/stickers/titanic.jpg', 46);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (53, '~/html/resources/images/stickers/true.jpg', 47);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (54, '~/html/resources/images/stickers/java.png', 48);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (55, '~/html/resources/images/stickers/stickers.jpg', 49);

    --Tickets
INSERT INTO photo (id_photo, image_path, id_product) VALUES (56, '~/html/resources/images/tickets/ticket1.jpg', 50);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (57, '~/html/resources/images/tickets/ticket2.jpg', 51);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (58, '~/html/resources/images/tickets/ticket3.jpg', 52);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (59, '~/html/resources/images/tickets/ticket4.png', 53);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (60, '~/html/resources/images/tickets/ticket5.jpg', 54);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (61, '~/html/resources/images/tickets/ticket6.jpg', 55);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (62, '~/html/resources/images/tickets/ticket7.jpg', 56);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (63, '~/html/resources/images/tickets/ticket8.jpg', 57);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (64, '~/html/resources/images/tickets/ticket9.png', 58);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (65, '~/html/resources/images/tickets/ticket10.jpg', 59);

    --Mouse Pads
INSERT INTO photo (id_photo, image_path, id_product) VALUES (66, '~/html/resources/images/mousepads/feup.jpg', 60);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (67, '~/html/resources/images/mousepads/feup2.jpg', 61);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (68, '~/html/resources/images/mousepads/goAway.png', 62);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (69, '~/html/resources/images/mousepads/more.jpg', 63);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (70, '~/html/resources/images/mousepads/breaking.jpg', 64);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (71, '~/html/resources/images/mousepads/eat.jpg', 65);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (72, '~/html/resources/images/mousepads/feature.jpg', 66);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (73, '~/html/resources/images/mousepads/robot.jpg', 67);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (74, '~/html/resources/images/mousepads/ninja.jpg', 68);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (75, '~/html/resources/images/mousepads/trust me.jpeg', 69);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (76, '~/html/resources/images/mousepads/bestever.jpg', 70);

    --Mugs
INSERT INTO photo (id_photo, image_path, id_product) VALUES (77, '~/html/resources/images/mugs/feup3.jpg', 71);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (78, '~/html/resources/images/mugs/feup4.jpg', 72);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (79, '~/html/resources/images/mugs/programmer.jpg', 73);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (80, '~/html/resources/images/mugs/css.jpg', 74);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (81, '~/html/resources/images/mugs/debug.jpg', 75);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (82, '~/html/resources/images/mugs/why.jpg', 76);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (83, '~/html/resources/images/mugs/gamer.jpg', 77);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (84, '~/html/resources/images/mugs/offline.jpg', 78);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (85, '~/html/resources/images/mugs/break.jpg', 79);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (86, '~/html/resources/images/mugs/coffee.jpg', 80);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (87, '~/html/resources/images/mugs/errors.jpg', 81);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (88, '~/html/resources/images/mugs/sleep.jpg', 82);
INSERT INTO photo (id_photo, image_path, id_product) VALUES (89, '~/html/resources/images/mugs/goaway.png', 83);

    --Users
INSERT INTO photo (id_photo, image_path, id_product) VALUES (90, '~/html/resources/images/users/random-profile.jpg', NULL);


-- Table: user

    -- Regular Users
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (1, 'Tomás Novo', 'up201604503@fe.up.pt','123456789', '1998-07-31', TRUE, FALSE, FALSE, FALSE, 90, 'The best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (2, 'Zé Luís', 'up201287644@fe.up.pt', '123456789', '1994-02-11', TRUE, FALSE, FALSE, FALSE, 90, 'MEEEC student at 2nd grade. Love music !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (3, 'Susana Castro', 'up201503453@fe.up.pt', '123456789', '1997-04-15', TRUE, FALSE, FALSE, FALSE, 90, ' Quemistry student, the one who knocks !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (4, 'José António', 'up201703443@fe.up.pt', '123456789', '1998-02-11', TRUE, FALSE, FALSE, FALSE, 90, 'I love computers !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (5, 'Rolando Escada Abaixo', 'up201304453@fe.up.pt', '123456789', '1994-03-21', TRUE, FALSE, FALSE, FALSE, 90, 'CIVIL < INFORMATICA !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (6, 'Andreia Ramalho', 'up201603853@fe.up.pt', '123456789', '1993-12-13', TRUE, FALSE, FALSE, FALSE, 90, 'MIEIC Student !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (7, 'João Saraiva', 'up201703453@fe.up.pt', '123456789', '1996-02-10', TRUE, FALSE, FALSE, FALSE, 90, 'MIEIC Student AT 1ST grade !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (8, 'Luísa Josefa', 'up201406753@fe.up.pt', '123456789', '1999-03-31', TRUE, FALSE, FALSE, FALSE, 90, 'MIEIC Student');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (9, 'Alfredo Granjão', 'up201706173@fe.up.pt', '123456789', '1995-02-11', TRUE, FALSE, FALSE, FALSE, 90, 'MIEIC Student 5th grade! SOU FINALISTAAAA');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (10, 'Ada Beliza', 'up201302123@fe.up.pt', '123456789', '1996-03-09', TRUE, FALSE, FALSE, FALSE, 90, 'MIEIC student at 3rd grade !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (11, 'User11', 'user11@fe.up.pt', '123456789', '1998-11-07', TRUE, FALSE, FALSE, FALSE, 90, 'The 11th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (12, 'User12', 'user12@fe.up.pt', '123456789', '1997-10-01', TRUE, FALSE, FALSE, FALSE, 90, 'The 12th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (13, 'User13', 'user13@fe.up.pt', '123456789', '1997-07-03', TRUE, FALSE, FALSE, FALSE, 90, 'The 13th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (14, 'User14', 'user14@fe.up.pt', '123456789', '1993-08-11', TRUE, FALSE, FALSE, FALSE, 90, 'The 14th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (15, 'User15', 'user15@fe.up.pt', '123456789', '1992-04-16', TRUE, FALSE, FALSE, FALSE, 90, 'The 15th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (16, 'User16', 'user16@fe.up.pt', '123456789', '1998-03-22', TRUE, FALSE, FALSE, FALSE, 90, 'The 16th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (17, 'User17', 'user17@fe.up.pt', '123456789', '1999-01-30', TRUE, FALSE, FALSE, FALSE, 90, 'The 17th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (18, 'User18', 'user18@fe.up.pt', '123456789', '1994-09-27', TRUE, FALSE, FALSE, FALSE, 90, 'The 18th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (19, 'User19', 'user19@fe.up.pt', '123456789', '1996-10-23', TRUE, FALSE, FALSE, FALSE, 90, 'The 19th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (20, 'User20', 'user20@fe.up.pt', '123456789', '1994-11-22', TRUE, FALSE, FALSE, FALSE, 90, 'The 20th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (21, 'User21', 'user21@fe.up.pt', '123456789', '1993-12-21', TRUE, FALSE, FALSE, FALSE, 90, 'The 21st best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (22, 'User22', 'user22@fe.up.pt', '123456789', '1997-01-26', TRUE, FALSE, FALSE, FALSE, 90, 'The 22nd best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (23, 'User23', 'user23@fe.up.pt', '123456789', '1998-02-16', TRUE, FALSE, FALSE, FALSE, 90, 'The 23rd best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (24, 'User24', 'user24@fe.up.pt', '123456789', '1997-03-15', TRUE, FALSE, FALSE, FALSE, 90, 'The 24th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (25, 'User25', 'user25@fe.up.pt', '123456789', '1995-04-25', TRUE, FALSE, FALSE, FALSE, 90, 'The 25th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (26, 'User26', 'user26@fe.up.pt', '123456789', '1998-05-22', TRUE, FALSE, FALSE, FALSE, 90, 'The 26th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (27, 'User27', 'user27@fe.up.pt', '123456789', '1998-06-26', TRUE, FALSE, FALSE, FALSE, 90, 'The 27th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (28, 'User28', 'user28@fe.up.pt', '123456789', '1998-07-30', TRUE, FALSE, FALSE, FALSE, 90, 'The 28th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (29, 'User29', 'user29@fe.up.pt', '123456789', '1996-08-21', TRUE, FALSE, FALSE, FALSE, 90, 'The 29th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (30, 'User30', 'user30@fe.up.pt', '123456789', '1999-04-12', TRUE, FALSE, FALSE, FALSE, 90, 'The 30th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (31, 'User31', 'user31@fe.up.pt', '123456789', '1993-12-21', TRUE, FALSE, FALSE, FALSE, 90, 'The 31st best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (32, 'User32', 'user32@fe.up.pt', '123456789', '1993-01-26', TRUE, FALSE, FALSE, FALSE, 90, 'The 32nd best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (33, 'User33', 'user33@fe.up.pt', '123456789', '1992-02-16', TRUE, FALSE, FALSE, FALSE, 90, 'The 33rd best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (34, 'User34', 'user34@fe.up.pt', '123456789', '1993-03-15', TRUE, FALSE, FALSE, FALSE, 90, 'The 34th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (35, 'User35', 'user35@fe.up.pt', '123456789', '1990-04-25', TRUE, FALSE, FALSE, FALSE, 90, 'The 35th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (36, 'User36', 'user36@fe.up.pt', '123456789', '1991-05-22', TRUE, FALSE, FALSE, FALSE, 90, 'The 36th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (37, 'User37', 'user37@fe.up.pt', '123456789', '1992-06-26', TRUE, FALSE, FALSE, FALSE, 90, 'The 37th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (38, 'User38', 'user38@fe.up.pt', '123456789', '1993-07-30', TRUE, FALSE, FALSE, FALSE, 90, 'The 38th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (39, 'User39', 'user39@fe.up.pt', '123456789', '1994-08-21', TRUE, FALSE, FALSE, FALSE, 90, 'The 39th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (40, 'User40', 'user40@fe.up.pt', '123456789', '1995-04-12', TRUE, FALSE, FALSE, FALSE, 90, 'The 40th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (41, 'User41', 'user41@fe.up.pt', '123456789', '1992-11-21', TRUE, FALSE, FALSE, FALSE, 90, 'The 41st best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (42, 'User42', 'user42@fe.up.pt', '123456789', '1993-11-26', TRUE, FALSE, FALSE, FALSE, 90, 'The 42nd best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (43, 'User43', 'user43@fe.up.pt', '123456789', '1995-03-16', TRUE, FALSE, FALSE, FALSE, 90, 'The 43rd best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (44, 'User44', 'user44@fe.up.pt', '123456789', '1994-02-15', TRUE, FALSE, FALSE, FALSE, 90, 'The 44th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (45, 'User45', 'user45@fe.up.pt', '123456789', '1990-04-28', TRUE, FALSE, FALSE, FALSE, 90, 'The 45th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (46, 'User46', 'user46@fe.up.pt', '123456789', '1991-05-12', TRUE, FALSE, FALSE, FALSE, 90, 'The 46th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (47, 'User47', 'user47@fe.up.pt', '123456789', '1992-12-16', TRUE, FALSE, FALSE, FALSE, 90, 'The 47th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (48, 'User48', 'user48@fe.up.pt', '123456789', '1995-07-31', TRUE, FALSE, FALSE, FALSE, 90, 'The 48th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (49, 'User49', 'user49@fe.up.pt', '123456789', '1997-02-22', TRUE, FALSE, FALSE, FALSE, 90, 'The 49th best !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (50, 'User50', 'user50@fe.up.pt', '123456789', '1999-03-05', TRUE, FALSE, FALSE, FALSE, 90, 'The 50th best !');

    --Stock Manager
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (51, 'StockManager1', 'sm1@fe.up.pt', 'stockmanager123456789', '1998-03-30', TRUE, TRUE, FALSE, FALSE, 90, 'I am StockManager1 !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (52, 'StockManager2', 'sm2@fe.up.pt', 'stockmanager123456789', '1996-04-21', TRUE, TRUE, FALSE, FALSE, 90, 'I am StockManager2 !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (53, 'StockManager3', 'sm3@fe.up.pt', 'stockmanager123456789', '1999-06-12', TRUE, TRUE, FALSE, FALSE, 90, 'I am StockManager3 !');

    --Moderator
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (54, 'Moderator1', 'm1@fe.up.pt', 'moderator123456789', '1995-07-30', TRUE, FALSE, TRUE, FALSE, 90, 'I am Moderator1 !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (55, 'Moderator2', 'm2@fe.up.pt', 'moderator123456789', '1997-08-21', TRUE, FALSE, TRUE, FALSE, 90, 'I am Moderator2 !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (56, 'Moderator3', 'm3@fe.up.pt', 'moderator123456789', '1993-05-12', TRUE, FALSE, TRUE, FALSE, 90, 'I am Moderator3 !');

    --Submission Manager
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (57, 'SubmissionManager1', 'subm1@fe.up.pt', 'subm123456789', '1998-04-02', TRUE, FALSE, FALSE, TRUE, 90, 'I am SubmissionManager1 !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (58, 'SubmissionManager2', 'subm2@fe.up.pt', 'subm123456789', '1996-08-22', TRUE, FALSE, FALSE, TRUE, 90, 'I am SubmissionManager2 !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (59, 'SubmissionManager3', 'subm3@fe.up.pt', 'subm123456789', '1997-01-02', TRUE, FALSE, FALSE, TRUE, 90, 'I am SubmissionManager3 !');

    --Admins
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (60, 'Admin1', 'admin1@fe.up.pt', 'admin123456789', '1998-02-02', TRUE, TRUE, TRUE, TRUE, 90, 'I am Admin1 !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (61, 'Admin2', 'admin2@fe.up.pt', 'admin123456789', '1994-05-12', TRUE, TRUE, TRUE, TRUE, 90, 'I am Admin2 !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (62, 'Admin3', 'admin3@fe.up.pt', 'admin123456789', '1997-11-22', TRUE, TRUE, TRUE, TRUE, 90, 'I am Admin3 !');
INSERT INTO users (id_user, username, email, pw, birth_date, active, stock_manager, moderator, submission_manager, id_photo, user_description) VALUES (63, 'Admin4', 'admin4@fe.up.pt', 'admin123456789', '1998-10-30', TRUE, TRUE, TRUE, TRUE, 90, 'I am Admin4 !');


-- Table: faq
INSERT INTO faq (id_question, question, answer) VALUES (1, 'Question 1: How can I buy a product ?', '  To buy a product, you need to click "Products" in the navigation bar to show the products dropdown.
  There, you can choose the type of the product that you want. You can also search for a product in the
  search bar of the navigation bar. When you get to one of this pages, you can choose one of the products.
  In that specific product page, you can buy the item immediately or you can add it to your cart and buy
  it later. Both of these actions can be accomplished through two buttons present on that page.');

INSERT INTO faq (id_question, question, answer) VALUES (2, 'Question 2: How can I create an account ?', 'To create an account, you need to press the User icon in the navigation bar, followed by the option Sign-up
in the dropdown that appeared.');


INSERT INTO faq (id_question, question, answer) VALUES (3, 'Question 3: How can I add a product to my wishlist ?', 'To add a product to your wishlist, you have to be logged in. In the products page you should press the button
"Add to wishlist."');

INSERT INTO faq (id_question, question, answer) VALUES (4, 'Question 4: How can I create a design ?', 'If you want to submit your own design, you have to be logged int and then press the "Submit your design"
button on the navigation bar. There you have to fill the various fields regarding your desing and then submit it.');

INSERT INTO faq (id_question, question, answer) VALUES (5, 'Question 5: How can I vote on a desing ?','To vote on a design, you have to log in and then click on the "Upcomig" button on the navigation bar.
There you have several polls of designs made by other users. To vote on a design, you should press the heart
button that appears on the product that you put the cursor on. Your vote is registed when that button gains
color.');

-- Table: size
INSERT INTO size (id_size, size) VALUES (1, 'Extra-Small');
INSERT INTO size (id_size, size) VALUES (2, 'Small');
INSERT INTO size (id_size, size) VALUES (3, 'Medium');
INSERT INTO size (id_size, size) VALUES (4, 'Large');
INSERT INTO size (id_size, size) VALUES (5, 'Extra-Large');


-- Table: color
INSERT INTO color (id_color, color) VALUES (1, 'Black');
INSERT INTO color (id_color, color) VALUES (2, 'Grey');
INSERT INTO color (id_color, color) VALUES (3, 'White');
INSERT INTO color (id_color, color) VALUES (4, 'Red');

-- Table: wishlist
INSERT INTO wishlist (id_user,  id_product) VALUES (1, 1);
INSERT INTO wishlist (id_user,  id_product) VALUES (1, 3);
INSERT INTO wishlist (id_user,  id_product) VALUES (1, 13);
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
INSERT INTO cart (id_user, id_product, id_color, id_size, quantity) VALUES (3, 1, 3, 2, 1);

-- Table: city
INSERT INTO city (id_city, city) VALUES (1, 'Viseu');
INSERT INTO city (id_city, city) VALUES (2, 'Porto');
INSERT INTO city (id_city, city) VALUES (3, 'Aveiro');
INSERT INTO city (id_city, city) VALUES (4, 'Lisboa');
INSERT INTO city (id_city, city) VALUES (5, 'Samil');
INSERT INTO city (id_city, city) VALUES (6, 'Santarem');
INSERT INTO city (id_city, city) VALUES (7, 'Braga');
INSERT INTO city (id_city, city) VALUES (8, 'Ranhados');
INSERT INTO city (id_city, city) VALUES (9, 'Faro');
INSERT INTO city (id_city, city) VALUES (10, 'Fatima');
INSERT INTO city (id_city, city) VALUES (11, 'Viana do Castelo');

-- Table: delivery_info
INSERT INTO delivery_info (id_delivery_info, id_city, contact, delivery_address) VALUES (1, 1, '967112935', 'Rua de Viseu, lote 1');
INSERT INTO delivery_info (id_delivery_info, id_city, contact, delivery_address) VALUES (2, 2, '922376127', 'Rua de Paranhos, 276');
INSERT INTO delivery_info (id_delivery_info, id_city, contact, delivery_address) VALUES (3, 2, '922322271', 'Quinta do Jose, 3, 2D');
INSERT INTO delivery_info (id_delivery_info, id_city, contact, delivery_address) VALUES (4, 2, '962111127', 'Rua dos Santos, 17');
INSERT INTO delivery_info (id_delivery_info, id_city, contact, delivery_address) VALUES (5, 4, '965374811', 'Rua das Garrafas, 11, 3 direito');
INSERT INTO delivery_info (id_delivery_info, id_city, contact, delivery_address) VALUES (6, 4, '966653748', 'Rua de Lisboa, 1');
INSERT INTO delivery_info (id_delivery_info, id_city, contact, delivery_address) VALUES (7, 3, '922234522', 'Rua em Aveiro, lote 77, Aveiro');
INSERT INTO delivery_info (id_delivery_info, id_city, contact, delivery_address) VALUES (8, 5, '914646463', 'Rua do Tomas, lote 69');
INSERT INTO delivery_info (id_delivery_info, id_city, contact, delivery_address) VALUES (9, 7, '911113242', 'Rua tres, lote 3');
INSERT INTO delivery_info (id_delivery_info, id_city, contact, delivery_address) VALUES (10, 8, '966969696', 'Quinta dos tomilhos, lt 12, 2o direto');
INSERT INTO delivery_info (id_delivery_info, id_city, contact, delivery_address) VALUES (11, 2, '926969696', 'Avenida da Liberdade, lt 150');
INSERT INTO delivery_info (id_delivery_info, id_city, contact, delivery_address) VALUES (12, 2, '969696773', 'Rua Joao Pedro, 111');
INSERT INTO delivery_info (id_delivery_info, id_city, contact, delivery_address) VALUES (13, 1, '962222222', 'Urbanizacao Ze Chilo, lote 35, 2 direito');

-- Table: purchase
INSERT INTO purchase (id_purchase, id_user, id_deli_info, purchase_date, total, status) VALUES (1, 1, 1, '2019-02-03 12:40:24', 1, 'processing');
INSERT INTO purchase (id_purchase, id_user, id_deli_info, purchase_date, total, status) VALUES (2, 2, 2, '2019-01-05 03:22:05', 1, 'awaiting_payment');
INSERT INTO purchase (id_purchase, id_user, id_deli_info, purchase_date, total, status) VALUES (3, 10, 3, '2019-03-30 15:10:10', 1, 'in_transit');
INSERT INTO purchase (id_purchase, id_user, id_deli_info, purchase_date, total, status) VALUES (4, 22, 4, '2019-02-01 19:34:22', 1, 'delivered');
INSERT INTO purchase (id_purchase, id_user, id_deli_info, purchase_date, total, status) VALUES (5, 22, 4, '2019-01-02 20:56:12', 1, 'canceled');
INSERT INTO purchase (id_purchase, id_user, id_deli_info, purchase_date, total, status) VALUES (6, 33, 6, '2019-02-09 07:32:43', 1, 'delivered');
INSERT INTO purchase (id_purchase, id_user, id_deli_info, purchase_date, total, status) VALUES (7, 36, 7, '2019-03-14 12:41:56', 1, 'awaiting_payment');
INSERT INTO purchase (id_purchase, id_user, id_deli_info, purchase_date, total, status) VALUES (8, 37, 8, '2019-01-29 11:12:31', 1, 'processing');
INSERT INTO purchase (id_purchase, id_user, id_deli_info, purchase_date, total, status) VALUES (9, 5, 9, '2019-02-13 10:06:33', 1, 'awaiting_payment');
INSERT INTO purchase (id_purchase, id_user, id_deli_info, purchase_date, total, status) VALUES (10, 6, 10, '2019-01-05 14:54:45', 1, 'in_transit');
INSERT INTO purchase (id_purchase, id_user, id_deli_info, purchase_date, total, status) VALUES (11, 8, 11, '2019-03-06 17:44:55', 1, 'in_transit');
INSERT INTO purchase (id_purchase, id_user, id_deli_info, purchase_date, total, status) VALUES (12, 10, 3, '2019-02-12 18:33:43', 1, 'processing');
INSERT INTO purchase (id_purchase, id_user, id_deli_info, purchase_date, total, status) VALUES (13, 31, 12, '2019-01-10 14:12:36', 1, 'delivered');
INSERT INTO purchase (id_purchase, id_user, id_deli_info, purchase_date, total, status) VALUES (14, 1, 1, '2019-02-20 12:06:30', 1, 'processing');

-- Table: review
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (35,34,'auctor mus imperdiet tristique Phasellus taciti nisi Suspendisse vestibulum eros laoreet sociis Nunc inceptos','2019-01-10 21:23:03',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (2,32,'erat nisi dapibus ullamcorper aliquet porta lobortis Morbi mauris ornare purus','2019-03-14 11:54:04',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (4,51,'sociis Aenean Nulla placerat Vivamus nascetur habitant egestas aliquam semper Nam ipsum id fringilla tellus Proin sem ornare rutrum a','2019-01-22 04:20:50',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (2,56,'massa hymenaeos augue massa laoreet mus urna vehicula ultrices quam leo feugiat id Vestibulum Curae vel id egestas','2019-03-03 18:42:19',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (8,43,'massa sem nunc sapien pede Ut Morbi Vivamus','2019-04-08 06:39:09',4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (6,18,'in Nam nec porttitor porttitor','2019-03-25 03:42:17',1);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (13,63,'semper ac nisi sociis scelerisque Class risus Nunc','2019-02-11 21:21:38',1);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (55,71,'tincidunt Class aliquam Curae nunc fringilla facilisis pellentesque viverra Sed ullamcorper parturient Fusce vulputate est enim mus placerat semper sagittis','2019-03-22 12:40:18',4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (7,31,'leo Duis nascetur magnis aliquam','2019-02-26 16:43:17',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (4,6,'et Vestibulum velit vestibulum nisi Curae non elit Mauris augue Mauris sollicitudin placerat id cursus semper','2019-03-09 14:21:20',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (58,16,'nibh venenatis penatibus feugiat Nulla massa est vestibulum Ut urna magnis varius ullamcorper aptent conubia senectus vestibulum habitant est adipiscing','2019-02-27 01:18:43',4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (23,31,'urna justo ante Lorem In euismod ridiculus quis amet sodales ipsum Etiam morbi faucibus viverra hymenaeos','2019-02-07 21:59:10',1);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (13,32,'suscipit venenatis facilisi risus ultrices felis taciti inceptos congue tincidunt semper consectetuer nisi dictum Nulla hymenaeos congue','2019-03-24 03:02:27',4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (22,6,'leo tortor mauris porttitor ullamcorper nostra leo aliquet nibh lobortis faucibus','2019-02-18 10:44:52',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (63,57,'Curabitur posuere vitae Nam quam amet adipiscing massa sociosqu elementum lectus odio sem arcu montes quam lacinia','2019-04-07 22:20:48',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (18,8,'aptent penatibus enim ornare Nam neque enim per porta lectus diam varius cursus nulla commodo','2019-02-14 16:59:13',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (39,43,'massa Donec risus rhoncus erat dui Proin ultricies','2019-04-05 17:20:24',4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (16,51,'dolor magna tempus porta Etiam amet ridiculus Fusce egestas','2019-01-29 10:28:15',4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (4,46,'enim venenatis fames leo euismod','2019-01-06 20:19:31',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (4,20,'Aliquam mollis penatibus gravida iaculis Curabitur vestibulum','2019-01-04 13:53:12',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (60,50,'magnis aliquet netus Mauris senectus nonummy','2019-02-03 12:11:24',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (57,12,'Donec Etiam eros et rutrum Nullam nisi bibendum Suspendisse egestas dis velit Phasellus','2019-03-21 14:27:47',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (59,69,'varius iaculis vehicula enim ultrices arcu Proin fringilla','2019-01-29 10:52:46',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (44,71,'elit in lacus libero Nullam sociis feugiat tincidunt in tellus risus augue molestie nec nulla mus Nam pharetra','2019-03-21 05:23:45',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (60,38,'torquent penatibus lectus nulla pharetra elit risus sollicitudin semper ridiculus rutrum','2019-01-20 05:51:32',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (47,43,'In rutrum ullamcorper Ut magna neque','2019-04-07 01:53:02',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (54,71,'Lorem mauris viverra Vivamus faucibus Phasellus diam nonummy egestas consequat dolor commodo Fusce','2019-03-15 05:16:49',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (40,34,'felis Phasellus Integer nunc diam gravida velit nascetur Donec pellentesque accumsan Praesent diam morbi augue viverra torquent','2019-03-27 06:58:53',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (52,74,'eros primis metus Proin Proin iaculis malesuada vestibulum','2019-03-19 22:20:29',1);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (21,62,'litora rhoncus nascetur ac Etiam luctus Fusce penatibus vitae conubia Mauris','2019-03-23 23:58:42',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (13,17,'vehicula semper laoreet parturient Sed ultricies ultricies sed fames sodales mus metus Class Sed','2019-02-25 10:03:16',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (39,18,'nascetur a Cras velit dui','2019-02-15 06:17:53',4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (19,27,'nulla neque molestie Nullam Sed hendrerit ipsum Integer laoreet metus mattis diam Fusce sociosqu Ut ligula','2019-03-29 15:38:51',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (47,55,'metus taciti consectetuer Lorem Class tempor molestie dapibus Vivamus','2019-01-14 20:27:40',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (1,78,'sociis libero nec eleifend molestie varius auctor venenatis vel','2019-01-16 23:24:44',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (8,18,'lorem id scelerisque ipsum vestibulum condimentum','2019-02-16 16:25:48',1);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (31,49,'pharetra pharetra amet orci Aliquam viverra fringilla ut purus','2019-01-01 04:36:11',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (3,17,'accumsan volutpat habitant elementum mauris aliquet risus','2019-03-02 15:49:25',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (15,44,'Aenean nec tellus Quisque Vestibulum convallis ac ultricies','2019-01-25 02:01:22',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (47,20,'Suspendisse odio fringilla dapibus placerat volutpat in','2019-04-03 03:44:04',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (21,3,'fermentum consequat fames cubilia ante morbi elementum morbi per malesuada dolor aliquet','2019-01-29 19:44:15',1);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (30,43,'dolor conubia non nunc rutrum turpis quis aliquet lacinia nostra mus dictum penatibus non','2019-03-10 10:21:59',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (45,47,'facilisi Duis id feugiat Proin litora Phasellus molestie urna morbi porta rhoncus placerat ipsum sed pede sed vel Phasellus','2019-01-17 08:57:33',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (8,67,'a velit volutpat ultricies Curabitur elementum taciti felis augue hendrerit non eget','2019-02-16 10:44:13',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (3,29,'gravida Nullam Ut at fames rutrum nostra','2019-02-05 10:44:18',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (5,27,'orci venenatis Proin sollicitudin dui dictum sit nisl','2019-04-01 03:49:28',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (27,71,'Cum adipiscing consequat nonummy condimentum Proin nisl augue aptent litora parturient mauris primis aliquet nec blandit dis','2019-02-03 03:14:06',4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (51,30,'Pellentesque Aliquam fermentum Nam tortor','2019-02-27 20:33:43',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (5,4,'justo quam mus Nam rutrum ligula vehicula In eget Sed sociis mollis dapibus ut','2019-02-03 15:46:18',1);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (25,72,'pharetra lacus montes mus sagittis leo condimentum enim ultricies est Fusce','2019-03-17 01:37:43',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (55,63,'Mauris vehicula dignissim sollicitudin lectus volutpat Vestibulum eu facilisi bibendum Curae dis eros Aenean hymenaeos ornare','2019-01-01 03:44:36',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (18,60,'mollis gravida ornare senectus quam ipsum pulvinar nibh ullamcorper','2019-01-07 04:29:49',4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (2,35,'nec felis urna hymenaeos habitant ultrices Phasellus pulvinar cubilia fames Vivamus sem justo dolor sagittis','2019-02-02 16:22:54',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (63,9,'Integer venenatis litora Cras Lorem natoque neque rhoncus Curae Etiam sit consequat ad tortor','2019-02-13 16:58:11',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (33,82,'porttitor aliquet pharetra Fusce molestie Cum mattis imperdiet lectus volutpat ante Etiam massa ultricies Vestibulum','2019-03-16 20:45:21',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (10,48,'diam Sed Fusce et justo','2019-01-16 06:07:27',1);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (54,19,'taciti vel felis Mauris penatibus torquent torquent sapien laoreet magna viverra justo','2019-03-03 15:05:12',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (59,73,'tempor taciti felis lacus fringilla urna arcu faucibus per erat pharetra ultrices nascetur mattis morbi iaculis fermentum ad elit','2019-01-20 14:14:04',1);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (13,79,'ut sollicitudin interdum sollicitudin quam egestas hendrerit tempor natoque','2019-02-02 13:47:56',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (5,5,'nisl eros eros condimentum feugiat erat viverra senectus libero Vivamus mus tortor pretium Vestibulum imperdiet rhoncus Proin','2019-02-12 22:07:20',4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (5,74,'Nunc aliquam facilisis lectus arcu vulputate facilisi erat volutpat Integer In ultrices cubilia ad','2019-03-16 09:08:35',4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (47,83,'commodo Morbi risus urna consequat Duis felis ut','2019-01-03 20:24:13',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (6,16,'Morbi purus Proin Nunc eros Nulla morbi sapien id metus lectus facilisis orci lobortis velit Nam','2019-02-03 05:09:42',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (58,30,'in Morbi in vestibulum sollicitudin Phasellus Nunc Aenean posuere urna felis mauris turpis consequat ornare fermentum aptent egestas torquent','2019-02-14 21:31:30',1);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (6,75,'Nulla ornare sodales malesuada habitant tristique imperdiet eros semper','2019-02-02 12:11:16',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (41,66,'Nulla amet Aenean pretium mi consequat justo nunc sit','2019-02-17 06:13:30',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (10,39,'sapien penatibus odio odio hymenaeos sagittis ullamcorper felis felis libero fermentum Donec sagittis','2019-01-11 07:14:47',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (34,62,'parturient rutrum Quisque per Nullam Aenean Nam inceptos venenatis','2019-02-22 07:40:17',1);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (43,47,'Nam malesuada Aenean Aliquam leo vel hendrerit in euismod ac rhoncus dapibus Nulla sodales tristique lobortis dolor','2019-02-24 04:09:02',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (5,10,'tortor varius neque varius nulla dignissim primis eros faucibus sollicitudin nibh mauris eu','2019-01-26 16:04:20',4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (14,81,'aliquet pretium neque enim Cras Vivamus aptent hendrerit habitant nisi Sed luctus montes laoreet','2019-01-23 19:14:28',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (20,11,'aliquam dolor ipsum rhoncus ridiculus placerat molestie nisi augue nec nulla eleifend sit','2019-01-31 22:21:27',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (46,27,'mauris tempus bibendum ultricies massa tellus consequat cubilia nisl','2019-01-12 10:25:59',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (51,49,'interdum sapien at taciti sem nonummy Aliquam nostra massa sagittis Suspendisse conubia imperdiet eu malesuada Phasellus bibendum rhoncus','2019-01-17 09:09:09',4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (29,27,'nibh felis lobortis interdum aliquet augue cubilia felis ipsum','2019-02-19 04:13:43',4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (37,70,'lobortis mattis metus nonummy a Morbi laoreet ligula Cum neque penatibus rhoncus enim aptent rutrum gravida lorem hendrerit','2019-03-17 06:01:17',1);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (6,13,'et ac ac convallis ipsum rhoncus magna gravida','2019-01-20 23:51:27',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (20,80,'tempor vel magnis mattis Integer netus litora Nam Fusce quam sociis','2019-04-08 04:52:41',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (41,19,'lacus nibh eleifend Vivamus magnis nascetur netus eget tempus mollis ullamcorper Maecenas Phasellus dignissim Aliquam','2019-02-18 15:49:34',4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (8,40,'Nulla lorem risus a felis consectetuer','2019-03-04 08:48:02',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (38,80,'varius sodales taciti pulvinar lorem Morbi adipiscing hymenaeos litora egestas fames','2019-03-14 22:49:09',1);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (59,64,'gravida Suspendisse commodo tristique hymenaeos neque ultricies parturient sociosqu Integer hendrerit egestas ad lobortis vel pharetra rhoncus Nunc dis id','2019-01-07 02:29:35',1);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (47,29,'natoque Quisque dictum eu lorem ridiculus Cum adipiscing elementum hendrerit facilisis fames taciti lectus viverra','2019-03-22 06:20:30',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (63,2,'vulputate Cum turpis mi ipsum euismod Donec interdum lectus bibendum sagittis lacus mi fringilla eu tristique nec imperdiet felis dis','2019-01-10 07:30:47',4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (10,74,'taciti turpis Integer elit pretium laoreet cubilia dolor nisi luctus adipiscing egestas Morbi Class Quisque nonummy dis','2019-02-25 20:39:03',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (28,4,'ridiculus sagittis magnis neque scelerisque velit gravida consequat sagittis id','2019-03-28 03:19:23',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (42,64,'Aliquam ridiculus lorem semper commodo Donec semper tristique lacus Praesent congue dui pretium velit Lorem ad','2019-02-06 18:48:45',4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (36,55,'commodo hendrerit egestas ante massa Quisque ligula Curabitur varius laoreet Donec per sed conubia facilisis ipsum Mauris','2019-01-05 18:17:07',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (38,34,'pretium Cras vitae nisi in venenatis ultricies Quisque per dis sodales nonummy id justo at pede','2019-01-12 13:29:04',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (8,37,'dapibus sodales sodales Phasellus id nec enim mus sagittis Phasellus rutrum mattis','2019-01-02 02:27:47',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (43,56,'massa In luctus et fames conubia consequat diam hymenaeos Proin tempus Phasellus non Sed rhoncus neque inceptos Etiam orci','2019-01-28 02:23:06',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (39,54,'vulputate Proin nibh semper Morbi felis ridiculus urna nisi ligula','2019-02-21 09:01:04',1);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (62,43,'suscipit nascetur litora id ornare Cum Mauris','2019-02-24 05:08:15',1);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (43,48,'semper enim hymenaeos Nunc Nam in ultricies eu id mi porta aptent sapien senectus inceptos Nam magnis molestie rhoncus','2019-02-08 14:13:51',1);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (34,50,'augue blandit taciti pellentesque dolor ridiculus leo ultrices Class orci ligula nulla inceptos Donec litora Duis ultrices tristique nunc','2019-02-01 12:27:29',4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (36,53,'cubilia torquent parturient hendrerit volutpat Nullam fermentum fermentum eleifend augue tellus placerat Donec et pharetra arcu sit urna','2019-02-20 12:09:22',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (58,72,'enim Vivamus habitant habitant penatibus fringilla posuere eros sodales morbi dictum purus cursus purus Nunc Cum inceptos purus senectus','2019-04-05 22:54:36',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (42,24,'commodo venenatis Donec auctor Cum','2019-01-16 13:26:22',4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (46,76,'tristique tortor luctus natoque libero','2019-02-18 13:18:12',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (45,77,'Nam sociosqu senectus imperdiet placerat ac elementum Fusce quam quam tempor faucibus diam congue congue molestie commodo vel','2019-03-09 13:13:31',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (21,72,'ac nibh Cum urna molestie vestibulum auctor ipsum Morbi','2019-03-12 05:17:35',4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (49,18,'ligula hendrerit tortor penatibus Nulla urna placerat morbi nunc Aenean sodales pharetra','2019-01-12 13:26:55',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (31,42,'in pellentesque sapien adipiscing Aenean egestas nisl rutrum nunc dapibus Proin sapien pede mus volutpat Suspendisse','2019-02-18 00:44:52',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (21,38,'sed Donec at In Ut ligula netus sapien quis Donec inceptos Sed ultrices volutpat non nunc ornare','2019-04-02 06:14:53',1);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (18,59,'feugiat pellentesque ridiculus vehicula ac suscipit malesuada Aliquam pharetra lacinia','2019-01-17 20:35:34',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (19,38,'mollis mollis Praesent quis Ut laoreet ante justo rhoncus dapibus tortor Nunc odio gravida justo tempor ridiculus','2019-03-14 07:08:16',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (63,25,'eleifend viverra ullamcorper placerat condimentum ante vehicula porttitor','2019-03-19 23:05:33',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (31,28,'facilisis in at Aenean torquent egestas nonummy Ut rutrum inceptos pharetra dolor posuere gravida risus vestibulum vulputate','2019-03-03 01:57:26',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (29,13,'mauris vitae turpis interdum Sed dignissim arcu nisi Quisque feugiat ad vestibulum venenatis pretium mollis','2019-03-13 10:23:16',1);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (13,6,'malesuada et consectetuer magnis Maecenas purus semper','2019-04-05 06:00:59',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (17,22,'torquent aptent consequat sem dapibus quis egestas enim est condimentum eget dapibus aliquam mattis','2019-03-30 00:01:20',4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (61,53,'dictum dis venenatis ligula Maecenas purus torquent Maecenas non mauris Sed eros','2019-01-22 05:07:15',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (38,39,'tellus pellentesque Cras sem odio mus leo dignissim dui ornare vulputate quam ultricies natoque amet justo accumsan','2019-01-26 18:34:31',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (13,61,'penatibus Cum inceptos ad posuere dolor euismod Curae Cum tincidunt aptent mattis lorem nostra hendrerit ad','2019-03-08 20:28:05',1);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (24,26,'turpis Morbi Integer a lectus Sed nonummy ligula adipiscing augue','2019-03-04 10:06:04',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (30,69,'cubilia at commodo at hendrerit nascetur quam congue vitae vulputate aliquet risus senectus ridiculus vulputate Lorem vehicula imperdiet et','2019-01-23 08:30:33',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (34,8,'Quisque libero mi lorem in commodo ipsum dapibus penatibus Etiam inceptos','2019-03-11 10:04:36',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (15,79,'fringilla semper facilisis nec scelerisque ante pulvinar','2019-03-01 22:50:08',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (27,42,'Proin quis porta nunc eros magna hymenaeos egestas ornare at dictum','2019-02-09 15:33:42',5);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (55,18,'orci taciti nascetur id suscipit ultrices arcu a conubia tortor sociosqu Integer','2019-01-29 01:57:12',4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (6,46,'Suspendisse diam libero amet Phasellus','2019-03-20 07:34:21',4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (43,75,'quis felis aliquam Pellentesque Mauris sed Aenean sociosqu nisi suscipit malesuada convallis nascetur Proin elementum Phasellus mi mattis','2019-02-12 15:27:39',4);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (17,64,'dis Aenean fringilla ullamcorper taciti primis tortor ut dolor Phasellus lacus fermentum erat torquent felis magna ornare facilisis','2019-03-18 10:36:13',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (21,18,'nibh Class quam imperdiet dignissim varius in placerat Integer hendrerit placerat placerat Proin eros in','2019-02-28 23:15:49',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (42,49,'nostra facilisis eleifend Lorem consequat non purus mollis Aenean','2019-03-23 01:34:59',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (3,31,'volutpat In porta ridiculus felis Pellentesque netus sed quis vehicula congue parturient tellus','2019-02-25 02:52:40',1);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (49,47,'dui augue Cras purus penatibus condimentum penatibus consectetuer penatibus','2019-01-23 16:34:54',2);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (12,53,'ridiculus turpis mauris nostra volutpat orci auctor','2019-03-22 21:49:14',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (41,73,'Maecenas molestie massa Duis eros aliquam congue ipsum cursus vestibulum','2019-01-04 23:01:40',3);
INSERT INTO review (id_user, id_product, comment, review_date, rating) VALUES (18,68,'leo Sed Fusce Suspendisse volutpat dignissim pulvinar eleifend amet Lorem dictum commodo commodo Phasellus blandit','2019-01-08 16:32:47',4);

-- Table: poll
INSERT INTO poll(id_poll, poll_name, poll_date, expiration, active) VALUES (1, 'Hoodies 2019 Poll', '2019-03-01', '2019-07-15', TRUE);
INSERT INTO poll(id_poll, poll_name, poll_date, expiration, active) VALUES (2, 'Jackets 2019 Poll', '2019-03-02', '2019-07-16', TRUE);
INSERT INTO poll(id_poll, poll_name, poll_date, expiration, active) VALUES (3, 'Posters 2019 Poll', '2019-05-03', '2019-09-17', TRUE);
INSERT INTO poll(id_poll, poll_name, poll_date, expiration, active) VALUES (4, 'Posters 2018 Poll', '2018-03-03', '2018-07-17', FALSE);

-- Table: submission
INSERT INTO submission(id_submission, id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (1, 3, 'Submission1', 1, 'Funny submission1', 'https://drive.google.com/open?id=1m-OscV37_51FpkkrAMmu5dUhGGbPtRD_', '2019-01-08', TRUE, 0, FALSE, 1);
INSERT INTO submission(id_submission, id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (2, 12, 'Submissio2', 1, 'Funny submissio2', 'https://drive.google.com/open?id=1m-OscV37_51FpkkrAMmu5dUhGGbPtRD_', '2019-02-08', TRUE, 0, FALSE, 1);
INSERT INTO submission(id_submission, id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (3, 27, 'Submission3', 1, 'Funny submissio3', 'https://drive.google.com/open?id=1m-OscV37_51FpkkrAMmu5dUhGGbPtRD_', '2019-01-06', TRUE, 0, FALSE, 1);
INSERT INTO submission(id_submission, id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (4, 7, 'Submission4', 1, 'Funny submissio4', 'https://drive.google.com/open?id=1m-OscV37_51FpkkrAMmu5dUhGGbPtRD_', '2019-01-01', TRUE, 0, FALSE, 1);
INSERT INTO submission(id_submission, id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (5, 14, 'Submission5', 1, 'Funny submissio5', 'https://drive.google.com/open?id=1m-OscV37_51FpkkrAMmu5dUhGGbPtRD_', '2019-02-04', TRUE, 0, FALSE, 1);
INSERT INTO submission(id_submission, id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (6, 16, 'Submission7', 1, 'Funny submissio7', 'https://drive.google.com/open?id=1m-OscV37_51FpkkrAMmu5dUhGGbPtRD_', '2019-02-11', TRUE, 0, FALSE, 1);
INSERT INTO submission(id_submission, id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (7, 9, 'Submission8', 1, 'Funny submission8', 'https://drive.google.com/open?id=1m-OscV37_51FpkkrAMmu5dUhGGbPtRD_', '2019-01-12', TRUE, 0, FALSE, 1);
INSERT INTO submission(id_submission, id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (8, 32, 'Submission6', 1, 'Funny submissio6', 'https://drive.google.com/open?id=1m-OscV37_51FpkkrAMmu5dUhGGbPtRD_', '2019-01-02', FALSE, 0, FALSE, NULL);

INSERT INTO submission(id_submission, id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (9, 10, 'Submission9', 1, 'Funny submissio9', 'https://drive.google.com/open?id=1m-OscV37_51FpkkrAMmu5dUhGGbPtRD_', '2019-01-04', TRUE, 0, FALSE, 2);
INSERT INTO submission(id_submission, id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (10, 2, 'Submission10', 1, 'Funny submission10', 'https://drive.google.com/open?id=1m-OscV37_51FpkkrAMmu5dUhGGbPtRD_', '2019-02-13', TRUE, 0, FALSE, 2);
INSERT INTO submission(id_submission, id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (11, 10, 'Submission11', 1, 'Funny submissio11', 'https://drive.google.com/open?id=1m-OscV37_51FpkkrAMmu5dUhGGbPtRD_', '2019-02-07', TRUE, 0, FALSE, 2);
INSERT INTO submission(id_submission, id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (12, 2, 'Submission12', 1, 'Funny submission12', 'https://drive.google.com/open?id=1m-OscV37_51FpkkrAMmu5dUhGGbPtRD_', '2019-01-13', TRUE, 0, FALSE, 2);
INSERT INTO submission(id_submission, id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (13, 32, 'Submission13', 1, 'Funny submissio13', 'https://drive.google.com/open?id=1m-OscV37_51FpkkrAMmu5dUhGGbPtRD_', '2019-02-22', FALSE, 0, FALSE, NULL);
INSERT INTO submission(id_submission, id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (14, 33, 'Submission14', 1, 'Funny submissio14', 'https://drive.google.com/open?id=1m-OscV37_51FpkkrAMmu5dUhGGbPtRD_', '2019-02-12', FALSE, 0, FALSE, NULL);

INSERT INTO submission(id_submission, id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (15, 10, 'Submission15', 1, 'Funny submissio15', 'https://drive.google.com/open?id=1m-OscV37_51FpkkrAMmu5dUhGGbPtRD_', '2019-01-06', TRUE, 0, FALSE, 3);
INSERT INTO submission(id_submission, id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (16, 2, 'Submission16', 1, 'Funny submission16', 'https://drive.google.com/open?id=1m-OscV37_51FpkkrAMmu5dUhGGbPtRD_', '2019-02-17', TRUE, 0, FALSE, 3);
INSERT INTO submission(id_submission, id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (17, 10, 'Submission17', 1, 'Funny submissio17', 'https://drive.google.com/open?id=1m-OscV37_51FpkkrAMmu5dUhGGbPtRD_', '2019-01-17', TRUE, 0, FALSE, 3);
INSERT INTO submission(id_submission, id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (18, 2, 'Submission18', 1, 'Funny submission18', 'https://drive.google.com/open?id=1m-OscV37_51FpkkrAMmu5dUhGGbPtRD_', '2019-02-13', TRUE, 0, FALSE, 3);
INSERT INTO submission(id_submission, id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (19, 32, 'Submission19', 1, 'Funny submissio19', 'https://drive.google.com/open?id=1m-OscV37_51FpkkrAMmu5dUhGGbPtRD_', '2019-01-25', TRUE, 0, FALSE, 3);
INSERT INTO submission(id_submission, id_user, submission_name, id_category, submission_description, picture, submission_date, accepted, votes, winner, id_poll) VALUES (20, 32, 'Submission20', 1, 'Funny submissio20', 'https://drive.google.com/open?id=1m-OscV37_51FpkkrAMmu5dUhGGbPtRD_', '2019-02-25', FALSE, 0, FALSE, NULL);