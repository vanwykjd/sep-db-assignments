/* Write a command to make a new table to hold the books in a library with the columns ISBN, title, author, genre, publishing date, number of copies, and available copies.*/

CREATE TABLE books (
    isbn numeric(13),
    title text,
    author text,
    genre text,
    pub_date date,
    copies int,
    available int
);



/* Find three books and add their information to the table.*/

INSERT INTO books 
    (isbn, title, author, genre, pub_date, copies, available) 
VALUES
    (9788854139343, 'Ulysses', 'James Joyce', 'Modernist', 'February 12 1922', 5, 3),
    (9780446605236, 'The Notebook', 'Nicholas Sparks', 'Romance', 'June 25, 2004', 10, 2),
    (9780811874557, 'All My Friends Are Dead', 'Jory John', 'Humor', 'June 30 2010', 3, 1);
  
  
  
/* Someone has just checked out one of the books. Change the available copies column to 1 fewer.*/
  
UPDATE books 
SET available = available - 1 WHERE isbn=9780811874557;
  
  
  
/* Now one of the books has been added to the banned books list. Remove it from the table.*/

DELETE FROM books
WHERE isbn=9780446605236;