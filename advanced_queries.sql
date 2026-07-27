-- Advanced Questions :

-- Q1. Retrieve the total number of books sold for each genre.

SELECT b.genre, SUM(o.quantity) as total_books_sold
FROM book as b 
JOIN orders as o
on b.book_id = o.book_id
GROUP BY b.genre;


-- Q2. Find the average price of books in the "Fantasy" genre.

SELECT AVG(price) AS average_price
FROM book
WHERE genre = 'Fantasy';



-- Q3. List customers who have placed at least 2 orders.

SELECT c.customer_id, c.name, COUNT(o.order_id) as total_orders 
FROM customers as c
join orders as o
on c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.name
HAVING COUNT(o.order_id) >= 2;
