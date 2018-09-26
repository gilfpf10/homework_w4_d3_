DROP TABLE students;
DROP TABLE houses;


CREATE TABLE houses(
id SERIAL8 primary key,
house_name VARCHAR(255)

);

CREATE TABLE students(
id serial8 primary key,
first_name VARCHAR(255),
second_name VARCHAR(255),
house_id INT8 REFERENCES houses(id),
age INT4
);
