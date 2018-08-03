CREATE TABLE guest (
  guest_id SERIAL,
  first_name VARCHAR(16),
  last_name VARCHAR(32),
  phone VARCHAR(16),
  email VARCHAR(32),
  PRIMARY KEY (guest_id)
);

INSERT INTO guest 
  (first_name, last_name, phone, email)
VALUES  
  ('John', 'Rzeznik', '111-222-3333', 'googoo@dolls.com'),
  ('Tom', 'DeLong', '222-333-5555', 'blink@ava.com'),
  ('Eddie', 'Vedder', '333-444-7777', 'pearl@jam.com'),
  ('Dave', 'Matthews', '444-555-9999', 'nancies@dmb.com');



CREATE TABLE room (
  room_id INTEGER,
  floor INTEGER,
  number INTEGER,
  price DECIMAL(13,2),
  PRIMARY KEY (room_id)
);

INSERT INTO room
  (room_id, floor, number, price)
VALUES
  (01100, 01, 100, 500.00),
  (02200, 02, 200, 650.00),
  (03300, 03, 300, 800.00);
 
 
 
CREATE TABLE booking (
  booking_id SERIAL,
  guest_id INTEGER,
  room_id INTEGER,
  check_in_date DATE,
  check_out_date DATE,
  PRIMARY KEY (booking_id),
  FOREIGN KEY (room_id) REFERENCES room(room_id) ON DELETE CASCADE,
  FOREIGN KEY (guest_id) REFERENCES guest(guest_id) ON DELETE CASCADE
);

INSERT INTO booking 
  (guest_id, room_id, check_in_date, check_out_date)
VALUES
  ( (SELECT guest_id FROM guest WHERE email = 'googoo@dolls.com'), (SELECT room_id FROM room WHERE number = 100), (CURRENT_DATE + INTERVAL '1 WEEK'), (CURRENT_DATE + INTERVAL '1 WEEK, 2 DAYS') ),
  ( (SELECT guest_id FROM guest WHERE email = 'blink@ava.com'), (SELECT room_id FROM room WHERE number = 200), (CURRENT_DATE + INTERVAL '1 WEEK'), (CURRENT_DATE + INTERVAL '1 WEEK, 2 DAYS') ),
  ( (SELECT guest_id FROM guest WHERE email = 'blink@ava.com'), (SELECT room_id FROM room WHERE number = 200), (CURRENT_DATE + INTERVAL '1 YEAR, 1 WEEK'), (CURRENT_DATE + INTERVAL '1 YEAR, 1 WEEK, 2 DAYS') ),
  ( (SELECT guest_id FROM guest WHERE email = 'pearl@jam.com'), (SELECT room_id FROM room WHERE number = 200), (CURRENT_DATE + INTERVAL '2 WEEK'), (CURRENT_DATE + INTERVAL '2 WEEK, 2 DAYS') ),
  ( (SELECT guest_id FROM guest WHERE email = 'pearl@jam.com'), (SELECT room_id FROM room WHERE number = 300), (CURRENT_DATE + INTERVAL '2 WEEK'), (CURRENT_DATE + INTERVAL '2 WEEK, 2 DAYS') );