DROP TABLE bookings;
DROP TABLE members;
DROP TABLE sessions;

CREATE TABLE sessions
(id SERIAL primary key,
name VARCHAR(255),
genre VARCHAR(255),
capacity INT
-- time,
-- date
);

CREATE TABLE members
(id SERIAL primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  premium BOOLEAN NOT NULL
);

CREATE TABLE bookings
(id SERIAL primary key,
member_id INT references members(id) ON DELETE CASCADE,
session_id INT references sessions(id) ON DELETE CASCADE
);
