
-- Connection URL: jdbc:oracle:driver_type:[username/password]@database_specifier
-- Oracle XE 11g: jdbc:oracle:thin:@localhost:1521:XE

CREATE TABLE customer (
    customer_id NUMBER NOT NULL,
    first_name VARCHAR2(16) NOT NULL,
    last_name VARCHAR2(16) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    phone VARCHAR2(17) NOT NULL,
    CONSTRAINT customers_pk PRIMARY KEY (customer_id)
);

CREATE TABLE book (
    isbn CHAR(12) NOT NULL,
    title VARCHAR2(40),
    pub_date DATE NOT NULL,
    format VARCHAR2(12),
    price NUMBER(9, 2),
    CONSTRAINT book_pk PRIMARY KEY (isbn)
);

CREATE TABLE author (
    author_id NUMBER NOT NULL,
    first_name VARCHAR2(16) NOT NULL,
    last_name VARCHAR2(16) NOT NULL,
    CONSTRAINT author_pk PRIMARY KEY (author_id)
);

CREATE TABLE book_by_author (
    author_id NUMBER NOT NULL,
    isbn CHAR(12) NOT NULL,
    CONSTRAINT book_by_author_fk_author
        FOREIGN KEY (author_id)
        REFERENCES author (author_id),
    CONSTRAINT book_by_author_fk_book
        FOREIGN KEY (isbn)
        REFERENCES book (isbn)
);

-- Insert table: customer
INSERT INTO customer VALUES (5000, 'John', 'Smith', 'john.smith@verizon.new', '555-340-1230');
INSERT INTO customer VALUES (5001, 'Mary', 'Johnson', 'mary.johnson@comcost.net', '555-123-4567');
INSERT INTO customer VALUES (5002, 'Bob', 'Collins', 'bob.collins@yahoo.com', '555-012-3456');
INSERT INTO customer VALUES (5003, 'Rebecca', 'Mayer', 'rebecca.mayer@gmail.com', '555-205-8212');
INSERT INTO customer VALUES (5006, 'Anthony', 'Clark', 'anthony.clark@gmail.com', '555-256-1901');
INSERT INTO customer VALUES (5007, 'Judy', 'Sousa', 'judy.sousa@verizon.com', '555-751-1207');
INSERT INTO customer VALUES (5008, 'Christopher', 'Patriquin', 'christopher.patriquin.@yahoo.com', '555-316-1803');
INSERT INTO customer VALUES (5009, 'Deborah', 'Smith', 'deborah.smith@comcast.net', '555-256-3421');
INSERT INTO customer VALUES (5010, 'Jennifer', 'McGinn', 'jennifer.mcginn@comcast.net', '555-250-0918');

-- Insert table: book
INSERT INTO book VALUES ('142311339X', 'The Lost Hero(Heroes of Olympus, Book 1)', TO_DATE('2010-1--12', 'yyyy-mm-dd'), 'Hardcover', 10.95);
INSERT INTO book VALUES ('0689852223', 'The House of the Scorpion', TO_DATE('2002-01-01', 'yyyy-mm-dd'), 'Hardcover', 16.95);
INSERT INTO book VALUES ('0525423656', 'Crossed (Matched Trilogy, Book 2', TO_DATE('2011-11-01', 'yyyy-mm-dd'), 'Hardcover', 12.95);
INSERT INTO book VALUES ('1423153627', 'The Kane Chronicles Survival Guide', TO_DATE('2012-03-01', 'yyyy-mm-dd'), 'Hardcover', 16.95);
INSERT INTO book VALUES ('0439371112', 'Howliday Inn', TO_DATE('2001-11-01', 'yyyy-mm-dd'), 'Paperback', 14.95);
INSERT INTO book VALUES ('0439861306', 'The Lightning Thief', TO_DATE('2006-03-12', 'yyyy-mm-dd'), 'Paperback', 11.95);
INSERT INTO book VALUES ('031673737X', 'How to Train Your Dragon', TO_DATE('2010-02-01', 'yyyy-mm-dd'), 'Hardcover', 10.95);
INSERT INTO book VALUES ('0545078059', 'The White Giraffe', TO_DATE('2008-05-01', 'yyyy-mm-dd'), 'Paperback', 6.95);
INSERT INTO book VALUES ('0803733428', 'The Last Leopard', TO_DATE('2009-03-05', 'yyyy-mm-dd'), 'Hardcover', 13.95);
INSERT INTO book VALUES ('9780545236', 'Freaky Monday', TO_DATE('2010-01-15', 'yyyy-mm-dd'), 'Paperback', 12.95);

-- Insert table: author
INSERT INTO author VALUES (1000, 'Rick', 'Riordan');
INSERT INTO author VALUES (1001, 'Nancy', 'Farmer');
INSERT INTO author VALUES (1002, 'Ally', 'Condie');
INSERT INTO author VALUES (1003, 'Cressida', 'Cowell');
INSERT INTO author VALUES (1004, 'Lauren', 'St. John');
INSERT INTO author VALUES (1005, 'Eoin', 'Colfer');
INSERT INTO author VALUES (1006, 'Esther', 'Freisner');
INSERT INTO author VALUES (1007, 'Chris', 'D''lacey');
INSERT INTO author VALUES (1008, 'Mary', 'Rodgers');
INSERT INTO author VALUES (1009, 'Healther', 'Hatch');

-- Insert table: book_by_author
INSERT INTO book_by_author VALUES (1000, '142311339X');
INSERT INTO book_by_author VALUES (1001, '0689852223');
INSERT INTO book_by_author VALUES (1002, '0525423656');
INSERT INTO book_by_author VALUES (1000, '1423153627');
INSERT INTO book_by_author VALUES (1003, '031673737X');
INSERT INTO book_by_author VALUES (1004, '0545078059');
INSERT INTO book_by_author VALUES (1004, '0803733428');
INSERT INTO book_by_author VALUES (1008, '9780545236');
INSERT INTO book_by_author VALUES (1009, '9780545236');

COMMIT;
