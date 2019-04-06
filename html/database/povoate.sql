PRAGMA foreign_keys = on;

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
