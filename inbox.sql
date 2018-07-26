/* Write a command to make a new table to hold the emails in your inbox. This table should include an id, the subject line, the sender, any additional recipients, the body of the email, the timestamp, whether or not it’s been read, and the id of the email chain it’s in.*/

CREATE TABLE inbox (
    ID serial,
    subject varchar,
    sender varchar,
    cc varchar,
    body text,
    time_sent timestamp,
    read boolean,
    group_id int
);



/* Add 3 new emails to the inbox.*/

INSERT INTO inbox
    (subject, sender, cc, body, time_sent, read, group_id)
VALUES
    ('Fantasy Draft',
     'sports-fantasy-replies@sports.yahoo.com',
     'blueDave@gmail.com, buzzyflo@aol.com',
     'Yahoo Sports Fantasy Football. Your commissioner has updated your draft date.',
     'July 25, 2018 7:29 AM',
     FALSE,
     632),
    ('Golf Brackets',
     'schmidm@yahoo.com',
     'longjerem@gmail.com, buzzyflo@aol.com',
     'See attached for file that updates, note that if you are like me and didn''t have 3 people make the cut this sheet is not accurate until the tournament is over.',
     'July 21, 2018 8:56 AM',
     TRUE,
     625),
    ('Tomorrow''s meeting',
     'jackwhite@yahoo.com',
     'jonlong@email.com, ryanmoore@aol.com, bluedave@gmail.com',
     'Meeting for tomorrow hsa been confirmed',
     'July 18, 2018 10:42 AM',
      TRUE,
      325);
    
    
    
/* You’ve just deleted one of the emails, so write a command to remove the row from the inbox table.*/

 DELETE FROM inbox
 WHERE id = 3;
 
 
 
 /* You started reading an email but just heard a crash in another room. Mark the email as unread before investigating, so you can come back to it later.*/
 
 UPDATE inbox
 SET read = FALSE
 WHERE id = 2;