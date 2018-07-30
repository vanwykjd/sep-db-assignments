CREATE TABLE adoptions(
  "id"      INTEGER,
  "adopter" VARCHAR(32),
  "cat"     VARCHAR(16),
  "date"    DATE,
  "fee"     DECIMAL(13,4)
);

INSERT INTO adoptions
  ("id",   "adopter",          "cat",         "date",      "fee")
VALUES
  ( 10034, 'Argus Filch',      'Mrs. Norris', '1987-07-14', 40),
  ( 10037, 'Arabella Figg',    'Tufty',       '1988-05-03', 20),
  ( 10040, 'Arabella Figg',    'Snowy',       '1989-11-29', 35),
  ( 10054, 'Arabella Figg',    'Mr. Tibbles', '1990-02-18', 30),
  ( 10055, 'Arabella Figg',    'Mr. Paws',    '1990-02-18', 30),
  ( 10093, 'Hermione Granger', 'Crookshanks', '1993-08-31', 10);