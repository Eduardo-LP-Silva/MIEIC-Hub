CREATE TYPE PackageStatus AS ENUM ('AwaitingPayment', 'Processing', 'InTransit', 'Delivered', 'Canceled');

CREATE TABLE Client 
(
    idUser SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    email TEXT UNIQUE NOT NULL,
    pw TEXT NOT NULL,
    birthDate DATE NOT NULL,
    active BOOLEAN NOT NULL 
);

CREATE TABLE StockManager 
(
    idUser INTEGER PRIMARY KEY REFERENCES Client
);

CREATE TABLE Moderator
(
    idUser INTEGER PRIMARY KEY REFERENCES Client
);

CREATE TABLE SubmissionManager
(
    idUser INTEGER PRIMARY KEY REFERENCES Client
);

CREATE TABLE Category
(
    idCategory SERIAL PRIMARY KEY,
    category TEXT UNIQUE NOT NULL
);

CREATE TABLE Color
(
    idColor SERIAL PRIMARY KEY,
    color TEXT UNIQUE NOT NULL
);

CREATE TABLE Size
(
    idSize SERIAL PRIMARY KEY,
    size TEXT UNIQUE NOT NULL
);

CREATE TABLE Photo 
(
    imagePath TEXT UNIQUE NOT NULL,
    idProduct INTEGER NOT NULL REFERENCES Product PRIMARY KEY
);

CREATE TABLE Product
(
    idProduct SERIAL PRIMARY KEY,
    product TEXT NOT NULL,
    price FLOAT NOT NULL CHECK(price >= 0),
    stock INTEGER NOT NULL CHECK(stock >= 0),
    rating FLOAT NOT NULL CHECK(rating >= 0 AND rating <= 5),
    idCategory INTEGER NOT NULL REFERENCES Category
);

CREATE TABLE ProductColor
(
    idProduct INTEGER NOT NULL REFERENCES Product,
    idColor INTEGER NOT NULL REFERENCES Color,
    PRIMARY KEY (idProduct, idColor) 
);

CREATE TABLE ProductSize
(
    idProduct INTEGER NOT NULL REFERENCES Product,
    idSize INTEGER NOT NULL REFERENCES Size,
    PRIMARY KEY (idProduct, idSize)
);

CREATE TABLE City
(
    idCity SERIAL PRIMARY KEY,
    city TEXT NOT NULL
);

CREATE TABLE DeliveryInfo
(
    idDeliveryInfo SERIAL PRIMARY KEY,
    idCity INTEGER NOT NULL REFERENCES City,
    contact TEXT NOT NULL,
    deliveryAddress TEXT NOT NULL
);

CREATE TABLE Purchase
(
    idPurchase SERIAL PRIMARY KEY,
    idUser INTEGER NOT NULL REFERENCES Client,
    idDeliInfo INTEGER NOT NULL REFERENCES DeliveryInfo,
    purchaseDate DATE NOT NULL,
    total FLOAT NOT NULL CHECK(total >= 0),
    status PackageStatus NOT NULL
);

CREATE TABLE ProductPurchase
(
    idProduct INTEGER NOT NULL REFERENCES Product,
    idPurchase INTEGER NOT NULL REFERENCES Purchase,
    quantity INTEGER NOT NULL CHECK(quantity > 0),
    price FLOAT NOT NULL CHECK(price >= 0),
    idSize INTEGER REFERENCES Size,
    idColor INTEGER REFERENCES Color,
    PRIMARY KEY (idProduct, idPurchase)
);

CREATE TABLE Review
(
    idUser INTEGER NOT NULL REFERENCES Client,
    idProduct INTEGER NOT NULL REFERENCES Product,
    comment TEXT NOT NULL,
    reviewDate DATE NOT NULL,
    rating INTEGER NOT NULL CHECK(rating > 0 AND rating <= 5),
    PRIMARY KEY (idUser, idProduct)
);

CREATE TABLE Cart
(
    idUser INTEGER NOT NULL REFERENCES Client,
    idProduct INTEGER NOT NULL REFERENCES Product,
    quantity INTEGER NOT NULL CHECK(quantity > 0),
    PRIMARY KEY (idUser, idProduct)
);

CREATE TABLE Wishlist
(
    idUser INTEGER NOT NULL REFERENCES Client,
    idProduct INTEGER NOT NULL REFERENCES Product,
    PRIMARY KEY (idUser, idProduct)
);

CREATE TABLE FAQ
(
    idQuestion SERIAL PRIMARY KEY,
    question TEXT UNIQUE NOT NULL,
    answer TEXT NOT NULL 
);

CREATE TABLE Poll
(
    idPoll SERIAL PRIMARY KEY,
    poll TEXT UNIQUE NOT NULL,
    pollDate DATE NOT NULL,
    expiration DATE NOT NULL,
    active BOOLEAN NOT NULL
);

CREATE TABLE Submission
(
    idSubmission SERIAL PRIMARY KEY,
    idUser INTEGER NOT NULL REFERENCES Client,
    submission TEXT NOT NULL,
    idCategory INTEGER NOT NULL REFERENCES Category,
    submissionDescription TEXT NOT NULL,
    picture TEXT NOT NULL,
    submissionDate DATE NOT NULL,
    accepted BOOLEAN NOT NULL,
    votes INTEGER NOT NULL CHECK(votes >= 0),
    winner BOOLEAN NOT NULL,
    idPoll INTEGER NOT NULL REFERENCES Poll
);

CREATE TABLE ClientSubVote
(
    idUser INTEGER NOT NULL REFERENCES Client,
    idSub INTEGER NOT NULL REFERENCES Submission,
    PRIMARY KEY (idUser, idSub)
);





