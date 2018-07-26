/* Write a command to make a new table to hold spacecrafts. Information should include id, name, year launched, country of origin, a brief description of the mission, orbiting body, if it is currently operating, and approximate miles from Earth. */

CREATE TABLE spacecraft (
  COSPAR_ID varchar,
  name varchar,
  launch_date date,
  country varchar,
  mission text,
  orbit varchar,
  active boolean,
  miles_from_earth bigint
);

/* Add 3 non-Earth-orbiting satellites to the table. */

INSERT INTO spacecraft 
  (COSPAR_ID, name, launch_date, country, mission, orbit, active, miles_from_earth)
VALUES
    ('2009-031A', 'Lunar Reconnaissance Orbiter', 'June 18, 2009, 21:32:00 UTC', 'United States', 'Identifying safe landing sites, locating potential resources on the Moon', 'Moon', TRUE, 252000 ),
    ('2010-020D', 'Akatsuki', '20 May 2010, 21:58:22 UTC', 'Japan', 'Study the atmosphere of Venus', 'Venus', TRUE, 25700000),
    ('2003-022A', 'Mars Express', '2 June 2003, 17:45 UTC', 'Russia', 'Study of the interior, subsurface, surface and atmosphere, and environment of the planet Mars', 'Mars', TRUE,  33900000);
    
/* Remove one of the satellites from the table since it has just been crashed into the planet. */

DELETE FROM spacecraft 
WHERE COSPAR_ID = '2003-022A';


/* Edit another satellite because it is no longer operating and change the value to reflect that. */

UPDATE spacecraft
SET active = FALSE
WHERE COSPAR_ID = '2010-020D';