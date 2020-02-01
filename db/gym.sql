DROP TABLE bookings;
DROP TABLE members;
DROP TABLE classes;

CREATE TABLE classes
(id SERIAL primary key,
name VARCHAR(255),
genre VARCHAR(255),
capacity INT,
-- time,
-- date
);

CREATE TABLE members
(id SERIAL primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  premium BOOLEAN
);

CREATE TABLE bookings
(id SERIAL primary key,
member_id INT references members(id) ON DELETE CASCADE,
class_id INT references classes(id) ON DELETE CASCADE
);
