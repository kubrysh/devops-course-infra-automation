CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    birthdate DATE,
    nationality VARCHAR(50)
);

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200),
    author_id INT REFERENCES authors(id),
    genre VARCHAR(100),
    published_year INT,
    available BOOLEAN DEFAULT TRUE
);

CREATE TABLE borrowers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

CREATE TABLE loans (
    id SERIAL PRIMARY KEY,
    book_id INT REFERENCES books(id),
    borrower_id INT REFERENCES borrowers(id),
    loan_date DATE DEFAULT CURRENT_DATE,
    return_date DATE
);

INSERT INTO authors (first_name, last_name, birthdate, nationality) VALUES
('J.K.', 'Rowling', '1965-07-31', 'British'),
('George', 'Orwell', '1903-06-25', 'British'),
('J.R.R.', 'Tolkien', '1892-01-03', 'British');

INSERT INTO books (title, author_id, genre, published_year, available) VALUES
('Harry Potter and the Philosopher''s Stone', 1, 'Fantasy', 1997, TRUE),
('1984', 2, 'Dystopian', 1949, TRUE),
('The Hobbit', 3, 'Fantasy', 1937, TRUE);

INSERT INTO borrowers (first_name, last_name, email, phone) VALUES
('Alice', 'Green', 'alice.green@example.com', '1234567890'),
('Bob', 'White', 'bob.white@example.com', '0987654321'),
('Charlie', 'Brown', 'charlie.brown@example.com', '1122334455');

INSERT INTO loans (book_id, borrower_id, loan_date, return_date) VALUES
(1, 1, '2024-05-01', '2024-05-15'),
(2, 2, '2024-05-03', '2024-05-10'),
(3, 3, '2024-05-05', NULL);

CREATE TABLE my_table (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO my_table (name) VALUES
('Bob'),
('Alice'),
('James');

CREATE PUBLICATION my_pub FOR TABLE my_table;
