/* Write a command that makes the table to track the wedding.*/

CREATE TABLE guest_list (
    last_name varchar,
    first_name varchar,
    rsvp boolean,
    adults smallint,
    children smallint,
    meals numeric(3,1)
 );
 
INSERT INTO guest_list
    (last_name, first_name, rsvp, adults, children, meals )
VALUES
    ('Smith', 'John', TRUE, 2, 1, 2.5),
    ('Doe', 'Jane', FALSE, 0, 0, 0),
    ('Peterson', 'Peter', TRUE, 1, 0, 1);
  


/* Using the table we just created, write a command that adds a column to track whether they were sent a thank you card.*/

ALTER TABLE guest_list
ADD COLUMN thank_you_sent boolean DEFAULT FALSE;



/* You have decided to move the data about the meals to another table, so write a command to remove the column storing the number meals from the wedding table.*/

ALTER TABLE guest_list
DROP COLUMN meals;



/* The guests are going to need a place to sit at the reception, so write a command that adds a column for table number.*/

ALTER TABLE guest_list
ADD COLUMN table_number smallint;



/* The wedding is over and we do not need to keep this information, so write a command that deletes the wedding table from the database.*/

DROP TABLE guest_list;