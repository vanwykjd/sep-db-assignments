CREATE TABLE student (
  id SERIAL,
  first_name VARCHAR(16),
  last_name VARCHAR(32), 
  home_phone VARCHAR(16),
  emergency_phone VARCHAR(16),
  PRIMARY KEY (id)
);

INSERT INTO student 
  (first_name, last_name, home_phone, emergency_phone)
VALUES
  ('John', 'Rzeznik', '111-222-3333', '222-333-5555'),
  ('Tom', 'DeLong', '222-333-5555', '111-222-3333'),
  ('Eddie', 'Vedder', '333-444-7777', '444-555-9999'),
  ('Dave', 'Matthews', '444-555-9999', '333-444-7777'),
  ('Rob', 'Thomas', '555-333-8888', '111-222-3333');
  
  

CREATE TABLE class (
  id SERIAL,
  subject VARCHAR(16),
  PRIMARY KEY (id)
);

INSERT INTO class 
  (subject)
VALUES
  ('Intro to Music'),
  ('Band'),
  ('Chorus'),
  ('Math'),
  ('English');
  

CREATE TABLE grade_report (
  id SERIAL,
  student_id INTEGER,
  class_id INTEGER,
  grade VARCHAR(8),
  PRIMARY KEY (id),
  FOREIGN KEY (student_id) REFERENCES student(id),
  FOREIGN KEY (class_id) REFERENCES class(id)
);

INSERT INTO grade_report 
  ( student_id, class_id, grade )
VALUES 
  ( (SELECT id FROM student WHERE last_name = 'DeLong'), (SELECT id FROM class WHERE subject = 'Intro to Music'), 'A'),
  ( (SELECT id FROM student WHERE last_name = 'DeLong'), (SELECT id FROM class WHERE subject = 'Chorus'), 'A'),
  ( (SELECT id FROM student WHERE last_name = 'DeLong'), (SELECT id FROM class WHERE subject = 'Math'), 'B'),
  ( (SELECT id FROM student WHERE last_name = 'DeLong'), (SELECT id FROM class WHERE subject = 'English'), 'B'),
  
  ( (SELECT id FROM student WHERE last_name = 'Rzeznik'), (SELECT id FROM class WHERE subject = 'Band'), 'B'),
  ( (SELECT id FROM student WHERE last_name = 'Rzeznik'), (SELECT id FROM class WHERE subject = 'Chorus'), 'A'),
  ( (SELECT id FROM student WHERE last_name = 'Rzeznik'), (SELECT id FROM class WHERE subject = 'Math'), 'D'),
  ( (SELECT id FROM student WHERE last_name = 'Rzeznik'), (SELECT id FROM class WHERE subject = 'English'), 'B'),
  
  ( (SELECT id FROM student WHERE last_name = 'Vedder'), (SELECT id FROM class WHERE subject = 'Band'), 'A'),
  ( (SELECT id FROM student WHERE last_name = 'Vedder'), (SELECT id FROM class WHERE subject = 'Chorus'), 'B'),
  ( (SELECT id FROM student WHERE last_name = 'Vedder'), (SELECT id FROM class WHERE subject = 'Math'), 'C'),
  ( (SELECT id FROM student WHERE last_name = 'Vedder'), (SELECT id FROM class WHERE subject = 'English'), 'D'),
  
  ( (SELECT id FROM student WHERE last_name = 'Matthews'), (SELECT id FROM class WHERE subject = 'Band'), 'A'),
  ( (SELECT id FROM student WHERE last_name = 'Matthews'), (SELECT id FROM class WHERE subject = 'Chorus'), 'C'),
  ( (SELECT id FROM student WHERE last_name = 'Matthews'), (SELECT id FROM class WHERE subject = 'Math'), 'A'),
  ( (SELECT id FROM student WHERE last_name = 'Matthews'), (SELECT id FROM class WHERE subject = 'English'), 'A'),
  
  ( (SELECT id FROM student WHERE last_name = 'Thomas'), (SELECT id FROM class WHERE subject = 'Band'), 'B'),
  ( (SELECT id FROM student WHERE last_name = 'Thomas'), (SELECT id FROM class WHERE subject = 'Chorus'), 'A'),
  ( (SELECT id FROM student WHERE last_name = 'Thomas'), (SELECT id FROM class WHERE subject = 'Math'), 'F'),
  ( (SELECT id FROM student WHERE last_name = 'Thomas'), (SELECT id FROM class WHERE subject = 'English'), 'B');