CREATE DATABASE bai3_bai_tap;

CREATE TABLE bai3_bai_tap.category (
	category_number VARCHAR(20) NOT NULL UNIQUE,
    category_book VARCHAR(50) NOT NULL,
    PRIMARY KEY (category_number)
);

CREATE TABLE bai3_bai_tap.book (
	book_id VARCHAR(10) NOT NULL,
    book_name VARCHAR(50) NOT NULL,
    publishing_company VARCHAR(50) NOT NULL,
    author VARCHAR(50) NOT NULL,
    publishing_year DATE NOT NULL,
    publication_number VARCHAR(2) NOT NULL,
    book_price VARCHAR(10) NOT NULL,
    book_image LONGBLOB NOT NULL,
    PRIMARY KEY (book_id),
    category_number VARCHAR(50) NOT NULL,
    FOREIGN KEY (category_number)
    REFERENCES bai3_bai_tap.category (category_number)
);

CREATE TABLE bai3_bai_tap.address (
	address VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    PRIMARY KEY (address)
);

CREATE TABLE bai3_bai_tap.borrow_order (
	rent_id VARCHAR(10) NOT NULL UNIQUE,
	rent_day DATE NOT NULL,
    pay_day DATE NOT NULL,
    status_book TEXT NOT NULL,
    PRIMARY KEY (rent_id)
);

CREATE TABLE bai3_bai_tap.student (
	student_number VARCHAR(15) NOT NULL UNIQUE,
    student_name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    image BLOB,
     PRIMARY KEY (student_number),
     rent_id VARCHAR(10) NOT NULL UNIQUE,
     FOREIGN KEY (rent_id) 
     REFERENCES bai3_bai_tap.borrow_order (rent_id),
     FOREIGN KEY (address)
     REFERENCES bai3_bai_tap.address (address)
);

CREATE TABLE bai3_bai_tap.book_student (
	student_number VARCHAR(15) NOT NULL UNIQUE,
    book_id VARCHAR(10) NOT NULL,
    PRIMARY KEY (student_number, book_id),
    FOREIGN KEY (student_number) REFERENCES bai3_bai_tap.student (student_number),
    FOREIGN KEY (book_id) REFERENCES bai3_bai_tap.book (book_id)
);
	