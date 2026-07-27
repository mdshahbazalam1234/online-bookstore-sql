CREATE TABLE book (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    genre VARCHAR(50),
    published_year INT,
    price NUMERIC(10, 2),
    stock INT
);

DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);


DROP TABLE IF EXISTS orders;

CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Book(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);


select * from book;
select * from customers;
select * from orders ;


-- Q1. Retrieve all books in the "Fiction" genre

SELECT *
FROM book
WHERE genre = 'Fiction';


-- Q2. Find books published after the year 1950

SELECT * FROM book 
WHERE published_year > 1990 ;


-- Q3. List all customers from Canada

SELECT *FROM customers
WHERE country = 'Canada';


-- Q4. Show orders placed in November 2023.

SELECT *FROM orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';


-- Q5. Retrieve the total stock of books available.

SELECT SUM(stock) AS total_stock
FROM book;


-- Q6. Find the details of the most expensive book

SELECT *
FROM book
ORDER BY price DESC
LIMIT 1;


-- Q7. Show all customers who ordered more than 1 quantity of a book

SELECT *
FROM orders
WHERE quantity > 1;


-- Q8. Retrieve all orders where the total amount exceeds $20

SELECT *
FROM orders
WHERE total_amount > 20;


-- Q9. List all genres available in the book table

SELECT DISTINCT genre FROM book 
ORDER BY genre;


-- Q10. Find the book with the lowest stock

SELECT * from book
order by stock ASC 
LIMIT 1;

-- Q11. Calculate the total revenue generated from all orders

SELECT sum(total_amount) 
as total_revenue 
FROM orders ;
